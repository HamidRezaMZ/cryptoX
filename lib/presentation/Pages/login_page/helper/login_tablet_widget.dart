import 'package:cryptox/presentation/Pages/login_page/helper/base_login_page.dart';
import 'package:flutter/material.dart';

class LoginTabletWidget extends StatelessWidget {
  final double height;
  final double width;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final bool isObscure;

  const LoginTabletWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.emailController,
      required this.passwordController,
      required this.isObscure});

  @override
  Widget build(BuildContext context) {
    return BaseLoginPage(
        height: height,
        width: width,
        emailController: emailController,
        passwordController: passwordController,
        isObscure: isObscure,
        loginPartWidth: width * 0.5);
  }
}
