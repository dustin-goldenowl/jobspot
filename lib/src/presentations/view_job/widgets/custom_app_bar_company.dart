import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/presentations/view_job/domain/router/view_job_coordinator.dart';

import '../../../core/constants/constants.dart';

class CustomAppBarCompany extends StatelessWidget {
  const CustomAppBarCompany({
    super.key,
    required this.avatar,
    required this.companyName,
    required this.jobPosition,
    required this.location,
    required this.time,
  });

  final String companyName;
  final String time;
  final String location;
  final String jobPosition;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [_buildUpBody(context), _buildBottomBody()],
          ),
          Positioned(top: 60, child: _buildAvatar()),
        ],
      ),
    );
  }

  Container _buildBottomBody() {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFFF3F2F2)),
      child: Column(
        children: [
          const SizedBox(height: 28),
          Text(
            jobPosition,
            style: AppStyles.boldTextNightBlue.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildText(companyName),
              _buildDotText,
              _buildText(location),
              _buildDotText,
              _buildText(time)
            ],
          )
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: context.router.pop,
            icon: const Icon(Icons.arrow_back_rounded),
          ),
          IconButton(
            onPressed: () {
              //TODO set to test
              ViewJobCoordinator.showViewCompany();
            },
            icon: const Icon(FontAwesomeIcons.ellipsisVertical),
          )
        ],
      ),
    );
  }

  ClipOval _buildAvatar() {
    return ClipOval(
      child: avatar.isEmpty
          ? SvgPicture.asset(AppImages.logo, height: 84, width: 84)
          : CachedNetworkImage(
              imageUrl: avatar,
              placeholder: (_, __) =>
                  const ItemLoading(width: 84, height: 84, radius: 360),
              errorWidget: (_, __, ___) => const Icon(Icons.warning),
              height: 84,
              width: 84,
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
}
