import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/constants/constants.dart';
import 'package:employee_ni_service/features/auth/presentation/bloc/sign_in_bloc.dart';
import 'package:employee_ni_service/features/auth/presentation/widgets/auth_field.dart';
import 'package:employee_ni_service/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:employee_ni_service/features/auth/presentation/widgets/rich_text.dart';
import 'package:employee_ni_service/features/auth/presentation/widgets/set_reset_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/utils/show_snackbar.dart';

class SigninScreen extends StatefulWidget {
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
            listener: (context, state) {
              if (state is SignInFailure) {
                showSnackBar(context, state.message);
              } else if (state is SignInSuccess) {}
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
                        isObscureText: true,
                      ),
                      const SizedBox(height: 15),
                      AuthGradientButton(
                        buttonText: Constants.login,
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
                      const SetResetPasswordWidget(),
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
