import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class JobTitleInfo extends StatelessWidget {
  const JobTitleInfo({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.boldTextHaiti.copyWith(fontSize: 16)),
        const SizedBox(height: 16),
        child,
      ],
    );
  }
}
