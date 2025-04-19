
import 'package:cryptox/presentation/Pages/login_page/helper/login_desktop_widget.dart';
import 'package:cryptox/presentation/Pages/login_page/helper/login_mobile_widget.dart';
import 'package:cryptox/presentation/Pages/login_page/helper/login_tablet_widget.dart';

import 'package:flutter/material.dart';


class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
 static final TextEditingController emailController = TextEditingController();
 static final TextEditingController userNameController = TextEditingController();
 static  final TextEditingController passwordController = TextEditingController();

  final bool _isObscure = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return LoginMobileWidget(
              height: height,
              width: width,
              userNameController: userNameController,
              passwordController: passwordController,
              isObscure: _isObscure);
        } else if (constraints.maxWidth < 1024) {
          return LoginTabletWidget(
              height: height,
              width: width,
              emailController: emailController,
              passwordController: passwordController,
              isObscure: _isObscure);
        } else {
          return LoginDesktopWidget(
              height: height,
              width: width,
              emailController: emailController,
              passwordController: passwordController,
              isObscure: _isObscure);
        }
      },
    );
  }
}
