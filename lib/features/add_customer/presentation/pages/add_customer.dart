import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/auth_gradient_button.dart';
import 'package:employee_ni_service/core/constants/constants.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/features/add_customer/presentation/bloc/add_customer_bloc.dart';
import 'package:employee_ni_service/features/add_customer/presentation/widgets/create_customer_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  static Route route() {
    return createSlideTransitionRoute(const AddCustomer());
  }

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final customerFormKey = GlobalKey<FormBuilderState>();
  String? selectedState;
  String? selectedGender;
  bool showGenderError = false;

  void onStateSelected(String? value) {
    setState(() {
      selectedState = value;
    });
  }

  void onGenderChanged(String? v) => setState(() {
        selectedGender = v;
        showGenderError = false;
      });

  @override
  void initState() {
    context.read<AddCustomerBloc>().add(GetStatesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: const AppBarWidget(
        title: "Add Customer",
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
                key: customerFormKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CreateCustomerForm(
                      selectedGender: selectedGender,
                      showGenderError: showGenderError,
                      onGenderChanged: onGenderChanged,
                      selectedState: selectedState,
                      onStateChanged: onStateSelected,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AuthGradientButton(
                buttonText: Constants.addCustomer,
                startColor: AppPallete.buttonColor,
                endColor: AppPallete.gradientColor,
                width: MediaQuery.of(context).size.width,
                height: 55,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
