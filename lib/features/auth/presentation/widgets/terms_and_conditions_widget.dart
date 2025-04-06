import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/custom_check_box.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onTermsAccepted});
final ValueChanged<bool> onTermsAccepted;
  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChecked: (value) {
            widget.onTermsAccepted(value);
            setState(() {
              isTermsAccepted = value;
            });
          },
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                    style: AppStyles.semiBold13.copyWith(
                      color: const Color(0xFF949D9E),
                    )),
                TextSpan(
                    text: 'الشروط والأحكام',
                    style: AppStyles.semiBold13
                        .copyWith(color: AppColors.lightPrimaryColor)),
                TextSpan(
                    text: ' ',
                    style: AppStyles.semiBold13.copyWith(
                      color: const Color(0xFF616A6B),
                    )),
                TextSpan(
                    text: 'الخاصة بنا',
                    style: AppStyles.semiBold13
                        .copyWith(color: AppColors.lightPrimaryColor))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
