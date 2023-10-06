import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ItemLoading extends StatelessWidget {
  const ItemLoading({
    super.key,
    this.child,
    required this.width,
    required this.height,
    required this.radius,
  });

  final double height;
  final double width;
  final double radius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: child ??
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
    );
  }
}
