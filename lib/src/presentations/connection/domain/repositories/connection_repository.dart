import 'dart:async';

import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/fetch_lazy_data.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/share_post_base.dart';

abstract class ConnectionRepository {
  Stream<DataState<FetchLazyData<PostEntity>>> fetchPostData(int limit);

  Future<DataState<bool>> sharePost(SharePostBase entity);
}
