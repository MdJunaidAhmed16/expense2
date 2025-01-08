import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class AuthService {
  static const String baseUrl = 'http://1xxxxx/api/auth';
  static const String tokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async{
    try{
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type':'application/json'},
        body: jsonEncode({
          'name':name,
          'email':email,
          'password':password,
          'phone':phone,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201){ // Using 201 code to specify Successfull and resource created
        final data = jsonDecode(response.body);
        await _saveTokens(data['token'], data['refresh_token']);
        return data;
      }else{
        final error = jsonDecode(response.body);
        throw Exception(error['error']??'Registration failed');
      }
    }
    catch(e){
      throw Exception("Failed to register :$e");
    }
  }


  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async{
    try{
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type':'application/json'},
        body: jsonEncode({
          'email':email,
          'password':password,
        }),
      );

      if (response.statusCode == 200){
        final data = jsonDecode(response.body);
        await _saveTokens(data['token'], data['refresh_token']);
        return data;
      }else{
        final error = jsonDecode(response.body);
        throw Exception(error['error'] ?? 'Login failed');
      }
    }
    catch(e){
      throw Exception("Failed to Login $e");
    }
  }

  Future<Map<String, dynamic>> getCurrentUser() async{
    try {
      final token = await getToken();
      if(token == null){
        throw Exception("No authenticated user");
      }

      final response = await http.get(
        Uri.parse('$baseUrl/user'),
        headers: {
          'Content-Type' : 'application/json',
          'Authorization' : 'Bearer $token',
        }
      );

      if (response.statusCode == 200){
        return jsonDecode(response.body);
      }else{
        throw Exception('Failed to get user details');
      }
    } catch (e) {
      throw Exception('Failed to get user details $e');
    }
  }

  // TODO !! : OAuth login
  Future<void> oauthLogin(String provider) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$provider/login'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final authUrl = data['auth_url'];
        // Handle OAuth redirect - You'll need to implement this based on your navigation setup
        // Example: launch(authUrl);
      } else {
        final error = jsonDecode(response.body);
        throw Exception(error['error'] ?? 'OAuth login failed');
      }
    } catch (e) {
      throw Exception('Failed to start OAuth login: $e');
    }
  }

  Future<void> logout() async{
    final prefs = await SharedPreferences.getInstance();
   
    await prefs.remove(tokenKey);
    await prefs.remove(refreshTokenKey);
    await prefs.clear();
  }

  Future<bool> isLoggedIn() async{
    final token = await getToken();
    return token != null;
  }

  Future<String?> getToken() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }

  // Save the tokens in the device using the library prefs
  Future<void> _saveTokens(String token, String refreshToken) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
    await prefs.setString(refreshTokenKey, refreshToken);
  }
}