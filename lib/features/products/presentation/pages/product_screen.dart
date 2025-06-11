import 'package:employee_ni_service/features/products/presentation/widgets/show_employee_products_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/fetch_user_role.dart';
import '../widgets/show_admin_products_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<String> listOfProductsInventoryUseCases = [
    "Insert/Update Master Inventory",
    "Assign Products to Employees",
    "Check Assigned Products to Employees"
  ];

  @override
  Widget build(BuildContext context) {
    return fetchUserRole() == "0"
        ? ShowAdminProductScreen(
            listOfProductsInventoryUseCases: listOfProductsInventoryUseCases)
        : const ShowEmployeeProductsScreen();
  }
}
