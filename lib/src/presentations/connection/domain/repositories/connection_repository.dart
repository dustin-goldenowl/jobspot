import 'dart:async';

import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/fetch_post_data.dart';

abstract class ConnectionRepository {
  Stream<DataState<FetchPostData>> fetchPostData(int limit);
}
