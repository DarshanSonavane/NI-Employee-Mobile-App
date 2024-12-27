import 'package:employee_ni_service/features/f_service_request/presentation/provider/quantity_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/set_text_normal.dart';
import '../../../../core/constants/constants.dart';

class RowQuantity extends StatefulWidget {
  const RowQuantity({
    super.key,
  });

  @override
  State<RowQuantity> createState() => _RowQuantityState();
}

class _RowQuantityState extends State<RowQuantity> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    final quantityProvider =
        Provider.of<QuantityProvider>(context, listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        setTextNormal(Constants.quantity, 1),
        Row(
          children: [
            IconButton(
              onPressed: quantityProvider.increment,
              icon: const Icon(
                Icons.add,
                color: AppPallete.gradientColor,
                weight: 20,
              ),
            ),
            setTextNormal(quantityProvider.quantity.toString(), 1),
            IconButton(
              onPressed: quantityProvider.decrement,
              icon: const Icon(
                Icons.remove,
                color: AppPallete.errorColor,
                weight: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
