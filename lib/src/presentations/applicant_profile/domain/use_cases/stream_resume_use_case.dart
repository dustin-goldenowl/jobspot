import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/stream_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart';

@lazySingleton
class StreamResumeUseCase
    extends StreamUseCase<DataState<List<ResumeEntity>>, dynamic> {
  final ApplicantProfileRepository _repository;

  StreamResumeUseCase(this._repository);

  @override
  Stream<DataState<List<ResumeEntity>>> call({params}) {
    return _repository.getResume();
  }
}
