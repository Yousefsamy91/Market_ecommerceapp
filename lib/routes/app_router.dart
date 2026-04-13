import 'package:go_router/go_router.dart';
import 'package:market_ecommerceapp/main.dart';
import '../features/authentication/forget_password/forget_password_screen_by_email.dart';
import '../features/authentication/forget_password/forget_password_screen_by_phone.dart';
import '../features/authentication/forget_password/verification_code_screen.dart';
import '../features/authentication/home_page/home_page_screen.dart';
import '../features/presentation/home_layout.dart';
import '../features/splash/splash_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/authentication/login_page/login_screen.dart';
import '../features/authentication/signup_page/register_screen.dart';

//import 'features/profile/profile_screen.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),

    GoRoute(
      path: '/onboarding',
      builder: (context, state) => Onboarding_Screen(),
    ),

    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),

    GoRoute(
      path: '/register',
      builder: (context, state) => SignUpScreen(),
    ),

    GoRoute(
      path: '/forgot-email',
      builder: (context, state) => ForgotPasswordEmailScreen(),
    ),
    GoRoute(
      path: '/forgot-phone',
      builder: (context, state) => ForgotPasswordPhoneScreen(),
    ),
    GoRoute(
      path: '/verification',
      builder: (context, state) {
        final email = state.extra as String;
        return VerificationPage(email: email);
      },
    ),
GoRoute(path: '/home_page',
    builder: (context,state)=>HomeLayout()
)

  ],
);

GoRouter get router => _router;