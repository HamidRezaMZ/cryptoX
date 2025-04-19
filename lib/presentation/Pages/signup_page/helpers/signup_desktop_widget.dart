import 'package:cryptox/presentation/Pages/signup_page/helpers/base_signup_page.dart';
import 'package:flutter/material.dart';

class SignupDesktopWidget extends StatelessWidget {
  final double height;
  final double width;

  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isObscure;
  const SignupDesktopWidget( {super.key,required this.height, required this.width,required this.userNameController,required this.emailController,required this.passwordController,required this.isObscure,});

  @override
  Widget build(BuildContext context) {
    return BaseSignupPage(
        height: height,
        width: width,
        userNameController: userNameController,
        emailController: emailController,
        passwordController: passwordController,
        isObscure: isObscure,
        signUpPartWidth: width * 0.3);
  }
}
