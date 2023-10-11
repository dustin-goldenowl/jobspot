part of 'add_post_cubit.dart';

class AddPostState extends Equatable {
  const AddPostState({
    this.dataState,
    required this.isLoading,
    required this.images,
    required this.removeImages,
  });

  final bool isLoading;
  final DataState? dataState;
  final List<String> images;
  final List<String> removeImages;

  AddPostState copyWith({
    DataState? dataState,
    bool isLoading = false,
    List<String>? images,
    List<String>? removeImages,
  }) {
    return AddPostState(
      isLoading: isLoading,
      dataState: dataState,
      images: images ?? this.images,
      removeImages: removeImages ?? this.removeImages,
    );
  }

  factory AddPostState.ds() {
    return const AddPostState(
      isLoading: false,
      images: [],
      removeImages: [],
    );
  }

  @override
  List<Object?> get props => [dataState, isLoading, images, removeImages];
}
