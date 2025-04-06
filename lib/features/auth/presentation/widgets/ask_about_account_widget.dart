import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class AskAboutAcountWidget extends StatelessWidget {
  const AskAboutAcountWidget({
    super.key,
    required this.questionText,
    required this.orderText,
    required this.onTap,
  });
  final String questionText, orderText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(questionText,
            style: AppStyles.semiBold16.copyWith(
              color: const Color(0xFF949D9E),
            )),
        const Text(
          ' ',
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(orderText,
              style:
                  AppStyles.semiBold16.copyWith(color: AppColors.primaryColor)),
        ),
      ],
    );
  }
}
