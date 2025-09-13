import 'dart:convert';
import 'package:flutter_application_1/utils/response_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl = 'http://localhost:8080/api';

  Future<ApiResponse<Map<String, dynamic>>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final decoded = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ApiResponse(
          success: true,
          statusCode: response.statusCode,
          data: decoded,
        );
      } else {
        return ApiResponse(
          success: false,
          statusCode: response.statusCode,
          message: decoded['message'] ?? 'Erreur inconnue',
          data: decoded,
        );
      }
    } catch (e) {
      return ApiResponse(
        success: false,
        statusCode: 500,
        message: 'Erreur de connexion : ${e.toString()}',
        data: null,
      );
    }
  }
}