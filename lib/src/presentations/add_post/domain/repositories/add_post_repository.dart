import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_post/domain/entities/add_post_entity.dart';
import 'package:jobspot/src/presentations/add_post/domain/entities/update_post_entity.dart';

abstract class AddPostRepository {
  Future<DataState> addPost(AddPostEntity post);

  Future<DataState> updatePost(UpdatePostEntity post);
}
