import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card.dart';

class SaveJobView extends StatelessWidget {
  const SaveJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocal.text.save_job_page_save_job,
          style: AppStyles.boldTextHaiti.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              //TODO delete all save job
            },
            child: Text(
              AppLocal.text.save_job_page_delete_all,
              style: TextStyle(color: AppColors.deepSaffron),
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.all(AppDimens.smallPadding),
          itemCount: 10,
          itemBuilder: (context, index) {
            return CustomJobCard(
              button: IconButton(
                onPressed: () {
                  context.read<SaveJobCubit>().showBottomSheetOption(context);
                },
                icon: const Icon(FontAwesomeIcons.ellipsisVertical),
              ),
              onTap: () {
                //TODO: tab show full description full job
              },
            );
          },
        ),
      ),
    );
  }
}
