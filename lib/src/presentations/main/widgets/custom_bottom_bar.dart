import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/main/widgets/custom_item_bottom_bar.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.changeTab,
    required this.onTap,
  });

  final Function(int index) changeTab;
  final VoidCallback onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomItemBottomBar(
            path: AppImages.home,
            onTap: () => changeTab(0),
            isSelected: currentIndex == 0,
          ),
          CustomItemBottomBar(
            path: AppImages.connection,
            onTap: () => changeTab(1),
            isSelected: currentIndex == 1,
          ),
          SizedBox(
            height: 50,
            width: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: onTap,
              child: const Icon(FontAwesomeIcons.plus),
            ),
          ),
          CustomItemBottomBar(
            path: AppImages.notification,
            onTap: () => changeTab(2),
            isSelected: currentIndex == 2,
          ),
          CustomItemBottomBar(
            path: AppImages.save,
            onTap: () => changeTab(3),
            isSelected: currentIndex == 3,
          ),
        ],
      ),
    );
  }
}
