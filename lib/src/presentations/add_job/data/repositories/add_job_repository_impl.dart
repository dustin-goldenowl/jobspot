import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_job/data/models/job_model.dart';
import 'package:jobspot/src/presentations/add_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart';

@LazySingleton(as: AddJobRepository)
class AddJobRepositoryImpl extends AddJobRepository {
  @override
  Future<DataState> addJob(JobEntity job) async {
    try {
      final firestore = FirebaseFirestore.instance.collection("jobs").doc();
      JobModel postModel = JobModel.fromPostEntity(job);
      await firestore.set(postModel.toJson());
      return DataSuccess(true);
    } catch (e) {
      print(e.toString());
      return DataFailed(e.toString());
    }
  }
}
