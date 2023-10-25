import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';

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
