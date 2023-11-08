import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/add_job/data/models/add_job_model.dart';
import 'package:jobspot/src/presentations/add_job/data/models/update_job_model.dart';
import 'package:jobspot/src/presentations/add_job/domain/entities/add_job_entity.dart';
import 'package:jobspot/src/presentations/add_job/domain/entities/update_job_entity.dart';
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart';

@LazySingleton(as: AddJobRepository)
class AddJobRepositoryImpl extends AddJobRepository {
  @override
  Future<DataState> addJob(AddJobEntity job) async {
    try {
      final firestore = XCollection.job.doc();
      AddJobModel postModel = AddJobModel.fromJobEntity(job);
      await firestore.set(postModel.toJson());
      return DataSuccess(true);
    } catch (e) {
      print(e.toString());
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState> updateJob(UpdateJobEntity job) async {
    try {
      final firestore = XCollection.job.doc(job.id);
      UpdateJobModel postModel = UpdateJobModel.fromJobEntity(job);
      await firestore.update(postModel.toJson());
      return DataSuccess(true);
    } catch (e) {
      print(e.toString());
      return DataFailed(e.toString());
    }
  }
}
