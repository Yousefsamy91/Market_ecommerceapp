import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_ecommerceapp/core/services/api_service.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(AuthInitial());

  final ApiService api = ApiService();

  Future<void> sendResetEmail(String email) async {
    emit(AuthLoading());
    try {
      final response = await api.sendForgetPassword(email: email);
      if (response.statusCode == 200) {
        emit(ForgetPasswordSent("OTP sent successfully"));
      } else {
        emit(AuthError("Failed to send OTP"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    emit(AuthLoading());
    try {
      final response = await api.verifyOtp(email: email, otp: otp);
      if (response.statusCode == 200) {
        emit(VerifyOtpSuccess());
      } else {
        emit(VerifyOtpError("Invalid OTP"));
      }
    } catch (e) {
      emit(VerifyOtpError(e.toString()));
    }
  }

  Future<void> resendOtp(String email) async {
    emit(AuthLoading());
    try {
      final response = await api.sendForgetPassword(email: email);
      if (response.statusCode == 200) {
        emit(OtpResent("OTP resent successfully"));
      } else {
        emit(AuthError("Failed to resend OTP"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> resetPassword(String email, String newPassword) async {
    emit(AuthLoading());
    try {
      final response = await api.resetPassword(email: email, newPassword: newPassword);
      if (response.statusCode == 200) {
        emit(ResetPasswordSuccess());
      } else {
        emit(AuthError("Failed to reset password"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}