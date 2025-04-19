import 'package:dio/dio.dart';

class AuthenticationApiWrapper {
  registerApi(email,password)async{
    var registerFormData = FormData.fromMap({
      // 'UserName' : userName,
      'Email' : email,
      'Password': password,
      // 'Password_confirmation': password,
    });

    final response = await Dio().post(
        'https://reqres.in/api/register',
        data: registerFormData
    );

    return response;
  }
}