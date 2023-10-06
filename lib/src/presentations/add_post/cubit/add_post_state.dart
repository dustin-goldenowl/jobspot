part of 'add_post_cubit.dart';

class AddPostState extends Equatable {
  const AddPostState({
    this.dataState,
    required this.isLoading,
    required this.images,
  });

  final bool isLoading;
  final DataState? dataState;
  final List<XFile> images;

  AddPostState copyWith({
    DataState? dataState,
    bool isLoading = false,
    List<XFile>? images,
  }) {
    return AddPostState(
      isLoading: isLoading,
      dataState: dataState,
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props => [dataState, isLoading, images];
}
