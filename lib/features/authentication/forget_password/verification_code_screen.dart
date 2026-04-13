import 'package:flutter/material.dart';

import '../../../core/widgets/custom_button.dart';

class VerificationPage extends StatelessWidget {
  final String email;
  VerificationPage({super.key, required this.email});

  final otpKey = GlobalKey<_OtpLineFieldsState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verification")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),

            Image.asset(
              "assets/images/verificat.png",
              height: 150,
            ),

            const SizedBox(height: 20),

            Text(
              "Please enter the 4 digit code\nsent to: $email",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),

            const SizedBox(height: 30),

            /// OTP Fields
            OtpLineFields(key: otpKey),

            const SizedBox(height: 40),

            CustomButton(
              text: "Verify Code",
              onPressed: () {
                final code = otpKey.currentState!.getCode();
                print("Entered OTP: $code");
              },
            ),

            const SizedBox(height: 20),

            TextButton(
              onPressed: () {
                print("Resend Code pressed");
              },
              child: const Text(
                "Resend Code",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpLineFields extends StatefulWidget {
  const OtpLineFields({super.key});

  @override
  State<OtpLineFields> createState() => _OtpLineFieldsState();
}

class _OtpLineFieldsState extends State<OtpLineFields> {
  final controllers = List.generate(4, (_) => TextEditingController());
  final focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void onChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  String getCode() {
    return controllers.map((e) => e.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return SizedBox(
          width: 50,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            decoration: const InputDecoration(
              counterText: "",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
            ),
            onChanged: (value) => onChanged(value, index),
          ),
        );
      }),
    );
  }
}