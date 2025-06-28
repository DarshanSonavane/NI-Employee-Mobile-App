import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/auth_gradient_button.dart';
import 'package:employee_ni_service/core/common/widgets/custom_form_builder_text_field.dart';
import 'package:employee_ni_service/core/common/widgets/employee_selection_section.dart';
import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/core/constants/constants.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:employee_ni_service/features/add_notification_appreciation.dart/presentation/widgets/image_chooser_widget.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/presentation/bloc/assign_product_to_employee_bloc.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_fetch_employee/response_employee_model.dart';
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
      body: BlocConsumer<AssignProductToEmployeeBloc,
          AssignProductToEmployeeState>(
        listener: (context, state) {
          if (state is AssignProductToEmployeeFailure) {
            showSnackBar(context, state.message);
          }
          if (state is AssignProductToEmployeeSuccess) {
            employeeModel = state.data;
          }
        },
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
                          if (!isAppreciation) const SizedBox(height: 30),
                          if (!isAppreciation)
                            const ImageChooserWidget()
                          else
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: EmployeeSelectionSection(
                                selectedEmployee: selectEmployee,
                                employeeModel: employeeModel,
                                onEmployeeSelected: onEmployeeSelected,
                                isHeaderVisible: false,
                              ),
                            ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
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
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: AuthGradientButton(
                    buttonText: !isAppreciation
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
          );
        },
      ),
    );
  }
}
