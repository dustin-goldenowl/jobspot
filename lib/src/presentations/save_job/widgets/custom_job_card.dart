import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/save_job/widgets/tag_item.dart';

class CustomJobCard extends StatelessWidget {
  const CustomJobCard({
    super.key,
    required this.button,
    required this.onTap,
    this.isShowApply = false,
    this.onApply,
  });

  final Widget button;
  final VoidCallback onTap;
  final bool isShowApply;
  final VoidCallback? onApply;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(18, 153, 171, 198),
              blurRadius: 62,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(AppDimens.smallPadding),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(AppImages.google),
                const Spacer(),
                button,
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "UI/UX Designer",
              style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 5),
            const Text("Google inc • California, USA"),
            const SizedBox(height: 20),
            Row(
              children: [
                ...List.generate(
                  isShowApply ? 2 : 3,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: index != 2 ? 10 : 0),
                    child: const TagItem(title: "Design"),
                  ),
                ),
                if (isShowApply) const Spacer(),
                if (isShowApply)
                  GestureDetector(
                    onTap: onApply,
                    child: TagItem(
                      title: "Apply",
                      backgroundColor: const Color(0xFFFF6B2C).withOpacity(0.2),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "25 minute ago",
                  style: AppStyles.normalTextSpunPearl,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "\$15K",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: "/Mo",
                        style: AppStyles.normalTextSpunPearl,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
