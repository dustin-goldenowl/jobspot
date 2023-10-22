import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/stream_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/education_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart';

@injectable
class StreamEducationUseCase
    extends StreamUseCase<DataState<List<EducationEntity>>, dynamic> {
  final ApplicantProfileRepository _repository;

  StreamEducationUseCase(this._repository);

  @override
  Stream<DataState<List<EducationEntity>>> call({params}) {
    return _repository.getEducation();
  }
}
