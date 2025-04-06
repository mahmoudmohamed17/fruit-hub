import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/prefs.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/auth/presentation/view/signin_view.dart';
import 'package:fruit_hub/features/onboard/presentation/widgets/on_board_page_view.dart';

class OnBoardViewBody extends StatefulWidget {
  const OnBoardViewBody({super.key});

  @override
  State<OnBoardViewBody> createState() => _OnBoardViewBodyState();
}

class _OnBoardViewBodyState extends State<OnBoardViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: OnBoardPageView(
          pageController: pageController,
        )),
        DotsIndicator(
          position: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          dotsCount: 2,
          decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color: currentPage == 1
                  ? AppColors.primaryColor
                  : AppColors.lightPrimaryColor),
        ),
        const SizedBox(
          height: 30,
        ),
        Visibility(
          visible: currentPage == 1,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(
              title: 'ابدأ الان',
              onPressed: () {
                // ensure that the user has seen this screen
                // so no need to view it for him again
                Prefs.setBool(kIsOnBoardViewSeen, true);
                Navigator.pushReplacementNamed(context, SigninView.routeName);
              },
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
