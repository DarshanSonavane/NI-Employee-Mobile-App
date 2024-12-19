import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/constants/constants.dart';
import 'package:employee_ni_service/features/auth/data/models/login_response_params.dart';
import 'package:employee_ni_service/features/auth/presentation/bloc/sign_in_bloc.dart';
import 'package:employee_ni_service/core/common/widgets/auth_field.dart';
import 'package:employee_ni_service/core/common/widgets/auth_gradient_button.dart';
import 'package:employee_ni_service/features/auth/presentation/widgets/rich_text.dart';
import 'package:employee_ni_service/features/auth/presentation/widgets/set_reset_password_widget.dart';
import 'package:employee_ni_service/features/dashboard/pages/dashboard.dart';
import 'package:employee_ni_service/features/set_reset_password/presentation/pages/set_reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/database/hive_storage_service.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../../../service_locator_dependecies.dart';

class SigninScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SigninScreen(),
      );
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final formKey = GlobalKey<FormState>();
  final customerCodeController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    customerCodeController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) async {
              if (state is SignInFailure) {
                showSnackBar(context, Constants.loginFailed);
              } else if (state is SignInSuccess) {
                _handleSignInSuccess(context, state.user);
              }
            },
            builder: (context, state) {
              if (state is SignInLoading) {
                return const Loader();
              }
              return Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Constants.appLogo),
                      const Text(
                        Constants.login,
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppPallete.gradientColor),
                      ),
                      const SizedBox(height: 30),
                      AuthField(
                        hintText: Constants.customerCode,
                        controller: customerCodeController,
                      ),
                      const SizedBox(height: 15),
                      AuthField(
                        hintText: Constants.password,
                        controller: passwordController,
                      ),
                      const SizedBox(height: 15),
                      AuthGradientButton(
                        buttonText: Constants.login,
                        startColor: AppPallete.buttonColor,
                        endColor: AppPallete.gradientColor,
                        width: 395,
                        height: 55,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<SignInBloc>().add(
                                  SignInLogin(
                                    id: customerCodeController.text.trim(),
                                    type: "1",
                                    password: passwordController.text.trim(),
                                  ),
                                );
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      SetResetPasswordWidget(
                        onPressedSetResetPassword: () {
                          Navigator.push(
                            context,
                            SetResetPassword.route(),
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      RichTextWidget(
                        onPressedTermAndCondition: () {},
                        onPressedPrivacyPolicy: () {},
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

void _handleSignInSuccess(
  BuildContext context,
  LoginResponseParams user,
) async {
  await sl<HiveStorageService>().saveUser(user);
  if (!context.mounted) return;
  Navigator.push(
    context,
    DashboardScreen.route(),
  );
}
