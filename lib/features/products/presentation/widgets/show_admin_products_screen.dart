import 'package:employee_ni_service/features/assign_product_by_admin/presentation/pages/assign_product_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../insert_update_master_admin/presentation/pages/insert_update_master_inventory_screen.dart';

class ShowAdminProductScreen extends StatelessWidget {
  const ShowAdminProductScreen({
    super.key,
    required this.listOfProductsInventoryUseCases,
  });

  final List<String> listOfProductsInventoryUseCases;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: listOfProductsInventoryUseCases.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                      context, InsertUpdateMasterInventoryScreen.route());
                } else {
                  Navigator.push(context, AssignProductScreen.route());
                }
              },
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 8,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  leading: const Icon(
                    Icons.inventory_2_outlined,
                    size: 40,
                    color: AppPallete.blueColor,
                  ),
                  title: Text(
                    listOfProductsInventoryUseCases[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppPallete.label3Color,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: const Text(
                    'Tap to view details',
                    style: TextStyle(
                      color: AppPallete.label2Color,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppPallete.blueColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
