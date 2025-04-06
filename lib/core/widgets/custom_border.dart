import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(color: kBorderColor, width: 2),
  );
}
