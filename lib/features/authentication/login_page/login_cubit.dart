import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final Dio _dio = Dio();

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final response = await _dio.post(
        'https://orange-space-543455-ecommerce-backend.fly.dev/login',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        String token = data['token'] ?? '';

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('token', token);

        emit(LoginSuccess(token));
      } else {
        emit(LoginError(response.data['message']?.toString() ?? 'Login failed'));
      }
    } on DioError catch (e) {
      if (e.response != null) {
        emit(LoginError(e.response?.data['message']?.toString() ?? 'Login failed'));
      } else {
        emit(LoginError('Network error, try again'));
      }
    } catch (e) {
      emit(LoginError('Something went wrong, try again'));
    }
  }
}