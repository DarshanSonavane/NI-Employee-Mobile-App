import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:flutter/material.dart';

import '../common/widgets/build_legends.dart';
import '../constants/constants.dart';

Widget fuelUtils(String? fuelType) {
  if (fuelType == '1') {
    return const BuildLegends(Constants.diesel, AppPallete.errorColor);
  } else if (fuelType == '0') {
    return const BuildLegends(Constants.petrol, AppPallete.gradientColor);
  } else if (fuelType == '2') {
    return const BuildLegends(Constants.combo, AppPallete.blueColor);
  } else {
    return const SizedBox(); // or handle unexpected/null value as needed
  }
}
