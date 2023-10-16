import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/constants.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              gradient: const LinearGradient(
                colors: [Color(0xFF130160), Color(0xFF36353C)],
                transform: GradientRotation(0.2),
              ),
            ),
            width: width,
            height: 0.6 * width,
            child: SvgPicture.asset(AppImages.profileBackground),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () => context.router.pop(),
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppImages.setting),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.smallPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppImages.google),
                        const SizedBox(height: 7),
                        const Text(
                          "Orlando Diggs",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          "California, USA",
                          style: TextStyle(color: Colors.white),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            itemFollow(title: "Follow", number: "120K"),
                            const SizedBox(width: 20),
                            itemFollow(title: "Follow", number: "120K"),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 5,
                                ),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Edit profile",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(width: 10),
                                    SvgPicture.asset(
                                      AppImages.edit,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget itemFollow({required String title, required String number}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: number,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          TextSpan(text: " $title", style: const TextStyle(color: Colors.white))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(width, 0.6 * width);
}
