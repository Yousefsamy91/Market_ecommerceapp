import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:5000/api/v1',
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<Response> signUp({
    required String name,
    required String username,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return dio.post('/auth/signUp', data: {
      "name": name,
      "username": username,
      "phone": phone,
      "email": email,
      "password": password,
      "confirm_password": confirmPassword,
    });
  }

  Future<Response> signIn({
    required String email,
    required String password,
  }) {
    return dio.post('/auth/signIn', data: {
      "email": email,
      "password": password,
    });
  }

  Future<Response> sendForgetPassword({
    required String email,
  }) {
    return dio.post('/auth/activeResetPass', data: {
      "email": email,
    });
  }

  Future<Response> verifyOtp({
    required String email,
    required String otp,
  }) {
    return dio.post('/auth/activeResetPass', data: {
      "email": email,
      "code": otp,
    });
  }

  Future<Response> resetPassword({
    required String email,
    required String newPassword,
  }) {
    return dio.post('/auth/resetPassword', data: {
      "email": email,
      "password": newPassword,
    });
  }

  Future<Response> getProducts() {
    return dio.get('/products');
  }

  Future<Response> searchProducts(String query) {
    return dio.post('/products/search', data: {
      "query": query,
    });
  }
}