import 'package:flutter/material.dart';
import 'package:fruit_hub/features/onboard/presentation/widgets/on_board_view_body.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});
static const routeName = 'onboard';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardViewBody(),
    );
  }
}