import 'package:flutter/material.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/custom_button.dart';

class ForgotPasswordPhoneScreen extends StatelessWidget {
  ForgotPasswordPhoneScreen({super.key});

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Forgot Password"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              "assets/images/Illustration_Forgot_Password_With_Phone.png",
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              "Please enter your phone number to\nreceive a verification code",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            AppTextField(
              label: "Phone",
              hint: "+20...",
              controller: phoneController,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Send Code",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}