import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants/constants.dart';

class CustomAppBarCompany extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarCompany({
    super.key,
    required this.width,
    required this.onPop,
    required this.onMore,
  });

  final double width;
  final VoidCallback onPop;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 120,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: onPop,
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    IconButton(
                      onPressed: onMore,
                      icon: const Icon(FontAwesomeIcons.ellipsisVertical),
                    )
                  ],
                ),
              ),
              Container(
                height: 120,
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xFFF3F2F2)),
                child: Column(
                  children: [
                    const SizedBox(height: 28),
                    Text(
                      "UI/UX Designer",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: AppColors.nightBlue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildText("Google"),
                        _buildDotText,
                        _buildText("California"),
                        _buildDotText,
                        _buildText("1 day ago")
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 60,
            child: SvgPicture.asset(AppImages.google, width: 84, height: 84),
          ),
        ],
      ),
    );
  }

  Widget get _buildDotText =>
      Text("•", style: AppStyles.boldTextNightBlue.copyWith(fontSize: 25));

  Widget _buildText(String title) {
    return Text(
      title,
      style: AppStyles.normalTextNightBlue.copyWith(fontSize: 16),
    );
  }

  @override
  Size get preferredSize => Size(width, 240);
}
