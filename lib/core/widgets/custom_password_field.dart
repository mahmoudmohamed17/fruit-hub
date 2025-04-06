import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/widgets/custom_border.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الرجاء إدخال كلمة المرور';
        } else {
          return null;
        }
      },
      obscureText: obscureText,
      style:
          AppStyles.semiBold16.copyWith(color: Colors.black, fontFamily: null),
      decoration: InputDecoration(
        hintText: 'كلمة المرور',
        contentPadding: const EdgeInsets.all(15),
        fillColor: kFillBorderColor,
        hoverColor: Colors.transparent,
        hintStyle: AppStyles.bold13.copyWith(
          color: kHintTextColor,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: kHintTextColor,
          ),
        ),
        filled: true,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}
