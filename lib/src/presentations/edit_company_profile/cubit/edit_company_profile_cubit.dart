import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/permission_service.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/edit_applicant_profile/widgets/bottom_sheet_pick_avatar.dart';
import 'package:jobspot/src/presentations/edit_company_profile/domain/entities/update_company_info_entity.dart';
import 'package:jobspot/src/presentations/edit_company_profile/domain/use_cases/update_company_info_use_case.dart';

part 'edit_company_profile_state.dart';

@injectable
class EditCompanyProfileCubit extends Cubit<EditCompanyProfileState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController industryController = TextEditingController();
  TextEditingController headOfficeController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController employeeSizeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final formKey = GlobalKey<FormState>();

  final UpdateCompanyInfoUseCase _useCase;

  EditCompanyProfileCubit(this._useCase) : super(EditCompanyProfileState.ds()) {
    UserEntity user = PrefsUtils.getUserInfo()!;
    headOfficeController.text = user.address;
    nameController.text = user.name;
    emailController.text = user.email;
    websiteController.text = user.website ?? "";
    industryController.text = user.industry ?? "";
    typeController.text = user.type ?? "";
    employeeSizeController.text = user.employeeSize.toString();
    descriptionController.text = user.description;
    specializationController.text = user.specialization ?? "";
    emit(state.copyWith(images: user.images));
    BuildContext context =
        getIt<AppRouter>().navigatorKey.currentState!.context;
    scrollController.addListener(() {
      bool isTop = scrollController.position.pixels >=
          0.6 * MediaQuery.sizeOf(context).width -
              2 * AppBar().preferredSize.height;
      changeIsTop(isTop);
    });
  }

  void changeIsTop(bool isTop) => emit(state.copyWith(isTop: isTop));

  Future updateCompanyInfo() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(isLoading: true));
      final response = await _useCase.call(
          params: UpdateCompanyInfoEntity(
        avatar: state.avatar,
        name: nameController.text,
        address: headOfficeController.text,
        since: state.birthday,
        description: descriptionController.text,
        employeeSize: employeeSizeController.text,
        industry: industryController.text,
        specialization: specializationController.text,
        type: typeController.text,
        website: websiteController.text,
        images: state.images,
        removeImages: state.removeImages,
      ));
      if (response is DataFailed) {
        emit(state.copyWith(error: response.error));
      } else {
        emit(state.copyWith());
      }
    }
  }

  Future pickImageFromGallery() async {
    bool result = await PermissionService.requestPhotoPermission();
    if (result) {
      final ImagePicker picker = ImagePicker();
      final List<XFile> images = await picker.pickMultiImage(maxWidth: 512);
      if (images.isNotEmpty) {
        final list = [...state.images, ...images.map((e) => e.path)];
        emit(state.copyWith(images: list));
      }
    }
  }

  Future pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 512);
    if (image != null) {
      final list = [...state.images, image.path];
      emit(state.copyWith(images: list));
    }
  }

  void showPickImage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (_) => BottomSheetPickAvatar(
        onTap: (value) =>
            value ? pickImageFromCamera() : pickImageFromGallery(),
      ),
    );
  }

  void removeImage(int index) {
    List<String> images = [...state.images];
    List<String> removeImages = [...state.removeImages];
    if (images[index].isLink) {
      removeImages.add(images[index]);
    }
    images.removeAt(index);
    emit(state.copyWith(images: images, removeImages: removeImages));
  }

  void showPickAvatar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (_) => BottomSheetPickAvatar(onTap: _pickAvatar),
    );
  }

  Future _pickAvatar(bool isCamera) async {
    XFile? pickImage = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    try {
      if (pickImage != null) {
        final cropImage = await ImageCropper().cropImage(
          sourcePath: pickImage.path,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          aspectRatioPresets: [CropAspectRatioPreset.square],
          maxWidth: 512,
          maxHeight: 512,
        );
        if (cropImage != null) {
          emit(state.copyWith(avatar: cropImage.path));
        }
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    headOfficeController.dispose();
    specializationController.dispose();
    websiteController.dispose();
    industryController.dispose();
    descriptionController.dispose();
    employeeSizeController.dispose();
    typeController.dispose();
    scrollController.dispose();
    return super.close();
  }
}
