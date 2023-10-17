import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/stream_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

@lazySingleton
class GetListPostUseCase
    extends StreamUseCase<DataState<List<PostEntity>>, int> {
  final ApplicantProfileRepository _repository;

  GetListPostUseCase(this._repository);

  @override
  Stream<DataState<List<PostEntity>>> call({required int params}) {
    return _repository.getListPost(params);
  }
}
