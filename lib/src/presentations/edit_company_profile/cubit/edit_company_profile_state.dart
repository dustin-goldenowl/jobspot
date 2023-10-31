part of 'edit_company_profile_cubit.dart';

class EditCompanyProfileState extends Equatable {
  const EditCompanyProfileState({
    required this.isLoading,
    required this.isTop,
    required this.birthday,
    required this.avatar,
    required this.images,
    required this.removeImages,
    this.error,
  });

  final bool isLoading;
  final bool isTop;
  final DateTime birthday;
  final String avatar;
  final String? error;
  final List<String> images;
  final List<String> removeImages;

  factory EditCompanyProfileState.ds() {
    UserEntity user = PrefsUtils.getUserInfo()!;
    return EditCompanyProfileState(
      isLoading: false,
      isTop: false,
      birthday: user.birthday,
      avatar: user.avatar,
      images: user.images ?? [],
      removeImages: const [],
    );
  }

  EditCompanyProfileState copyWith({
    bool isLoading = false,
    bool? isTop,
    DateTime? birthday,
    String? avatar,
    String? error,
    List<String>? images,
    List<String>? removeImages,
  }) {
    return EditCompanyProfileState(
      isLoading: isLoading,
      isTop: isTop ?? this.isTop,
      error: error,
      birthday: birthday ?? this.birthday,
      avatar: avatar ?? this.avatar,
      images: images ?? this.images,
      removeImages: removeImages ?? this.removeImages,
    );
  }

  @override
  List<Object?> get props =>
      [isLoading, error, isTop, birthday, avatar, removeImages, images];
}
