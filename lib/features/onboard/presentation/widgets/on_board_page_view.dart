import 'package:flutter/material.dart';
import 'package:fruit_hub/features/onboard/presentation/widgets/first_on_board_screen.dart';
import 'package:fruit_hub/features/onboard/presentation/widgets/second_on_board_screen.dart';

class OnBoardPageView extends StatelessWidget {
  const OnBoardPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        controller: pageController,
        children: const [
          FirstOnBoardScreen(),
          SecondOnBoardScreen(),
        ],
      ),
    );
  }
}
