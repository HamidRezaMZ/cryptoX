import 'package:cryptox/domain/Providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../Helpers/auth_text_field.dart';
import '../../main_wrapper/main_wrapper.dart';
import '../../../Helpers/signup_button.dart';
import '../../signup_page/signup_page.dart';

class LoginMobileWidget extends StatefulWidget {
  final double height;
  final double width;
  final TextEditingController userNameController;
  final TextEditingController passwordController;

  final bool isObscure;

  const LoginMobileWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.userNameController,
      required this.passwordController,
      required this.isObscure});

  @override
  State<LoginMobileWidget> createState() => _LoginMobileWidgetState();
}

class _LoginMobileWidgetState extends State<LoginMobileWidget> {
  // FocusNode userNameFocusNode = FocusNode();
  //
  // FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);


    final authProvider = Provider.of<AuthProvider>(context);
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isKeyboardVisible
                  ? const SizedBox(
                      height: 0,
                      width: 0,
                    )
                  : Lottie.asset(
                      'Assets/Images/waveloop.json',
                      height: widget.height * 0.2,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
              SizedBox(
                height: widget.height * 0.01,
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: theme.textTheme.labelLarge!
                            .copyWith(fontSize: widget.height * 0.028),
                      ),
                      SizedBox(
                        height: widget.height * 0.01,
                      ),
                      Text(
                        "Enter To Your Account",
                        style: theme.textTheme.labelLarge!.copyWith(
                            fontSize: widget.height * 0.02,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: widget.height * 0.03,
                      ),
                      SizedBox(
                        width: widget.width * 0.9,
                        child: Column(
                          children: [
                            AuthTextField(
                              prefixIcon: const Icon(Icons.person),
                              hintText: "User Name",
                              controller: widget.userNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter UserName";
                                } else if (value.length < 4) {
                                  return "Username must be at least 4 character";
                                } else if (value.length > 15) {
                                  return "Maximum Character is 15";
                                }
                                return null;
                              },
                              // autoFocus: true,
                              // focusNode: userNameFocusNode,
                              // onEditingComplete: () =>
                              //     passwordFocusNode.requestFocus(),
                            ),
                            SizedBox(
                              height: widget.height * 0.02,
                            ),
                            AuthTextField(
                                isObscure: widget.isObscure,
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: widget.isObscure
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off)),
                                hintText: "Password",
                                controller: widget.passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Password";
                                  } else if (value.length < 8) {
                                    return "Password must be at least 8 character";
                                  }
                                  return null;
                                },
                                // focusNode: passwordFocusNode,
                                // onEditingComplete: () {
                                //   authProvider.login(
                                //       widget.userNameController.text,
                                //       widget.passwordController.text,
                                //       context);
                                // }
                              ),
                            SizedBox(
                              height: widget.height * 0.04,
                            ),
                            SignUpButton(
                              buttonText: "Log In",
                              color: Colors.deepPurple,
                              onPressed: () {
                                authProvider.login(widget.userNameController.text,
                                    widget.passwordController.text, context);
                              },
                            ),
                            SizedBox(
                              height: widget.height * 0.05,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "You Don Not Have Account?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: widget.height * 0.01,
                            ),
                            SignUpButton(
                              buttonText: "Sign Up",
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpPage(),
                                    ));
                              },
                              textStyle: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: widget.height * 0.03,
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
