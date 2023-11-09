import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/share_post_base.dart';
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart';

@lazySingleton
class SharePostUseCase extends UseCase<DataState<bool>, SharePostBase> {
  final ConnectionRepository _repository;

  SharePostUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required SharePostBase params}) {
    return _repository.sharePost(params);
  }
}
