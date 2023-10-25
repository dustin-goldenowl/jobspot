import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/entities/update_user_info_entity.dart';
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/use_cases/update_user_info_use_case.dart';
import 'package:jobspot/src/presentations/edit_applicant_profile/widgets/bottom_sheet_pick_avatar.dart';

part 'edit_applicant_profile_state.dart';

@injectable
class EditApplicantProfileCubit extends Cubit<EditApplicantProfileState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final UpdateUserInfoUseCase _useCase;

  EditApplicantProfileCubit(this._useCase)
      : super(EditApplicantProfileState.ds()) {
    UserEntity user = PrefsUtils.getUserInfo()!;
    locationController.text = user.address;
    nameController.text = user.name;
    emailController.text = user.email;

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

  void changeGender(bool gender) => emit(state.copyWith(isMale: gender));

  Future updateUserInfo() async {
    emit(state.copyWith(isLoading: true));
    final response = await _useCase.call(
        params: UpdateUserInfoEntity(
      avatar: state.avatar,
      name: nameController.text,
      address: locationController.text,
      birthday: state.birthday,
      gender: state.isMale,
    ));
    if (response is DataFailed) {
      emit(state.copyWith(error: response.error));
    } else {
      emit(state.copyWith());
    }
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

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    locationController.dispose();
    scrollController.dispose();
    return super.close();
  }
}
