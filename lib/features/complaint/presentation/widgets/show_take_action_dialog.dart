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
                  alignLabelWithHint: true, // Ensure label is at the top-left
                ),
                maxLines: 5, // Multiline field
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your comments';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Cancel button with gray color
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey), // Gray border
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // Circular borders
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close dialog
                    },
                    child: const Text(
                      Constants.close,
                      style: TextStyle(
                          color: AppPallete.label3Color), // Gray text color
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Submit button with green color
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Green background
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // Circular borders
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        // Handle submit action
                        debugPrint('Selected Action: $selectedAction');
                        debugPrint('Comments: ${commentsController.text}');
                        Navigator.of(context).pop(); // Close dialog
                      }
                    },
                    child: const Text(
                      Constants.submit,
                      style: TextStyle(color: Colors.white), // White text color
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
