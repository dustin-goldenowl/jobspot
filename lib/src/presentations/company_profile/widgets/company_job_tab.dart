import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/company_profile/cubit/company_profile_cubit.dart';
import 'package:jobspot/src/presentations/company_profile/domain/router/company_profile_coordinator.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card_loading.dart';

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
              return CustomJobCard(
                button: IconButton(
                  icon: SvgPicture.asset(AppImages.save),
                  onPressed: () {},
                ),
                onTap: () => CompanyProfileCoordinator.showFullJob(
                    state.listJob![index].id),
                onApply: () => CompanyProfileCoordinator.showApplyJob(
                    job: state.listJob![index]),
                job: state.listJob![index],
              );
            }
            return const CustomJobCardLoading(isShowApply: false);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: state.listJob?.length ?? 10,
        );
      },
    );
  }
}
