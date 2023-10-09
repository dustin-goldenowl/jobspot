import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/common/widgets/image_widget/cubit/image_widget_cubit.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

class ImageWidgetView extends StatelessWidget {
  final List<String> images;
  final List<String> networkImages;
  final bool showDelete;
  final Function(int index)? onDelete;

  const ImageWidgetView({
    super.key,
    required this.images,
    required this.networkImages,
    required this.showDelete,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    List<String> list = [...networkImages, ...images];
    return SizedBox(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: context.read<ImageWidgetCubit>().controller,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            onPageChanged: context.read<ImageWidgetCubit>().changeIndex,
            itemBuilder: (context, index) {
              return _buildImageItem(
                context,
                images: list,
                index: index,
                onDelete: () => onDelete!(index),
              );
            },
          ),
          if (list.length > 1)
            Positioned(bottom: 10, child: _buildIncaditor(context, list)),
          if (list.length > 1)
            Positioned(top: 10, right: 20, child: _showIndex(list.length)),
        ],
      ),
    );
  }

  Stack _buildImageItem(
    BuildContext context, {
    required List<String> images,
    required int index,
    required VoidCallback onDelete,
  }) {
    final size = MediaQuery.sizeOf(context).width;
    String image = images[index];
    return Stack(
      children: [
        InkWell(
          onTap: () {
            context
                .read<ImageWidgetCubit>()
                .showFullImage(context, images: images, initIndex: index);
          },
          child: ZoomOverlay(
            modalBarrierColor: Colors.black12,
            minScale: 0.5,
            maxScale: 4.0,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: const Duration(milliseconds: 300),
            twoTouchOnly: true,
            child: SizedBox(
              width: size,
              height: size,
              child: image.isAssets
                  ? Image.asset(image, fit: BoxFit.cover)
                  : (image.isLink
                      ? CachedNetworkImage(
                          imageUrl: image,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const ItemLoading(
                              width: 150, height: 150, radius: 0),
                          errorWidget: (context, url, error) =>
                              Image.asset(AppImages.logo, fit: BoxFit.cover),
                        )
                      : Image.file(File(image), fit: BoxFit.cover)),
            ),
          ),
        ),
        if (showDelete)
          Positioned(
            top: 10,
            left: 10,
            child: _buildDeleteButton(onDelete: onDelete),
          )
      ],
    );
  }

  GestureDetector _buildDeleteButton({required VoidCallback onDelete}) {
    return GestureDetector(
      onTap: onDelete,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Icon(Icons.close),
        ),
      ),
    );
  }

  SizedBox _buildIncaditor(BuildContext context, List<String> list) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: SmoothPageIndicator(
          controller: context.read<ImageWidgetCubit>().controller,
          count: list.length,
          effect: ScrollingDotsEffect(
            activeDotColor: AppColors.veryLightBlue,
            activeStrokeWidth: 2.6,
            activeDotScale: 1.3,
            maxVisibleDots: 5,
            radius: 8,
            spacing: 10,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ),
    );
  }

  Widget _showIndex(int length) {
    return BlocBuilder<ImageWidgetCubit, ImageWidgetState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.75),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "${state.currentIndex + 1}/$length",
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}
