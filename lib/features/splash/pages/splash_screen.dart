import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:employee_ni_service/features/auth/presentation/pages/signin.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(Constants.gifLogo),
      nextScreen: const SigninScreen(),
      animationDuration: const Duration(seconds: 4),
      splashIconSize: 250,
    );
  }
}
