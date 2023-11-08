import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class AppBarCompanyLoading extends StatelessWidget {
  const AppBarCompanyLoading({super.key, required this.isTop});

  final bool isTop;

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return SliverAppBar(
      leading: IconButton(
        onPressed: context.router.pop,
        icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
      ),
      backgroundColor: isTop ? Colors.white : Colors.transparent,
      elevation: 0,
      pinned: true,
      centerTitle: true,
      stretch: true,
      expandedHeight: 240,
      scrolledUnderElevation: 0,
      title: AnimatedOpacity(
        opacity: !isTop ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: ItemLoading(
            width: random.nextInt(100) + 100, height: 20, radius: 5),
      ),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        expandedTitleScale: 1.0,
        centerTitle: false,
        titlePadding: const EdgeInsets.all(16),
        background: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [Container(height: 120), _buildBottomBody(random)],
            ),
            const Positioned(
              top: 60,
              child: ItemLoading(width: 84, height: 84, radius: 360),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildBottomBody(Random random) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFFF3F2F2)),
      child: Column(
        children: [
          const SizedBox(height: 28),
          ItemLoading(
            width: random.nextInt(100) + 100,
            height: 22,
            radius: 5,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItemLoading(
                width: random.nextInt(20) + 50,
                height: 22,
                radius: 5,
              ),
              _buildDotText,
              ItemLoading(
                width: random.nextInt(20) + 50,
                height: 22,
                radius: 5,
              ),
              _buildDotText,
              ItemLoading(
                width: random.nextInt(20) + 50,
                height: 22,
                radius: 5,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget get _buildDotText =>
      Text("•", style: AppStyles.boldTextNightBlue.copyWith(fontSize: 25));
}
