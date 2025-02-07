import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/common/widgets/custom_global_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/constants/constants.dart';

class OtpDialog {
  static void showOtpDialog({
    required BuildContext context,
    VoidCallback? onResendOtp,
    required Function(String otp) onSubmitOtp,
  }) {
    TextEditingController otpController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing on tap outside
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppPallete.screenBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: const CustomGlolbalText(
            text: "Please enter 4-digit OTP",
            textAlign: TextAlign.center,
            color: AppPallete.deepNavy,
            fontSize: 18,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                labelText: Constants.otpScreen,
                controller: otpController,
                textStyle: const TextStyle(
                    color: AppPallete.label3Color, fontSize: 16),
                labelStyle: const TextStyle(color: AppPallete.deepNavy),
                fillColor: AppPallete.backgroundClosed,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                editableText: true,
                isOtpField: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    if (onResendOtp != null) {
                      onResendOtp();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("OTP Resent!")),
                      );
                    }
                  },
                  child: const CustomGlolbalText(
                    text: "Resend OTP",
                    color: AppPallete.deepNavy,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const CustomGlolbalText(
                text: "Cancel",
                color: AppPallete.deepNavy,
                fontSize: 14,
              ),
            ),
            AuthGradientButton(
              buttonText: Constants.submit,
              startColor: AppPallete.gradientColor,
              endColor: AppPallete.gradientColor,
              fontSize: 13.0,
              width: MediaQuery.of(context).size.width / 2.2,
              height: 55,
              onPressed: () {
                if (otpController.text.replaceAll(" - ", '').length == 4) {
                  Navigator.pop(context);
                  onSubmitOtp(otpController.text.replaceAll(" - ", ''));
                } else {
                  showSnackBar(context, "Invalid OTP! Enter 4 digits.");
                }
              },
            ),
          ],
        );
      },
    );
  }
}
