import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/auth_gradient_button.dart';
import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/core/constants/constants.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:employee_ni_service/features/add_employee/presentation/bloc/add_employee_bloc.dart';
import 'package:employee_ni_service/features/add_employee/presentation/widgets/create_emp_form.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/presentation/bloc/assign_product_to_employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  static Route route() {
    return createSlideTransitionRoute(const AddEmployee());
  }

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final employeeFormKey = GlobalKey<FormBuilderState>();
  String? selectedGender;
  String? selectedRole;
  bool showGenderError = false;
  bool showRoleError = false;

  void onGenderChanged(String? v) => setState(() {
        selectedGender = v;
        showGenderError = false;
      });
  void onRoleChanged(String? v) => setState(() {
        selectedRole = v;
        showRoleError = false;
      });

  void validateAndSubmit() {
    final validForm = employeeFormKey.currentState?.saveAndValidate() ?? false;
    setState(() {
      showGenderError = selectedGender == null;
      showRoleError = selectedRole == null;
    });

    if (validForm && !showGenderError && !showRoleError) {
      final data = {
        ...?employeeFormKey.currentState?.value,
        'gender': selectedGender == "Male" ? "1" : "0",
        'role': selectedRole == "Admin" ? "0" : "1",
        'isActive': "1",
        'employeeCode': ""
      };

      context.read<AddEmployeeBloc>().add(
            AddEmployeeEve(data: data),
          );
    } else {
      debugPrint('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: const AppBarWidget(
        title: "Add Employee",
        isBackButtonVisible: true,
        isMoreButtonVisible: false,
        isFromMoreIcon: false,
      ),
      body: SafeArea(
        child: Column(
          spacing: 15,
          children: [
            Expanded(
              child: FormBuilder(
                key: employeeFormKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: BlocConsumer<AddEmployeeBloc, AddEmployeeState>(
                      listener: (context, state) {
                        if (state is AddEmployeeSuccess) {
                          showSnackBar(context, state.message);
                          context.read<AssignProductToEmployeeBloc>().add(
                                GetAllEmployeesList(),
                              );
                          Navigator.pop(context);
                        } else if (state is AddEmployeeFailure) {
                          showSnackBar(context, state.error);
                        }
                      },
                      builder: (context, state) {
                        if (state is AddEmployeeLoading) {
                          return const Loader();
                        }
                        return CreateEmpForm(
                          selectedGender: selectedGender,
                          selectedRole: selectedRole,
                          showGenderError: showGenderError,
                          showRoleError: showRoleError,
                          onGenderChanged: onGenderChanged,
                          onRoleChanged: onRoleChanged,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AuthGradientButton(
                buttonText: Constants.addEmployee,
                startColor: AppPallete.buttonColor,
                endColor: AppPallete.gradientColor,
                width: MediaQuery.of(context).size.width,
                height: 55,
                onPressed: validateAndSubmit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
