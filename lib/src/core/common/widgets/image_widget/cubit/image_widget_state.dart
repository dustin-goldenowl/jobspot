part of 'image_widget_cubit.dart';

class ImageWidgetState extends Equatable {
  const ImageWidgetState(this.currentIndex);

  final int currentIndex;

  ImageWidgetState copyWith({int? index}) {
    return ImageWidgetState(index ?? currentIndex);
  }

  @override
  List<Object> get props => [currentIndex];
}
