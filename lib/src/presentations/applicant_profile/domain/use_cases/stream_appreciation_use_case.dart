import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/stream_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/appreciation_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart';

@lazySingleton
class StreamAppreciationUseCase
    extends StreamUseCase<DataState<List<AppreciationEntity>>, dynamic> {
  final ApplicantProfileRepository _repository;

  StreamAppreciationUseCase(this._repository);

  @override
  Stream<DataState<List<AppreciationEntity>>> call({params}) {
    return _repository.getAppreciation();
  }
}
