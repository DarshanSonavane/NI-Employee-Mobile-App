import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class NotesTextWidget extends StatelessWidget {
  const NotesTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 12.0, right: 12.0),
      child: Text(
        Constants.notesSetResetPasswordScreen,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 14,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
