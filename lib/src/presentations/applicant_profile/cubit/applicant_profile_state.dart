part of 'applicant_profile_cubit.dart';

class ApplicantProfileState extends Equatable {
  const ApplicantProfileState({this.listPost});

  final List<PostEntity>? listPost;

  ApplicantProfileState copyWith({List<PostEntity>? listPost}) {
    return ApplicantProfileState(listPost: listPost);
  }

  @override
  List<Object?> get props => [listPost];
}
