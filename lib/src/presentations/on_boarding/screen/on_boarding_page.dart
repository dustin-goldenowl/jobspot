import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/function/on_will_pop.dart';
import 'package:jobspot/src/presentations/on_boarding/domain/router/on_boarding_coordinator.dart';

@RoutePage()
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  DateTime? _currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: OnBoardingCoordinator.showSignIn,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
        elevation: 0,
        child: const Icon(FontAwesomeIcons.arrowRight),
      ),
      body: WillPopScope(
        onWillPop: () => onWillPop(
          context: context,
          action: (now) => _currentBackPressTime = now,
          currentBackPressTime: _currentBackPressTime,
        ),
        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Text(
                "Jobspot",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(AppImages.onBoarding),
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  height: 0.947,
                ),
                children: [
                  TextSpan(text: "${AppLocal.text.find_your}\n"),
                  TextSpan(
                    text: AppLocal.text.dream_job,
                    style: TextStyle(
                      color: AppColors.neonCarrot,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.neonCarrot,
                    ),
                  ),
                  TextSpan(text: "\n${AppLocal.text.here}"),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              constraints: BoxConstraints(
                maxWidth: width - AppDimens.mediumPadding - 60,
              ),
              child: Text(
                AppLocal.text.on_boarding_content,
                style: AppStyles.normalTextMulledWine,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
