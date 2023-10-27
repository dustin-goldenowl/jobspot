import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/presentations/view_job_applicant/cubit/view_job_applicant_cubit.dart';
import 'package:jobspot/src/presentations/view_job_applicant/widgets/item_resume_applicant.dart';
import 'package:jobspot/src/presentations/view_job_applicant/widgets/item_resume_loading.dart';

class ViewJobApplicantView extends StatelessWidget {
  const ViewJobApplicantView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text(title.capitalizedString, style: AppStyles.boldTextHaiti),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: context.read<ViewJobApplicantCubit>().getListApplicant,
        child: BlocBuilder<ViewJobApplicantCubit, ViewJobApplicantState>(
          builder: (context, state) {
            return ListView.separated(
              itemCount: state.listResume?.length ?? 10,
              padding: const EdgeInsets.all(AppDimens.smallPadding),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (state.listResume != null) {
                  return ItemResumeApplicant(
                    resume: state.listResume![index],
                    onAccept: () {},
                    onReject: () {},
                  );
                }
                return const ItemResumeLoading();
              },
              separatorBuilder: (context, index) => const SizedBox(height: 15),
            );
          },
        ),
      ),
    );
  }
}
