import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';

part 'image_widget_state.dart';

class ImageWidgetCubit extends Cubit<ImageWidgetState> {
  final controller = PageController(keepPage: true);

  ImageWidgetCubit() : super(const ImageWidgetState(0));

  void changeIndex(int index) => emit(state.copyWith(index: index));

  void showFullImage(
    BuildContext context, {
    required List<String> images,
    required int initIndex,
  }) {
    MultiImageProvider multiImageProvider = MultiImageProvider(
      images.map((image) {
        if (image.isLink) return CachedNetworkImageProvider(image);
        if (image.isAssets) return Image.asset(image).image;
        return Image.file(File(image)).image;
      }).toList(),
      initialIndex: initIndex,
    );
    showImageViewerPager(
      context,
      multiImageProvider,
      doubleTapZoomable: true,
      swipeDismissible: true,
      useSafeArea: true,
    );
  }
}
