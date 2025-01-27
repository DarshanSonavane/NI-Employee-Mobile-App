import 'package:employee_ni_service/core/app_theme/app_theme.dart';
import 'package:employee_ni_service/features/auth/data/models/login_response_params.dart';
import 'package:employee_ni_service/features/auth/presentation/bloc/sign_in_bloc.dart';
import 'package:employee_ni_service/features/calibration/presentation/bloc/calibration_bloc.dart';
import 'package:employee_ni_service/features/complaint/presentation/bloc/complaint_bloc.dart';
import 'package:employee_ni_service/features/dashboard/provider/dashboard_state.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/provider/quantity_provider.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/provider/total_amount_provider.dart';
import 'package:employee_ni_service/features/home/presentation/bloc/home_bloc.dart';
import 'package:employee_ni_service/features/products/presentation/bloc/product_bloc.dart';
import 'package:employee_ni_service/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:employee_ni_service/features/set_reset_password/presentation/bloc/set_reset_password_bloc.dart';
import 'package:employee_ni_service/features/splash/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'core/constants/constants.dart';
import 'service_locator_dependecies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Geolocator.requestPermission();
  await initDependecies();
  await Hive.openBox<LoginResponseParams>(Constants.loginHiveBox);
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
        BlocProvider(
          create: (_) => sl<ProfileBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<ProductBloc>(),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DashboardState()),
          ChangeNotifierProvider(create: (_) => QuantityProvider()),
          ChangeNotifierProvider(create: (_) => TotalAmountProvider()),
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
