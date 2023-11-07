import 'package:flutter/material.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';

class QuestionLoading extends StatelessWidget {
  const QuestionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 50),
          const ItemLoading(width: 250, height: 20, radius: 5),
          const SizedBox(height: 20),
          ItemLoading(width: width / 1.5, height: width / 1.5, radius: 5),
          const SizedBox(height: 20),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 6,
            itemBuilder: (context, gridIndex) {
              return Row(
                children: [
                  Radio(
                    value: gridIndex,
                    groupValue: null,
                    onChanged: (value) {},
                  ),
                  ItemLoading(width: width / 3, height: width / 3, radius: 5),
                ],
              );
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
