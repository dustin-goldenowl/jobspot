import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/common/widgets/image_widget/cubit/image_widget_cubit.dart';
import 'package:jobspot/src/core/common/widgets/image_widget/widget/image_widget_view.dart';

class ImageWidget extends StatelessWidget {
  final List<String> images;
  final List<String> networkImages;
  final bool showDelete;
  final Function(int index)? onDelete;
  final double padding;

  const ImageWidget({
    super.key,
    required this.images,
    this.networkImages = const [],
    this.showDelete = false,
    this.onDelete,
    this.padding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageWidgetCubit(),
      child: ImageWidgetView(
        images: images,
        networkImages: networkImages,
        onDelete: onDelete,
        showDelete: showDelete,
        padding: padding,
      ),
    );
  }
}
