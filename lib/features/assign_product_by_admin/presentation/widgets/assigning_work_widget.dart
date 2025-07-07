import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/fetch_user_role.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../../complaint/data/models/model_fetch_employee/response_employee_model.dart';
import '../../data/models/model_master_inventory.dart';
import '../../data/models/product_assignment_model.dart';
import '../bloc/assign_product_to_employee_bloc.dart';
import 'available_quantity_display.dart';
import '../../../../core/common/widgets/employee_selection_section.dart';
import 'master_inventory_section.dart';
import 'quantity_adjuster_section.dart';

class AssigningWorkWidget extends StatefulWidget {
  final ModelMasterInventory? masterInventory;
  final ResponseEmployeeModel? employeeModel;

  const AssigningWorkWidget(
      {super.key, this.masterInventory, this.employeeModel});

  @override
  State<AssigningWorkWidget> createState() => _AssigningWorkWidgetState();
}

class _AssigningWorkWidgetState extends State<AssigningWorkWidget> {
  String? selectedProduct;
  String? selectEmployee;
  int initialAvailableQuantity = 0;
  int availableQuantity = 0;
  int assignedQuantity = 0;

  void onProductSelected(String? value) {
    setState(() {
      selectedProduct = value;
      if (value != null) {
        final selectedItem =
            widget.masterInventory!.data.firstWhere((item) => item.id == value);
        initialAvailableQuantity = selectedItem.totalQuantity;
        availableQuantity = initialAvailableQuantity;
        assignedQuantity = 0;
      }
    });
  }

  void onEmployeeSelected(String? value) {
    setState(() {
      selectEmployee = value;
    });
  }

  void incrementQuantity() {
    setState(() {
      if (assignedQuantity < initialAvailableQuantity) {
        assignedQuantity++;
        availableQuantity--;
      }
    });
  }

  void decrementQuantity() {
    setState(() {
      if (assignedQuantity > 0) {
        assignedQuantity--;
        availableQuantity++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppPallete.backgroundColor,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MasterInventorySection(
              selectedProduct: selectedProduct,
              masterInventory: widget.masterInventory,
              onProductSelected: onProductSelected,
            ),
            const SizedBox(height: 16),
            AvailableQuantityDisplay(
              availableQuantity: availableQuantity,
            ),
            const SizedBox(height: 16),
            EmployeeSelectionSection(
              selectedEmployee: selectEmployee,
              employeeModel: widget.employeeModel,
              onEmployeeSelected: onEmployeeSelected,
            ),
            const SizedBox(height: 16),
            QuantityAdjusterSection(
              assignedQuantity: assignedQuantity,
              onIncrement: incrementQuantity,
              onDecrement: decrementQuantity,
            ),
            const SizedBox(height: 24),
            AuthGradientButton(
              buttonText: Constants.proceed,
              startColor: AppPallete.buttonColor,
              endColor: AppPallete.gradientColor,
              width: MediaQuery.of(context).size.width,
              height: 55,
              onPressed: () {
                if (selectedProduct == null) {
                  showSnackBar(context, "Please select a product.");
                } else if (selectEmployee == null) {
                  showSnackBar(context, "Please select an Employee.");
                } else if (assignedQuantity == 0) {
                  showSnackBar(context, "Please assign a quantity.");
                } else {
                  final requestAssignProduct = ProductAssignmentModel(
                    assignedQuantity: assignedQuantity,
                    employeeId: selectEmployee!,
                    productId: selectedProduct!,
                    createdBy: fetchUserId(),
                  );

                  context.read<AssignProductToEmployeeBloc>().add(
                        AssignProductToEmployee(requestAssignProduct),
                      );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
