import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/verify_business/cubit/verify_business_cubit.dart';
import 'package:jobspot/src/presentations/verify_business/screen/verify_business_view.dart';

@RoutePage()
class VerifyBusinessPage extends StatelessWidget {
  const VerifyBusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VerifyBusinessCubit>(),
      child: const VerifyBusinessView(),
    );
  }
}
