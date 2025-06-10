import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/data/models/model_master_inventory.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/presentation/bloc/assign_product_to_employee_bloc.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/presentation/widgets/assigning_work_widget.dart';
import 'package:employee_ni_service/features/dashboard/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/loader.dart';
import '../../../../core/utils/app_transition.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../../complaint/data/models/model_fetch_employee/response_employee_model.dart';
import '../../data/models/response_assigned_product_model.dart';

class AssignProductScreen extends StatefulWidget {
  const AssignProductScreen({super.key});

  static Route route() {
    return createSlideTransitionRoute(const AssignProductScreen());
  }

  @override
  State<AssignProductScreen> createState() => _AssignProductScreenState();
}

class _AssignProductScreenState extends State<AssignProductScreen> {
  ModelMasterInventory? masterInventory;
  ResponseEmployeeModel? employeeModel;
  @override
  void initState() {
    context.read<AssignProductToEmployeeBloc>().add(GetAllMasterInventory());
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
        title: "Assign Product",
        isBackButtonVisible: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocConsumer<AssignProductToEmployeeBloc,
            AssignProductToEmployeeState>(
          listener: (context, state) {
            if (state is AssignProductToEmployeeFailure) {
              showSnackBar(context, state.message);
            } else if (state
                is AssignProductToEmployeeSuccess<ModelMasterInventory>) {
              masterInventory = state.data;
            } else if (state
                is AssignProductToEmployeeSuccess<ResponseEmployeeModel>) {
              employeeModel = state.data;
            } else if (state is AssignProductToEmployeeSuccess<
                ResponseAssignedProductModel>) {
              showSnackBar(context, state.data.message);
            }
          },
          builder: (context, state) {
            if (state is AssignProductToEmployeeLoading) {
              return const Loader();
            }
            return AssigningWorkWidget(
              masterInventory: masterInventory,
              employeeModel: employeeModel,
            );
          },
        ),
      ),
    );
  }
}
