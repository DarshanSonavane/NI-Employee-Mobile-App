import 'package:employee_ni_service/core/common/widgets/loader.dart';
import 'package:employee_ni_service/features/products/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/show_snackbar.dart';
import '../../../../core/app_theme/app_pallete.dart';
import 'employee_assigned_product_layout.dart';
import 'no_product_available.dart';

class ShowEmployeeProductsScreen extends StatelessWidget {
  const ShowEmployeeProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductFailure) {
              showSnackBar(context, state.message);
            }
          },
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoader) {
                return const Center(child: Loader());
              } else if (state is ProductSuccess) {
                final productList = state.responseAssignedEmployeeProductList;
                if (productList.employeeInventory.isEmpty) {
                  return const NoProductAvailable();
                }
                return EmployeeAssignedProductLayout(productList: productList);
              } else {
                return const NoProductAvailable();
              }
            },
          ),
        ),
      ),
    );
  }
}
