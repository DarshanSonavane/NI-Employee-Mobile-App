import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/provider/quantity_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/constants/constants.dart';

class RowQuantity extends StatefulWidget {
  final int assignedQuantity;
  const RowQuantity({super.key, required this.assignedQuantity});

  @override
  State<RowQuantity> createState() => _RowQuantityState();
}

class _RowQuantityState extends State<RowQuantity> {
  @override
  Widget build(BuildContext context) {
    final quantityProvider =
        Provider.of<QuantityProvider>(context, listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomGlolbalText(
          text: Constants.quantity,
          fontSize: 16,
          color: AppPallete.label3Color,
          fontWeight: FontWeight.bold,
        ),
        Row(
          children: [
            IconButton(
              onPressed: quantityProvider.getQuantity < widget.assignedQuantity
                  ? () {
                      quantityProvider.increment();
                    }
                  : null,
              icon: const Icon(
                Icons.add,
                color: AppPallete.gradientColor,
                weight: 16,
              ),
            ),
            CustomGlolbalText(
              text: quantityProvider.getQuantity.toString(),
              fontSize: 16,
              color: AppPallete.label3Color,
              fontWeight: FontWeight.bold,
            ),
            IconButton(
              onPressed: quantityProvider.getQuantity > 0
                  ? () {
                      quantityProvider.decrement();
                    }
                  : null,
              icon: const Icon(
                Icons.remove,
                color: AppPallete.errorColor,
                weight: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
