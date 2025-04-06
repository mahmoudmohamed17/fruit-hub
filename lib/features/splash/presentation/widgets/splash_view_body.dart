import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/prefs.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/features/auth/presentation/view/signin_view.dart';
import 'package:fruit_hub/features/onboard/presentation/view/onboard_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imagesFreepikPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(
          Assets.imagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void excuteNavigation() {
    bool check = Prefs.getBool(kIsOnBoardViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      check
          // ignore: use_build_context_synchronously
          ? Navigator.pushReplacementNamed(context, SigninView.routeName)
          // ignore: use_build_context_synchronously
          : Navigator.pushReplacementNamed(context, OnboardView.routeName);
    });
  }
}
