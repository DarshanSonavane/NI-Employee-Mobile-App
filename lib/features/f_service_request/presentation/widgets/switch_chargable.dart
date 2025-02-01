import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/set_text_normal.dart';
import 'package:flutter/material.dart';

class SwitchChargable extends StatefulWidget {
  final ValueChanged<bool> onChargableChanged;
  const SwitchChargable({super.key, required this.onChargableChanged});

  @override
  State<SwitchChargable> createState() => _SwitchChargableState();
}

class _SwitchChargableState extends State<SwitchChargable> {
  bool isChargable = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          setTextNormal('Chargable: ${isChargable ? "Yes" : "No"}', 1),
          Switch(
              inactiveThumbColor: AppPallete.gradientColor,
              inactiveTrackColor: AppPallete.backgroundColor,
              activeTrackColor: AppPallete.backgroundColor,
              thumbColor: WidgetStateProperty.resolveWith<Color>(
                (states) {
                  if (states.contains(WidgetState.disabled)) {
                    return AppPallete.bottomNavigationButton;
                  }
                  if (states.contains(WidgetState.selected)) {
                    return AppPallete.gradientColor;
                  }
                  return AppPallete.bottomNavigationButton;
                },
              ),
              trackOutlineColor:
                  WidgetStateProperty.resolveWith<Color>((states) {
                return AppPallete.gradientColor;
              }),
              value: isChargable,
              onChanged: (value) {
                setState(() => isChargable = value);
                widget.onChargableChanged(value);
              }),
        ],
      ),
    );
  }
}
