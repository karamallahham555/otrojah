import 'package:flutter/material.dart';

import '../../core/utils/constants/colors.dart';

SnackBar customSnackBar(String errorMessage) {
  return SnackBar(
    content: Center(
      child: Text(
        errorMessage,
        style: const TextStyle(color: Colors.white),
      ),
    ),
    backgroundColor: OtrojaColors.primaryColor,
    duration: const Duration(seconds: 2),
  );
}
