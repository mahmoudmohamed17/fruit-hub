import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.title});
  final VoidCallback? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(title,
                textAlign: TextAlign.center,
                style: AppStyles.bold16.copyWith(color: Colors.white)),
          )),
    );
  }
}
