import 'package:flutter/material.dart';

void buildSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
