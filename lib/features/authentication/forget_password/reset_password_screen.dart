import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/custom_button.dart';
import 'forgot_password_cubit.dart';
import 'forgot_password_state.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;
  ResetPasswordScreen({super.key, required this.email});

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<ForgotPasswordCubit>(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Reset Password"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Password reset successfully")),
                  );
                  Navigator.pop(context);
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                bool isLoading = state is AuthLoading;
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    Image.asset("assets/images/Illustration_Create_New_Password.png", height: 200),
                    const SizedBox(height: 20),
                    const Text(
                      "New password must be different from last password",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      label: "New Password",
                      hint: "Enter new password",
                      controller: newPasswordController,
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      label: "Confirm Password",
                      hint: "Re-enter new password",
                      controller: confirmPasswordController,
                      isPassword: true,
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      text: isLoading ? "Loading..." : "Reset Password",
                      onPressed: () {
                        if (newPasswordController.text.isEmpty ||
                            confirmPasswordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please fill all fields")),
                          );
                          return;
                        }
                        if (newPasswordController.text != confirmPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Passwords do not match")),
                          );
                          return;
                        }
                        context.read<ForgotPasswordCubit>().resetPassword(
                          email,
                          newPasswordController.text.trim(),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}