

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'https://your-api-url.com/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        // Assuming response.data is already a Map<String, dynamic>
        return response.data;
      } else if (response.statusCode == 404) {
        // Handle 404 specifically
        print('Login failed. User not found.');
        return {'success': false, 'error': 'User not found'};
      } else {
        // Handle other status codes
        print('Login failed with status code ${response.statusCode}');
        return {'success': false, 'error': 'Failed to login'};
      }
    } catch (error) {
      // Handle DioException or other errors
      print('Error: $error');
      return {'success': false, 'error': 'Failed to login'};
    }
  }


}