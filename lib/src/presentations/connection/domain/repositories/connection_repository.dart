import 'dart:async';

import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/fetch_lazy_data.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

abstract class ConnectionRepository {
  Stream<DataState<FetchLazyData<PostEntity>>> fetchPostData(int limit);
}
