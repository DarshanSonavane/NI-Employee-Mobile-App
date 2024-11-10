import 'package:employee_ni_service/core/app_theme/app_theme.dart';
import 'package:employee_ni_service/features/auth/data/models/login_response_params.dart';
import 'package:employee_ni_service/features/auth/presentation/bloc/sign_in_bloc.dart';
import 'package:employee_ni_service/features/calibration/presentation/bloc/calibration_bloc.dart';
import 'package:employee_ni_service/features/complaint/presentation/bloc/complaint_bloc.dart';
import 'package:employee_ni_service/features/dashboard/provider/dashboard_state.dart';
import 'package:employee_ni_service/features/home/presentation/bloc/home_bloc.dart';
import 'package:employee_ni_service/features/set_reset_password/presentation/bloc/set_reset_password_bloc.dart';
import 'package:employee_ni_service/features/splash/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'core/constants/constants.dart';
import 'service_locator_dependecies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependecies();
  await Hive.openBox<LoginResponseParams>('loginBox');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<SignInBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<SetResetPasswordBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<HomeBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<ComplaintBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<CalibrationBloc>(),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => DashboardState(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appTitle,
      theme: AppTheme.lightThemeMode,
      home: const SplashScreen(),
    );
  }
}
