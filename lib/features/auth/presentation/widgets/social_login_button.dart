import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onPressed});
  final String icon, label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: kBorderColor),
          ),
          padding: const EdgeInsets.all(16),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          title: Text(
            textAlign: TextAlign.center,
            label,
            style: AppStyles.semiBold16,
          ),
          leading: SvgPicture.asset(icon),
        ),
      ),
    );
  }
}
