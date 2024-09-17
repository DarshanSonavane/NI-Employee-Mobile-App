import 'package:employee_ni_service/features/set_reset_password/presentation/widgets/notes_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/show_snackbar.dart';
import '../../../auth/presentation/widgets/auth_field.dart';
import '../../../auth/presentation/widgets/auth_gradient_button.dart';
import '../bloc/set_reset_password_bloc.dart';

class SetResetPassword extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SetResetPassword(),
      );
  const SetResetPassword({super.key});
  @override
  State<SetResetPassword> createState() => _SetResetPasswordState();
}

class _SetResetPasswordState extends State<SetResetPassword> {
  final formKey = GlobalKey<FormState>();
  final customerCodeController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    customerCodeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppPallete.gradientColor,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back
          },
        ),
      ),
      backgroundColor: AppPallete.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<SetResetPasswordBloc, SetResetPasswordState>(
          listener: (context, state) {
            if (state is SetResetPasswordFailure) {
              showSnackBar(context, state.message);
            } else if (state is SetResetPasswordSuccess) {}
          },
          builder: (context, state) {
            if (state is SetResetPasswordLoading) {
              return const Loader();
            }
            return Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Constants.appLogo,
                        width: 150,
                        height: 150,
                      ),
                      const Text(
                        Constants.setResetPasswordLabel,
                        style: TextStyle(
                            fontSize: 20,
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
                      AuthField(
                        hintText: Constants.confirmPassword,
                        controller: confirmPasswordController,
                      ),
                      const SizedBox(height: 15),
                      const NotesTextWidget(),
                      const SizedBox(height: 15),
                      AuthGradientButton(
                        buttonText: Constants.submit,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<SetResetPasswordBloc>().add(
                                  EventSetResetPassword(
                                    customerCode:
                                        customerCodeController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
