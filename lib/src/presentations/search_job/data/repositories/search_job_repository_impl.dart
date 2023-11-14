import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/get_list_company_use_case.dart';
import 'package:jobspot/src/presentations/search_job/domain/entity/search_entity.dart';
import 'package:jobspot/src/presentations/search_job/domain/entity/search_job_data.dart';
import 'package:jobspot/src/presentations/search_job/domain/repositories/search_job_repository.dart';
import 'package:jobspot/src/presentations/view_job/data/models/job_model.dart';

@LazySingleton(as: SearchJobRepository)
class SearchJobRepositoryImpl extends SearchJobRepository {
  final GetListCompanyUseCase _getListCompanyUseCase;

  SearchJobRepositoryImpl(this._getListCompanyUseCase);

  @override
  Future<DataState<SearchJobData>> searchJob(SearchEntity entity) async {
    try {
      Query<Map<String, dynamic>> jobQuery = getJobQuery(entity);
      final response = await Future.wait([
        jobQuery.limit(entity.limit).get(),
        jobQuery.count().get(),
      ]);

      List<JobModel> listJob =
          (response.first as QuerySnapshot<Map<String, dynamic>>)
              .docs
              .map((e) => JobModel.fromDocumentSnapshot(e))
              .toList();
      if (entity.salary != null) {
        listJob = listJob
            .where((e) =>
                e.salary >= entity.salary!.start &&
                e.salary <= entity.salary!.end)
            .toList();
      }
      listJob = filterDate(listJob: listJob, index: entity.lastUpdate);
      final count = (response.last as AggregateQuerySnapshot).count;
      final listCompany = await _getListCompanyUseCase.call(
          params: listJob.map((e) => e.owner).toSet());
      listJob = listJob
          .map(
            (e) => e.copyWith(
              company:
                  listCompany.firstWhere((element) => element.id == e.owner),
            ),
          )
          .toList();
      return DataSuccess(SearchJobData(
        isMore: entity.limit < count,
        listJob: listJob.map((e) => e.toJobEntity()).toList(),
        limit: entity.limit < count ? entity.limit : count,
      ));
    } catch (e) {
      log(e.toString());
      return DataFailed(e.toString());
    }
  }

  List<JobModel> filterDate({
    required List<JobModel> listJob,
    required int index,
  }) {
    final now = DateTime.now();
    switch (index) {
      case 0:
        return listJob
            .where((element) =>
                now.difference(element.startDate).inHours < 24 &&
                element.endDate.difference(now).inSeconds > 0)
            .toList();
      case 1:
        return listJob
            .where((element) =>
                now.difference(element.startDate).inDays > 7 &&
                now.difference(element.startDate).inDays < 14 &&
                element.endDate.difference(now).inSeconds > 0)
            .toList();
      case 2:
        return listJob
            .where((element) =>
                now.difference(element.startDate).inDays > 30 &&
                now.difference(element.startDate).inDays < 60 &&
                element.endDate.difference(now).inSeconds > 0)
            .toList();
      default:
        return listJob;
    }
  }

  Query<Map<String, dynamic>> getJobQuery(SearchEntity entity) {
    Query<Map<String, dynamic>> jobQuery = XCollection.job.where(
      "position",
      isGreaterThanOrEqualTo: entity.query.toLowerCase(),
      isLessThan: '${entity.query.toLowerCase()}z',
    );
    if (entity.location != null) {
      jobQuery = jobQuery.where("location", isEqualTo: entity.location);
    }
    if (entity.jobType != null) {
      jobQuery = jobQuery.where("jobType", isEqualTo: entity.jobType);
    }
    if (entity.level != null) {
      jobQuery = jobQuery.where("level", isEqualTo: entity.level);
    }
    if (entity.typeWorkplace != null) {
      jobQuery =
          jobQuery.where("typeWorkplace", isEqualTo: entity.typeWorkplace);
    }
    return jobQuery;
  }
}
