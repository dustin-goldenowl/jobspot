import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/presentations/view_job/domain/router/view_job_coordinator.dart';

class CustomAppBarCompany extends StatelessWidget {
  const CustomAppBarCompany({
    super.key,
    required this.avatar,
    required this.companyName,
    required this.jobPosition,
    required this.location,
    required this.time,
    required this.companyID,
    required this.isTop,
  });

  final String companyName;
  final String time;
  final String location;
  final String jobPosition;
  final String avatar;
  final String companyID;
  final bool isTop;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      ///TODO I don't have idea with this button
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     icon: const Icon(FontAwesomeIcons.ellipsisVertical),
      //   ),
      //   const SizedBox(width: 5),
      // ],
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
        child: Text(
          jobPosition.capitalizedString,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        expandedTitleScale: 1.0,
        centerTitle: false,
        titlePadding: const EdgeInsets.all(16),
        background: Stack(
          alignment: Alignment.center,
          children: [
            Column(children: [Container(height: 120), _buildBottomBody()]),
            Positioned(top: 60, child: _buildAvatar()),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBody() {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFFF3F2F2)),
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.smallPadding),
      child: Column(
        children: [
          const SizedBox(height: 28),
          Text(
            jobPosition.capitalizedString,
            style: AppStyles.boldTextNightBlue.copyWith(fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildText(
                onTap: () => ViewJobCoordinator.showViewCompany(companyID),
                title: companyName,
              ),
              _buildDotText,
              _buildText(title: location),
              _buildDotText,
              _buildText(title: time)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return GestureDetector(
      onTap: () => ViewJobCoordinator.showViewCompany(companyID),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: avatar,
          placeholder: (_, __) =>
              const ItemLoading(width: 84, height: 84, radius: 360),
          errorWidget: (_, __, ___) =>
              SvgPicture.asset(AppImages.logo, height: 84, width: 84),
          height: 84,
          width: 84,
        ),
      ),
    );
  }

  Widget get _buildDotText => SizedBox(
      width: 30,
      child: Center(
        child: Text("•",
            style: AppStyles.boldTextNightBlue.copyWith(fontSize: 25)),
      ));

  Widget _buildText({VoidCallback? onTap, required String title}) {
    return Expanded(
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            title,
            style: AppStyles.normalTextNightBlue.copyWith(fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
