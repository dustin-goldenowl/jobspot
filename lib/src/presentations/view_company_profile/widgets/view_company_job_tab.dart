import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card.dart';

import '../../../core/constants/constants.dart';

@RoutePage()
class ViewCompanyJobTab extends StatelessWidget {
  const ViewCompanyJobTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Text("abc");
        // return CustomJobCard(
        //   button: IconButton(
        //     icon: SvgPicture.asset(AppImages.save),
        //     onPressed: () {},
        //   ),
        //   onTap: () {
        //     context.router.pushNamed('/viewJob');
        //   },
        //   isShowApply: true,
        //   onApply: () {},
        //   job: null,
        // );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: 10,
    );
  }
}
