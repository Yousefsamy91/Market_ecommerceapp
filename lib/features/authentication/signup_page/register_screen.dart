import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/custom_button.dart';
import 'register_cubit.dart';
import 'register_state.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                context.go('/home');
              } else if (state is SignUpError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              bool isLoading = state is SignUpLoading;

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      width: 150,
                      height: 150,
                      child: Image.asset("assets/images/Logo_Log_In.png"),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                      child: AppTextField(label: 'Your Name', hint: 'Full Name', controller: nameController),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                      child: AppTextField(label: 'Username', hint: 'Username', controller: usernameController),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                      child: AppTextField(label: 'Phone Number', hint: '+20 101142409', controller: phoneController, keyboardType: TextInputType.number),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                      child: AppTextField(label: 'Email', hint: 'You@gmail.com', controller: emailController, keyboardType: TextInputType.emailAddress),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                      child: AppTextField(label: 'Password', hint: 'Enter your password', isPassword: true, controller: passwordController),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                      child: AppTextField(label: 'Confirm Password', hint: 'Re-enter password', isPassword: true, controller: confirmPasswordController),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child:CustomButton(
                        text: isLoading ? 'Loading...' : 'Sign Up',
                        onPressed: () {
                          if (!isLoading) {
                            context.read<SignUpCubit>().signUp(
                              name: nameController.text.trim(),
                              username: usernameController.text.trim(),
                              phone: phoneController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              confirmPassword: confirmPasswordController.text.trim(),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Or Continue With', style: TextStyle(color: Colors.black, fontSize: 13)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialButton('assets/images/icons8-google-50.png'),
                        const SizedBox(width: 15),
                        _socialIconButton(Icons.apple),
                        const SizedBox(width: 15),
                        _socialIconButton(Icons.facebook),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            context.go('/login');
                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(color: Color(0xFF3F80FF), fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _socialButton(String asset) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF3F80FF), width: 0.5),
      ),
      child: Center(
        child: Image.asset(asset, width: 30, height: 30),
      ),
    );
  }

  Widget _socialIconButton(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF3F80FF), width: 0.5),
      ),
      child: Center(
        child: Icon(icon, color: Colors.black, size: 32),
      ),
    );
  }
}