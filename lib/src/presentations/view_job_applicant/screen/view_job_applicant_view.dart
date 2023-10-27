import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/presentations/view_job_applicant/cubit/view_job_applicant_cubit.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/entities/consider_resume.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/entities/resume_applicant_entity.dart';
import 'package:jobspot/src/presentations/view_job_applicant/widgets/item_resume_applicant.dart';
import 'package:jobspot/src/presentations/view_job_applicant/widgets/item_resume_loading.dart';

class ViewJobApplicantView extends StatefulWidget {
  const ViewJobApplicantView({super.key, required this.title});

  final String title;

  @override
  State<ViewJobApplicantView> createState() => _ViewJobApplicantViewState();
}

class _ViewJobApplicantViewState extends State<ViewJobApplicantView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    context.read<ViewJobApplicantCubit>().tabController =
        TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text(widget.title.capitalizedString,
            style: AppStyles.boldTextHaiti),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocListener<ViewJobApplicantCubit, ViewJobApplicantState>(
      listener: (context, state) {
        if (state.error != null) {
          customToast(context, text: state.error ?? "");
        }
      },
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildTabBar(context),
          Expanded(
            child: TabBarView(
              controller: context.read<ViewJobApplicantCubit>().tabController,
              children: List.generate(
                3,
                (index) => RefreshIndicator(
                  onRefresh:
                      context.read<ViewJobApplicantCubit>().getListApplicant,
                  child: _buildListResume(
                      isAccept: index == 0 ? null : index == 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.smallPadding),
      child: Container(
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(18, 162, 153, 198),
              blurRadius: 62,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              TabBar(
                unselectedLabelColor: AppColors.haiti,
                labelColor: Colors.white,
                indicatorColor: AppColors.neonCarrot,
                indicatorWeight: 1,
                indicator: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                controller: context.read<ViewJobApplicantCubit>().tabController,
                tabAlignment: TabAlignment.fill,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: AppStyles.boldText,
                tabs: [
                  Tab(text: AppLocal.text.view_job_applicant_consider),
                  Tab(text: AppLocal.text.view_job_applicant_accepted),
                  Tab(text: AppLocal.text.view_job_applicant_rejected),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListResume({bool? isAccept}) {
    return BlocBuilder<ViewJobApplicantCubit, ViewJobApplicantState>(
      builder: (context, state) {
        List<ResumeApplicantEntity>? listResume;
        if (state.listResume != null) {
          listResume = state.listResume!
              .where((element) => element.isAccept == isAccept)
              .toList();
        }
        return ListView.separated(
          itemCount: listResume?.length ?? 10,
          padding: const EdgeInsets.all(AppDimens.smallPadding),
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemBuilder: (context, index) {
            if (listResume != null) {
              return ItemResumeApplicant(
                resume: listResume[index],
                onConsider: (isAcept) => context
                    .read<ViewJobApplicantCubit>()
                    .considerResume(ConsiderResume(
                      applyID: listResume![index].id,
                      isAccept: isAcept,
                      toUserID: listResume[index].applicant.id,
                      jobID: listResume[index].jobID,
                    )),
              );
            }
            return const ItemResumeLoading();
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
        );
      },
    );
  }
}
