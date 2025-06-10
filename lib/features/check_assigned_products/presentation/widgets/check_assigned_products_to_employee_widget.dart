import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/presentation/widgets/employee_selection_section.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_fetch_employee/response_employee_model.dart';
import 'package:employee_ni_service/features/products/presentation/bloc/product_bloc.dart';
import 'package:employee_ni_service/features/products/presentation/widgets/employee_assigned_product_layout.dart';
import 'package:employee_ni_service/features/products/presentation/widgets/no_product_available.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckAssignedProductsToEmployeeWidget extends StatefulWidget {
  final ResponseEmployeeModel? employeeModel;
  const CheckAssignedProductsToEmployeeWidget({super.key, this.employeeModel});

  @override
  State<CheckAssignedProductsToEmployeeWidget> createState() =>
      _CheckAssignedProductsToEmployeeWidgetState();
}

class _CheckAssignedProductsToEmployeeWidgetState
    extends State<CheckAssignedProductsToEmployeeWidget> {
  String? selectEmployee;

  bool get _hasEmployeeSelected =>
      selectEmployee != null && selectEmployee!.isNotEmpty;

  void onEmployeeSelected(String? value) {
    setState(() {
      selectEmployee = value;
    });
    if (selectEmployee != null && selectEmployee!.isNotEmpty) {
      context
          .read<ProductBloc>()
          .add(GetAssignedProductList(employeeId: selectEmployee!));
    }
  }

  Widget buildProductContent(ProductState state) {
    if (!_hasEmployeeSelected) {
      return const NoProductAvailable();
    }

    return switch (state) {
      ProductLoader() => const Center(child: Loader()),
      ProductSuccess() => buildSuccessContent(state),
      _ => const NoProductAvailable(),
    };
  }

  Widget buildSuccessContent(ProductSuccess state) {
    final productList = state.responseAssignedEmployeeProductList;

    if (productList.employeeInventory.isEmpty) {
      return const NoProductAvailable();
    }

    return EmployeeAssignedProductLayout(productList: productList);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EmployeeSelectionSection(
            selectedEmployee: selectEmployee,
            employeeModel: widget.employeeModel,
            onEmployeeSelected: onEmployeeSelected,
            isHeaderVisible: false,
          ),
          Expanded(
            child: BlocConsumer<ProductBloc, ProductState>(
              listener: (context, state) {
                if (state is ProductFailure) {
                  showSnackBar(context, state.message);
                }
              },
              builder: (context, state) => buildProductContent(state),
            ),
          ),
        ],
      ),
    );
  }
}
