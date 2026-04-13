import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateFromSplash();
  }

  Future<void> navigateFromSplash() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    bool? seenOnboarding = prefs.getBool('seenOnboarding');

    await Future.delayed(const Duration(seconds: 2));

    if (isLoggedIn != null && isLoggedIn) {
      context.go('/home');
    } else if (seenOnboarding != null && seenOnboarding) {
      context.go('/login');
    } else {
      context.go('/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/Logo_Splash_Screen.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}