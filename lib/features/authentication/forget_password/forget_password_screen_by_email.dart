import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/custom_button.dart';
import 'forgot_password_cubit.dart';
import 'forgot_password_state.dart';

class ForgotPasswordEmailScreen extends StatelessWidget {
  ForgotPasswordEmailScreen({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          title: const Text("Forgot Password"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
              listener: (context, state) {
                if (state is ForgetPasswordSent) {
                  context.go('/verification');
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },

              builder: (context, state) {
                bool isLoading = state is AuthLoading;
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    Image.asset("assets/images/Illustration_Forgot_Password_With_Email.png", height: 200),
                    const SizedBox(height: 20),
                    const Text(
                      "Please enter your email address to receive a verification code",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      label: "Email",
                      hint: "you@gmail.com",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: isLoading ? 'Loading...' : 'Send Code',
                      onPressed: () {
                        if (!isLoading) {
                          if (emailController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Enter email")));
                            return;
                          }
                          context
                              .read<ForgotPasswordCubit>()
                              .sendResetEmail(emailController.text.trim());
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        context.go('/forgot-phone');
                      },
                      child: const Text(
                        "Try another way",
                        style: TextStyle(color: Color(0xFF3F80FF)),
                      ),
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