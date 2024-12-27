import 'package:employee_ni_service/features/auth/data/models/login_response_params.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/constants.dart';

class HiveService {
  Future<void> init() async {
    // Initialize Hive
    await Hive.initFlutter();

    // Register adapters
    _registerAdapters();

    // Open the boxes required for the app
    await Hive.openBox<LoginResponseParams>(Constants.loginHiveBox);
    // You can open more boxes here as needed
  }

  void _registerAdapters() {
    Hive.registerAdapter(LoginResponseParamsAdapter());
  }
}
