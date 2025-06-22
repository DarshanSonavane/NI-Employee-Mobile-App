import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_drop_down.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/model_state_list.dart';
import '../bloc/add_customer_bloc.dart';

class StateDropdownWidget extends StatelessWidget {
  final String? selectedState;
  final ValueChanged<String?> onStateChanged;

  const StateDropdownWidget({
    super.key,
    required this.selectedState,
    required this.onStateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddCustomerBloc, AddCustomerState, ModelStateList?>(
      selector: (state) {
        if (state is AddCustomerSuccess) {
          return state.modelStateList;
        }
        return null;
      },
      builder: (context, statesData) {
        List<DropdownMenuItem<String>> items = [];

        if (statesData != null) {
          items = statesData.data
              .map((item) => DropdownMenuItem<String>(
                    value: item.id,
                    child: CustomGlolbalText(
                      text: item.name ?? '',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppPallete.deepNavy,
                    ),
                  ))
              .toList();
        }

        return CustomDropdown<String>(
          value: selectedState,
          hintText: "Select State",
          items: items,
          onChanged: onStateChanged,
          borderColor: AppPallete.gradientColor,
          iconColor: AppPallete.deepNavy,
          textColor: AppPallete.label3Color,
          dropdownColor: AppPallete.backgroundColor,
        );
      },
    );
  }
}
