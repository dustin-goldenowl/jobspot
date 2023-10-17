part of 'applicant_profile_cubit.dart';

class ApplicantProfileState extends Equatable {
  const ApplicantProfileState({this.listPost, required this.isTop});

  final List<PostEntity>? listPost;
  final bool isTop;

  ApplicantProfileState copyWith({List<PostEntity>? listPost, bool? isTop}) {
    return ApplicantProfileState(
      listPost: listPost,
      isTop: isTop ?? this.isTop,
    );
  }

  @override
  List<Object?> get props => [listPost, isTop];
}
