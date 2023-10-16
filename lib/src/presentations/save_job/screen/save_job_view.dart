import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/main/cubit/main_cubit.dart';
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart';
import 'package:jobspot/src/presentations/save_job/domain/router/save_job_coordinator.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card_loading.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

class SaveJobView extends StatelessWidget {
  const SaveJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SaveJobCubit, SaveJobState>(
      listener: (context, state) {
        if (state.error != null) {
          customToast(context, text: state.error!);
        }
        if (state.deleteJobID != null) {
          context.read<MainCubit>().deleteSaveJob(state.deleteJobID!);
        }
        if (state.isDeleteAllSaveJob != null) {
          context.read<MainCubit>().deleteAllSaveJob();
        }
      },
      buildWhen: (previous, current) =>
          current.listJob != previous.listJob &&
          current.deleteJobID == null &&
          current.isDeleteAllSaveJob == null,
      builder: (context, state) {
        if (state.listJob != null && state.listJob!.isEmpty) {
          return _buildNoSaveJob();
        }
        return _buildHaveSaveJob(context);
      },
    );
  }

  Widget _buildHaveSaveJob(BuildContext context) {
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
            onPressed: context.read<SaveJobCubit>().deleteAllSaveJob,
            child: Text(
              AppLocal.text.save_job_page_delete_all,
              style: TextStyle(color: AppColors.deepSaffron),
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: _buildListJob(context.read<SaveJobCubit>().state.listJob),
      ),
    );
  }

  Widget _buildListJob(List<JobEntity>? listJob) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      padding: const EdgeInsets.all(AppDimens.smallPadding),
      itemCount: listJob?.length ?? 10,
      itemBuilder: (context, index) {
        if (listJob != null) {
          return CustomJobCard(
            job: listJob[index],
            button: IconButton(
              onPressed: () {
                context
                    .read<SaveJobCubit>()
                    .showBottomSheetOption(context, job: listJob[index]);
              },
              icon: const Icon(FontAwesomeIcons.ellipsisVertical),
            ),
            onTap: () =>
                SaveJobCoordinator.showViewJobDescription(listJob[index].id),
          );
        } else {
          return const CustomJobCardLoading(isShowApply: false);
        }
      },
    );
  }

  Widget _buildNoSaveJob() {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            children: [
              const Spacer(),
              Text(
                AppLocal.text.save_job_page_no_savings,
                style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                AppLocal.text.save_job_page_no_savings_content,
                style: AppStyles.normalTextMulledWine,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 54),
              SvgPicture.asset(AppImages.noSave),
              const SizedBox(height: 100),
              CustomButton(
                title: AppLocal.text.save_job_page_find_job.toUpperCase(),
                onPressed: () {},
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
