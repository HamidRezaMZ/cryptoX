// import 'package:cryptox/data/Models/authentication_model/ResponseModel.dart';
// import 'package:cryptox/data/Models/authentication_model/UserModel.dart';
// import 'package:cryptox/domain/Network/authentication_api_wrapper.dart';
// import 'package:flutter/material.dart';
//
// class AuthenticationProvider extends ChangeNotifier {
//   AuthenticationApiWrapper authApiWrapper = AuthenticationApiWrapper();
//
//   late dynamic futureData;
//   ResponseModel? registerStatus;
//   var loginStatus;
//   var error;
//   var response;
//
//   registerApiProvider( email, password) async {
//     loginStatus = ResponseModel.loading("Loading");
//     notifyListeners();
//     try {
//       response = await authApiWrapper.registerApi(email, password);
//       if (response.statusCode == 201) {
//         futureData = UserModel.fromJson(response.data);
//         registerStatus = ResponseModel.completed(response.data);
//       } else if (response.statusCode == 200) {
//         futureData = ApiStatus.fromJson(response.data);
//         registerStatus = ResponseModel.error(futureData.message);
//       }
//       notifyListeners();
//     } catch (e) {
//       registerStatus = ResponseModel.error("Something went Wrong");
//       notifyListeners();
//       print(e.toString());
//     }
//   }
// }
import 'dart:convert';
import 'package:cryptox/presentation/Pages/main_wrapper/main_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AuthProvider extends ChangeNotifier {
  String? _accessToken;
  String? _refreshToken;
  String? _errorMessage;

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  String? get errorMessage => _errorMessage;

  final String baseUrl = 'http://192.168.243.125:8000/'; // Replace with your server IP

  // Register function
  Future<void> register(String username, String email, String password,context) async {
    try {
      final url = Uri.parse('$baseUrl/api/register/');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'email': email, 'password': password}),
      );

      if (response.statusCode == 201) {
        _errorMessage = null;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainWrapper(),));
// Clear any error messages
        notifyListeners();
      } else {
        final error = json.decode(response.body);
        _errorMessage = error['error'] ?? 'Registration failed';
        notifyListeners();
        print(_errorMessage);
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
      notifyListeners();
    }
  }

  // Login function
  Future<void> login(String username, String password,context) async {
    try {
      final url = Uri.parse('$baseUrl/api/token/');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        final tokens = json.decode(response.body);
        _accessToken = tokens['access'];
        _refreshToken = tokens['refresh'];
        _errorMessage = null; // Clear any error messages
        notifyListeners();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainWrapper(),));
      } else {
        final error = json.decode(response.body);
        _errorMessage = error['error'] ?? 'Login failed';
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
      notifyListeners();
    }
  }

  // To clear the tokens when logging out
  void logout() {
    _accessToken = null;
    _refreshToken = null;
    _errorMessage = null;
    notifyListeners();
  }
}
