abstract class ForgotPasswordState {}

class AuthInitial extends ForgotPasswordState {}

class AuthLoading extends ForgotPasswordState {}

class ForgetPasswordSent extends ForgotPasswordState {
  final String message;
  ForgetPasswordSent(this.message);
}

class VerifyOtpSuccess extends ForgotPasswordState {}

class VerifyOtpError extends ForgotPasswordState {
  final String message;
  VerifyOtpError(this.message);
}

class OtpResent extends ForgotPasswordState {
  final String message;
  OtpResent(this.message);
}

class ResetPasswordSuccess extends ForgotPasswordState {}

class AuthError extends ForgotPasswordState {
  final String message;
  AuthError(this.message);
}