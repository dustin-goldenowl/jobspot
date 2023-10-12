import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class AppBarCompanyLoading extends StatelessWidget {
  const AppBarCompanyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [_buildUpBody(context), _buildBottomBody(random)],
          ),
          const Positioned(
            top: 60,
            child: ItemLoading(width: 84, height: 84, radius: 360),
          ),
        ],
      ),
    );
  }

  Container _buildUpBody(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: context.router.pop,
            icon: const Icon(Icons.arrow_back_rounded),
          ),
        ],
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
