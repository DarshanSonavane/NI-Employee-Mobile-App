import 'package:employee_ni_service/core/utils/fetch_user_role.dart';
import 'package:employee_ni_service/features/products/presentation/bloc/product_bloc.dart';
import 'package:employee_ni_service/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/constants.dart';
import '../../../core/database/hive_storage_service.dart';
import '../../../service_locator_dependecies.dart';
import '../../calibration/presentation/bloc/calibration_bloc.dart';
import '../../complaint/presentation/bloc/complaint_bloc.dart';
import '../../home/presentation/bloc/home_bloc.dart';

class DashboardState with ChangeNotifier {
  int _selectedIndex = 4;
  bool _isFabSelected = true;
  final hiveStorageService = sl<HiveStorageService>();

  final Map<int, String> _titles = {
    0: Constants.complaints,
    1: Constants.calibration,
    2: Constants.productInventory,
    3: Constants.profile,
    4: Constants.appBarHome,
  };

  int get selectedIndex => _selectedIndex;
  bool get isFabSelected => _isFabSelected;
  String get currentTitle => _titles[_selectedIndex] ?? Constants.appBarHome;

  void updateIndex(int index, BuildContext context) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      _isFabSelected = index == 4;
      notifyListeners();
      _fetchTabData(index, context);
    }
  }

  void selectFab(BuildContext context) {
    context.read<HomeBloc>().add(GetAllHomeDetails());
    _selectedIndex = 4;
    _isFabSelected = true;
    notifyListeners();
  }

  void _fetchTabData(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.read<ComplaintBloc>().add(
            GetAllComplaintList(complaintType: Constants.activeComplaints));
        break;
      case 1:
        context.read<CalibrationBloc>().add(GetAllCalibrationList(
            calibrationType: Constants.activeCalibration));
        break;
      case 2:
        context.read<ProductBloc>().add(GetAssignedProductList(
            employeeId: hiveStorageService.getUser()!.id));
        break;
      case 3:
        context.read<ProfileBloc>().add(GetEmployeeProfileEvent(
            employeeId: hiveStorageService.getUser()!.id));
        break;
      default:
        debugPrint('Invalid tab index');
    }
  }
}
