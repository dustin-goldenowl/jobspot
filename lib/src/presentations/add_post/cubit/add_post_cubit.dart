import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/permission_service.dart';
import 'package:jobspot/src/presentations/add_post/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/add_post/domain/use_case/add_post_use_case.dart';

part 'add_post_state.dart';

@injectable
class AddPostCubit extends Cubit<AddPostState> {
  final AddPostUseCase _addPostUseCase;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  AddPostCubit(this._addPostUseCase)
      : super(const AddPostState(isLoading: false, images: []));

  Future addPost() async {
    emit(state.copyWith(isLoading: true));
    final response = await _addPostUseCase.call(
        params: PostEntity(
      title: titleController.text,
      description: descriptionController.text,
      images: state.images.map((e) => e.path).toList(),
    ));
    emit(state.copyWith(dataState: response));
  }

  Future pickImageFromGallery() async {
    bool result = await PermissionService.requestPhotoPermission();
    if (result) {
      final ImagePicker picker = ImagePicker();
      final List<XFile> images = await picker.pickMultiImage();
      if (images.isNotEmpty) {
        final list = [...state.images, ...images];
        emit(state.copyWith(images: list));
      }
    }
  }

  Future pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      final list = [...state.images, image];
      emit(state.copyWith(images: list));
    }
  }

  void removeImage(int index) {
    final list = [...state.images];
    list.removeAt(index);
    emit(state.copyWith(images: list));
  }
}
