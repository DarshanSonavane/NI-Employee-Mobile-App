import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/presentation/bloc/assign_product_to_employee_bloc.dart';
import 'package:employee_ni_service/features/check_assigned_products/presentation/widgets/check_assigned_products_to_employee_widget.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_fetch_employee/response_employee_model.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckAssignedProducts extends StatefulWidget {
  const CheckAssignedProducts({super.key});

  static Route route() {
    return createSlideTransitionRoute(const CheckAssignedProducts());
  }

  @override
  State<CheckAssignedProducts> createState() => _CheckAssignedProductsState();
}

class _CheckAssignedProductsState extends State<CheckAssignedProducts> {
  ResponseEmployeeModel? employeeModel;
  @override
  void initState() {
    context.read<AssignProductToEmployeeBloc>().add(
          GetAllEmployeesList(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: const AppBarWidget(
        title: "Employee Products",
        isBackButtonVisible: true,
        isMoreButtonVisible: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocConsumer<AssignProductToEmployeeBloc,
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
            return Card(
              elevation: 5,
              color: AppPallete.backgroundColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: CheckAssignedProductsToEmployeeWidget(
                employeeModel: employeeModel,
              ),
            );
          },
        ),
      ),
    );
  }
}
