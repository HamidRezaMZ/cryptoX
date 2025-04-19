import 'package:cryptox/presentation/Pages/signup_page/helpers/signup_desktop_widget.dart';
import 'package:cryptox/presentation/Pages/signup_page/helpers/signup_mobile_widget.dart';
import 'package:cryptox/presentation/Pages/signup_page/helpers/signup_tablet_widget.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final bool _isObscure = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return SignupMobileWidget(
              height: height,
              width: width,
              userNameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
              isObscure: _isObscure);
        } else if (constraints.maxWidth < 1024) {
          return SignupTabletWidget(
              height: height,
              width: width,
              userNameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
              isObscure: _isObscure);
        } else {
          return SignupDesktopWidget(
              height: height,
              width: width,
              userNameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
              isObscure: _isObscure);
        }
      },
    );
  }
}
//Consumer<AuthenticationProvider>(
//                             builder: (context, authProvider, child) {
//                               switch (authProvider.registerStatus?.status) {
//                                 case Status.COMPLETED:
//                                   WidgetsBinding.instance.addPostFrameCallback(
//                                       (tempTime) => Navigator.of(context)
//                                           .pushReplacement(MaterialPageRoute(
//                                               builder: (context) =>
//                                                   const MainWrapper())));
//                                   return SignUpButton(onPressed: () {
//                                     if (_key.currentState!.validate()) {
//                                       authProvider.registerApiProvider(
//                                           nameController.text,
//                                           emailController.text,
//                                           passwordController.text);
//
//                                     }
//                                   });
//                                 case Status.LOADING:
//                                   return const CircularProgressIndicator();
//                                 case Status.ERROR:
//                                   return const Text("Error");
//                                 default:
//                                   return const SignUpButton();
//                               }
//                             },
//                           )
