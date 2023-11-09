import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/bloc/app_bloc.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card_loading.dart';
import 'package:jobspot/src/presentations/view_company_profile/cubit/view_company_profile_cubit.dart';
import 'package:jobspot/src/presentations/view_company_profile/domain/router/view_company_profile_coordinator.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

@RoutePage()
class ViewCompanyJobTab extends StatelessWidget {
  const ViewCompanyJobTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewCompanyProfileCubit, ViewCompanyProfileState>(
      buildWhen: (previous, current) => previous.listJob != current.listJob,
      builder: (context, state) {
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(AppDimens.smallPadding),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (state.listJob != null) {
              return _buildJobItem(context, job: state.listJob![index]);
            }
            return const CustomJobCardLoading(isShowApply: false);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: state.listJob?.length ?? 10,
        );
      },
    );
  }

  Widget _buildJobItem(BuildContext context, {required JobEntity job}) {
    return BlocBuilder<ViewCompanyProfileCubit, ViewCompanyProfileState>(
      buildWhen: (previous, current) => current.saveJobID == job.id,
      builder: (context, state) {
        if (state.saveJobID == job.id) {
          context.read<AppBloc>().add(ChangeSaveJobEvent(job.id));
        }
        final user = PrefsUtils.getUserInfo()!;
        final isSave = user.saveJob?.contains(job.id) ?? false;
        return CustomJobCard(
          button: IconButton(
            icon: SvgPicture.asset(
              isSave ? AppImages.saved : AppImages.saveJob,
              width: 30,
              height: 30,
            ),
            onPressed: () =>
                context.read<ViewCompanyProfileCubit>().saveJob(job.id),
          ),
          onTap: () => ViewCompanyProfileCoordinator.showFullJob(job.id),
          job: job,
        );
      },
    );
  }
}
