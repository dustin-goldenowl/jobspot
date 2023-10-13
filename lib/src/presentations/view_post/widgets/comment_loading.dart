import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';

class CommentLoading extends StatelessWidget {
  const CommentLoading({super.key, this.size = 50});

  final double size;

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        ItemLoading(width: size, height: size, radius: 90),
        const SizedBox(width: 10),
        ItemLoading(
          width: (random.nextInt(100) + 200) * size / 50,
          height: (random.nextInt(50) + 70) * size / 50,
          radius: 10,
        )
      ],
    );
  }
}
