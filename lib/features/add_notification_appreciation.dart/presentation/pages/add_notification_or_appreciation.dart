import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/auth_gradient_button.dart';
import 'package:employee_ni_service/core/common/widgets/custom_form_builder_text_field.dart';
import 'package:employee_ni_service/core/constants/constants.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/features/add_notification_appreciation.dart/presentation/widgets/image_chooser_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddNotificationOrAppreciation extends StatefulWidget {
  final String type;
  const AddNotificationOrAppreciation({super.key, required this.type});

  static Route route(String type) {
    return createSlideTransitionRoute(AddNotificationOrAppreciation(
      type: type,
    ));
  }

  @override
  State<AddNotificationOrAppreciation> createState() =>
      _AddNotificationOrAppreciationState();
}

class _AddNotificationOrAppreciationState
    extends State<AddNotificationOrAppreciation> {
  final notificationFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: AppBarWidget(
        title: widget.type != "appreciation"
            ? Constants.addNotification
            : Constants.addAppreciation,
        isBackButtonVisible: true,
        isMoreButtonVisible: false,
        isFromMoreIcon: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FormBuilder(
                key: notificationFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 15,
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomFormBuilderTextField(
                          name: 'Message',
                          label: 'Message',
                          hintText: 'Enter your Message',
                          keyboardType: TextInputType.multiline,
                          maxLine: 5,
                          textInputAction: TextInputAction.done,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                        ),
                      ),
                      const ImageChooserWidget(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AuthGradientButton(
                buttonText: widget.type != "appreciation"
                    ? Constants.addNotification
                    : Constants.addAppreciation,
                startColor: AppPallete.buttonColor,
                endColor: AppPallete.gradientColor,
                width: MediaQuery.of(context).size.width,
                height: 55,
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
