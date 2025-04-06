import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/widgets/custom_border.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.suffixIcon, this.onSaved});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الرجاء إدخال $hintText';
        } else {
          return null;
        }
      },
      keyboardType: textInputType,
      style: AppStyles.semiBold16.copyWith(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        fillColor: kFillBorderColor,
        hoverColor: Colors.transparent,
        hintText: hintText,
        hintStyle: AppStyles.bold13.copyWith(
          color: kHintTextColor,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}
