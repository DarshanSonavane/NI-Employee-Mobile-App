import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

void showTakeActionDialog(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final commentsController = TextEditingController();
  String? selectedAction;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: AppPallete.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8, // 80% screen width
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                Constants.takeAction,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppPallete.gradientColor),
              ),
              const SizedBox(height: 16),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  Constants.statusComplaint,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppPallete.gradientColor),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio<String>(
                        activeColor: AppPallete.label3Color,
                        focusColor: AppPallete.label3Color,
                        value: Constants.open,
                        groupValue: selectedAction,
                        onChanged: (String? value) {
                          selectedAction = value;
                          (context as Element).markNeedsBuild();
                        },
                      ),
                      const SizedBox(
                        width: 4,
                      ), // Adjust spacing between radio and text
                      const Text(
                        Constants.open,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppPallete.gradientColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<String>(
                        activeColor: AppPallete.label3Color,
                        focusColor: AppPallete.label3Color,
                        value: Constants.close,
                        groupValue: selectedAction,
                        onChanged: (String? value) {
                          selectedAction = value;
                          (context as Element).markNeedsBuild();
                        },
                      ),
                      const SizedBox(
                        width: 4,
                      ), // Adjust spacing between radio and text
                      const Text(
                        Constants.close,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppPallete.gradientColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                style: const TextStyle(color: AppPallete.label3Color),
                controller: commentsController,
                decoration: const InputDecoration(
                  hintText: Constants.enterComments,
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your comments';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      Constants.close,
                      style: TextStyle(color: AppPallete.label3Color),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text(
                      Constants.submit,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
