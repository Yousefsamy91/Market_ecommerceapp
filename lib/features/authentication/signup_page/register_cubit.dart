import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'register_state.dart';
import 'package:market_ecommerceapp/core/services/api_service.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final ApiService _apiService = ApiService();

  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp({
    required String name,
    required String username,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SignUpLoading());
    try {
      final response = await _apiService.signUp(
        name: name,
        username: username,
        phone: phone,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      if (response.statusCode == 200) emit(SignUpSuccess());
      else emit(SignUpError(response.data['message']?.toString() ?? 'SignUp failed'));
    } on DioError catch (e) {
      if (e.response != null) {
        emit(SignUpError(e.response?.data['message']?.toString() ?? 'SignUp failed'));
      } else {
        emit(SignUpError('Network error, try again'));
      }
    } catch (e) {
      emit(SignUpError('Something went wrong, try again'));
    }
  }
}