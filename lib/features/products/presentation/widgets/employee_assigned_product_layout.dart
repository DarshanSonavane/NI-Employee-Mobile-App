import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/constants/constants.dart';
import '../../data/models/response_assigned_employee_product_list.dart';

class EmployeeAssignedProductLayout extends StatelessWidget {
  const EmployeeAssignedProductLayout({
    super.key,
    required this.productList,
  });

  final List<ResponseAssignedEmployeeProductList> productList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final product = productList[index];
        return Card(
          elevation: 5,
          color: AppPallete.deepNavy,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppPallete.backgroundOpen,
                      image: DecorationImage(
                        image: NetworkImage(
                          product.productImageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.productName,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppPallete.backgroundColor),
                ),
                const SizedBox(height: 5),
                Text(
                  '₹${product.productPrice}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppPallete.gradientColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${Constants.avlQty} ${product.productQuantity}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppPallete.gradientColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
