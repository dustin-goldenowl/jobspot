import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_widget_state.dart';

class ImageWidgetCubit extends Cubit<ImageWidgetState> {
  final controller = PageController(keepPage: true);

  ImageWidgetCubit() : super(const ImageWidgetState(0));

  void changeIndex(int index) => emit(state.copyWith(index: index));
}
