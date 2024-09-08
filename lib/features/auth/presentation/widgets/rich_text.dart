import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/constants/constants.dart';

class RichTextWidget extends StatelessWidget {
  final VoidCallback onPressedTermAndCondition;
  final VoidCallback onPressedPrivacyPolicy;
  const RichTextWidget({
    super.key,
    required this.onPressedTermAndCondition,
    required this.onPressedPrivacyPolicy,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: Constants.labelRichText1,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: AppPallete.label2Color),
        children: [
          TextSpan(
              text: Constants.labelRichText2,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppPallete.label3Color,
                    fontWeight: FontWeight.w400,
                  ),
              recognizer: TapGestureRecognizer()
                ..onTap = onPressedTermAndCondition),
          TextSpan(
            text: Constants.labelRichText3,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppPallete.label2Color,
                ),
          ),
          TextSpan(
              text: Constants.labelRichText4,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppPallete.label3Color,
                    fontWeight: FontWeight.w400,
                  ),
              recognizer: TapGestureRecognizer()
                ..onTap = onPressedPrivacyPolicy),
        ],
      ),
    );
  }
}
