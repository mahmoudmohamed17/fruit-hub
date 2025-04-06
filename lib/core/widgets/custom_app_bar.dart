import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: AppStyles.bold19,
    ),
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
      ),
    ),
  );
}
