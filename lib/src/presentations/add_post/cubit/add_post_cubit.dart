import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/permission_service.dart';
import 'package:jobspot/src/presentations/add_post/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/add_post/domain/entities/update_post_entity.dart';
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart';
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart';

part 'add_post_state.dart';

@injectable
class AddPostCubit extends Cubit<AddPostState> {
  final AddPostUseCase _addPostUseCase;
  final UpdatePostUseCase _updatePostUseCase;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String? _postID;
  bool _isEdit = false;

  bool get isEdit => _isEdit;

  AddPostCubit(this._addPostUseCase, this._updatePostUseCase)
      : super(AddPostState.ds());

  void initUpdatePost(UpdatePostEntity? post) {
    if (post != null) {
      titleController.text = post.title;
      descriptionController.text = post.description;
      _postID = post.id;
      _isEdit = true;
      emit(state.copyWith(images: post.images));
    }
  }

  Future addPost() async {
    emit(state.copyWith(isLoading: true));
    final response = await _addPostUseCase.call(
        params: PostEntity(
      title: titleController.text,
      description: descriptionController.text,
      images: state.images,
    ));
    emit(state.copyWith(dataState: response));
  }

  Future updatePost() async {
    emit(state.copyWith(isLoading: true));
    final response = await _updatePostUseCase.call(
        params: UpdatePostEntity(
      id: _postID!,
      title: titleController.text,
      description: descriptionController.text,
      images: state.images,
      removeImages: state.removeImages,
    ));
    emit(state.copyWith(dataState: response));
  }

  Future pickImageFromGallery() async {
    bool result = await PermissionService.requestPhotoPermission();
    if (result) {
      final ImagePicker picker = ImagePicker();
      final List<XFile> images = await picker.pickMultiImage();
      if (images.isNotEmpty) {
        final list = [...state.images, ...images.map((e) => e.path)];
        emit(state.copyWith(images: list));
      }
    }
  }

  Future pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      final list = [...state.images, image.path];
      emit(state.copyWith(images: list));
    }
  }

  void removeImage(int index) {
    final list = [...state.images];
    list.removeAt(index);
    final listRemove = [...state.removeImages];
    if (state.images[index].isLink) listRemove.add(state.images[index]);
    emit(state.copyWith(images: list, removeImages: listRemove));
  }
}
