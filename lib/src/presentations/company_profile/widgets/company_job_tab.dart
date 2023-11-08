import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/bloc/app_bloc.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/company_profile/cubit/company_profile_cubit.dart';
import 'package:jobspot/src/presentations/company_profile/domain/router/company_profile_coordinator.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card_loading.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

@RoutePage()
class CompanyJobTab extends StatelessWidget {
  const CompanyJobTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
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
    return BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
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
                context.read<CompanyProfileCubit>().saveJob(job.id),
          ),
          onTap: () => CompanyProfileCoordinator.showFullJob(job.id),
          job: job,
          moreWidget: PopupMenuButton<int>(
            color: Colors.white,
            icon: Icon(
              FontAwesomeIcons.ellipsisVertical,
              color: AppColors.haiti,
              size: 18,
            ),
            shadowColor: Colors.black,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<int>(
                value: 0,
                child: _buildItemPopup(
                  icon: AppImages.edit,
                  title: AppLocal.text.applicant_profile_page_edit,
                ),
                onTap: () => CompanyProfileCoordinator.showEditJob(job: job),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: _buildItemPopup(
                  icon: AppImages.trash,
                  title: AppLocal.text.applicant_profile_page_delete,
                ),
                onTap: () =>
                    context.read<CompanyProfileCubit>().deleteJob(job.id),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItemPopup({required String title, required String icon}) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(AppColors.haiti, BlendMode.srcIn),
          width: 20,
        ),
        const SizedBox(width: 10),
        Text(title, style: AppStyles.normalTextHaiti),
      ],
    );
  }
}
