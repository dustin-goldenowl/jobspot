import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/stream_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/get_post_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

@lazySingleton
class StreamListPostUseCase
    extends StreamUseCase<DataState<List<PostEntity>>, GetPostEntity> {
  final ApplicantProfileRepository _repository;

  StreamListPostUseCase(this._repository);

  @override
  Stream<DataState<List<PostEntity>>> call({required GetPostEntity params}) {
    return _repository.getListPost(params);
  }
}
