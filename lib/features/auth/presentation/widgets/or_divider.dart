import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xffDDDFDF),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(18),
          child: Text(
            'أو',
            style: AppStyles.bold16,
          ),
        ),
        Expanded(
          child: Divider(
            color: Color(0xffDDDFDF),
          ),
        ),
      ],
    );
  }
}
