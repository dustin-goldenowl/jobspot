import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_post/domain/entities/post_entity.dart';

abstract class AddPostRepository {
  Future<DataState> addPost(PostEntity post);
}
