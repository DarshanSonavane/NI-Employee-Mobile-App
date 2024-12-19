import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/set_text_normal.dart';

class RowQuantity extends StatefulWidget {
  const RowQuantity({super.key});

  @override
  State<RowQuantity> createState() => _RowQuantityState();
}

class _RowQuantityState extends State<RowQuantity> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        setTextNormal("Quantity :", 1),
        Row(
          children: [
            IconButton(
              onPressed: () => setState(() => quantity++),
              icon: const Icon(
                Icons.add,
                color: AppPallete.gradientColor,
                weight: 20,
              ),
            ),
            setTextNormal(quantity.toString(), 1),
            IconButton(
              onPressed: () =>
                  setState(() => quantity = quantity > 0 ? quantity - 1 : 0),
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
