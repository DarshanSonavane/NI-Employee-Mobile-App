import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class DashboardState with ChangeNotifier {
  int _selectedIndex = 4;
  bool _isFabSelected = true;

  final Map<int, String> _titles = {
    0: Constants.complaints,
    1: Constants.complaints, // Service Request title
    2: Constants.calibration,
    3: Constants.profile,
    4: Constants.appBarHome, // For FAB/Home
  };

  int get selectedIndex => _selectedIndex;
  bool get isFabSelected => _isFabSelected;
  String get currentTitle => _titles[_selectedIndex] ?? Constants.appBarHome;

  void updateIndex(int index) {
    _selectedIndex = index;
    _isFabSelected = index == 4;
    notifyListeners();
  }

  void selectFab() {
    _selectedIndex = 4;
    _isFabSelected = true;
    notifyListeners();
  }
}
