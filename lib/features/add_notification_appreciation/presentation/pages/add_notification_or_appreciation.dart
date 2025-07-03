import 'dart:io';

import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/auth_gradient_button.dart';
import 'package:employee_ni_service/core/common/widgets/custom_form_builder_text_field.dart';
import 'package:employee_ni_service/core/common/widgets/employee_selection_section.dart';
import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/core/constants/constants.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/presentation/bloc/add_notification_appreciation_bloc.dart';
import 'package:employee_ni_service/features/add_notification_appreciation/presentation/widgets/image_chooser_widget.dart';
import 'package:employee_ni_service/features/appreciation_profile/presentation/bloc/fetch_appriciation_bloc.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/presentation/bloc/assign_product_to_employee_bloc.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_fetch_employee/response_employee_model.dart';
import 'package:employee_ni_service/features/notification_profile/presentation/bloc/fetch_notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  ResponseEmployeeModel? employeeModel;
  String? selectEmployee;
  String? base64File;
  String? fileExtension;
  final notificationFormKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    context.read<AssignProductToEmployeeBloc>().add(
          GetAllEmployeesList(),
        );
    super.initState();
  }

  void onEmployeeSelected(String? value) {
    setState(() {
      selectEmployee = value;
    });
  }

  void onSubmit() {
    if (notificationFormKey.currentState?.saveAndValidate() ?? false) {
      final formData = notificationFormKey.currentState?.value;
      if (widget.type == "appreciation") {
        if (selectEmployee == null) {
          showSnackBar(context, "Please select an employee");
          return;
        }
        final emp = employeeModel!.employeeData
            .firstWhere((emp) => emp.sId == selectEmployee);
        final empName = '${emp.firstName} ${emp.lastName}';
        context.read<AddNotificationAppreciationBloc>().add(
              AddAppreciationEvent(
                  empId: selectEmployee!,
                  description: formData?['Message'],
                  key: '$empName.png'),
            );
      } else {
        context.read<AddNotificationAppreciationBloc>().add(
              AddNotificationEvent(
                message: formData?['Message'] ?? '',
                base64File: base64File,
                fileExtension: fileExtension,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isAppreciation = widget.type == "appreciation";
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: AppBarWidget(
        title: isAppreciation
            ? Constants.addAppreciation
            : Constants.addNotification,
        isBackButtonVisible: true,
        isMoreButtonVisible: false,
        isFromMoreIcon: false,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AssignProductToEmployeeBloc,
              AssignProductToEmployeeState>(
            listener: (context, state) {
              if (state is AssignProductToEmployeeFailure) {
                showSnackBar(context, state.message);
              }
              if (state is AssignProductToEmployeeSuccess) {
                setState(() {
                  employeeModel = state.data;
                });
              }
            },
          ),
          BlocListener<AddNotificationAppreciationBloc,
              AddNotificationAppreciationState>(
            listener: (context, state) {
              if (state is AddNotificationAppreciationSuccess) {
                showSnackBar(
                    context, state.modelAddNotificationResponse.message);
                Navigator.pop(context);
                isAppreciation
                    ? context
                        .read<FetchAppriciationBloc>()
                        .add(GetAllAppreciation())
                    : context
                        .read<FetchNotificationBloc>()
                        .add(GetAllNotificationEvent());
              } else if (state is AddNotificationAppreciationFailure) {
                showSnackBar(context, state.error);
              }
            },
          ),
        ],
        child: BlocBuilder<AddNotificationAppreciationBloc,
            AddNotificationAppreciationState>(
          builder: (context, state) {
            final isLoading = state is AddNotificationAppreciationLoading;
            return Stack(
              children: [
                BlocBuilder<AssignProductToEmployeeBloc,
                    AssignProductToEmployeeState>(
                  builder: (context, state) {
                    if (state is AssignProductToEmployeeLoading) {
                      return const Loader();
                    }

                    return SafeArea(
                      child: Column(
                        children: [
                          Expanded(
                            child: FormBuilder(
                              key: notificationFormKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  spacing: 15,
                                  children: [
                                    if (!isAppreciation)
                                      const SizedBox(height: 30),
                                    if (!isAppreciation)
                                      ImageChooserWidget(
                                        onFileSelected: (File file,
                                            String base64, String extension) {
                                          base64File = base64;
                                          fileExtension = extension;
                                        },
                                      )
                                    else
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: EmployeeSelectionSection(
                                          selectedEmployee: selectEmployee,
                                          employeeModel: employeeModel,
                                          onEmployeeSelected:
                                              onEmployeeSelected,
                                          isHeaderVisible: false,
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: AuthGradientButton(
                              buttonText: !isAppreciation
                                  ? Constants.addNotification
                                  : Constants.addAppreciation,
                              startColor: AppPallete.buttonColor,
                              endColor: AppPallete.gradientColor,
                              width: MediaQuery.of(context).size.width,
                              height: 55,
                              onPressed: onSubmit,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    );
                  },
                ),
                if (isLoading)
                  Container(
                    color: AppPallete.label3Color.withValues(alpha: 0.3),
                    child: const Center(
                      child: Loader(),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
