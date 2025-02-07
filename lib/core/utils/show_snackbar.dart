import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content,
    {Color? backgroundColor}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(content),
      backgroundColor:
          backgroundColor ?? AppPallete.transparentColor, // Use default if null
    ));
}
