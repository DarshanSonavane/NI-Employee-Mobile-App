import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:employee_ni_service/features/auth/presentation/pages/signin.dart';
import 'package:employee_ni_service/features/dashboard/pages/dashboard.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import '../../../core/database/hive_storage_service.dart';
import '../../../service_locator_dependecies.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<bool> _checkIfLoggedIn() async {
    final hiveStorageService = sl<HiveStorageService>();
    var fetchuser = hiveStorageService.getUser();
    debugPrint("FetchUser: $fetchuser");
    return fetchuser != null ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Future.delayed(const Duration(seconds: 4), () => _checkIfLoggedIn()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AnimatedSplashScreen(
            splash: Image.asset(Constants.gifLogo),
            nextScreen: const SigninScreen(),
            animationDuration: const Duration(seconds: 4),
            splashIconSize: 250,
          );
        } else if (snapshot.data == true) {
          return const DashboardScreen();
        } else {
          return const SigninScreen();
        }
      },
    );
  }
}
