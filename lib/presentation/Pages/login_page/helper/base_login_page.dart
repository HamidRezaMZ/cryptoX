import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../Helpers/auth_text_field.dart';
import '../../main_wrapper/main_wrapper.dart';
import '../../../Helpers/signup_button.dart';
import '../../signup_page/signup_page.dart';

class BaseLoginPage extends StatelessWidget {
  final double height;
  final double width;
  final double loginPartWidth;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final bool isObscure;
  const BaseLoginPage({super.key, required this.height, required this.width, required this.emailController, required this.passwordController, required this.isObscure, required this.loginPartWidth});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final key = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'Assets/Images/login_lottie.json',
                  height: height * 0.5,
                  width: width * 0.5,
                  backgroundLoading: false,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Log In",
                      style: theme.textTheme.labelLarge!
                          .copyWith(fontSize: height * 0.035),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      "Enter to you Account",
                      style: theme.textTheme.labelLarge!.copyWith(
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    SizedBox(
                      width:loginPartWidth,
                      child: Form(
                          key: key,
                          child: Column(
                            children: [
                              AuthTextField(
                                prefixIcon: const Icon(Icons.email),
                                hintText: "Email",
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Email";
                                  } else if (!value
                                      .endsWith("@gmail.com")) {
                                    return "Please Enter Valid Email";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              AuthTextField(
                                isObscure: isObscure,
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: isObscure
                                        ? const Icon(Icons.visibility)
                                        : const Icon(
                                        Icons.visibility_off)),
                                hintText: "Password",
                                controller: passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Password";
                                  } else if (value.length < 8) {
                                    return "Password must be at least 8 character";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              SignUpButton(
                                buttonText: "Log In",
                                color: Colors.deepPurple,
                                onPressed: () {
                                  if (key.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const MainWrapper()));
                                  }
                                },
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              const Wrap(
                                crossAxisAlignment:
                                WrapCrossAlignment.start,
                                alignment: WrapAlignment.start,
                                clipBehavior: Clip.hardEdge,
                                children: [
                                  Text(
                                    "You Don Not Have Account?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              SignUpButton(
                                buttonText: "Sign Up",
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const SignUpPage(),
                                      ));
                                },
                                textStyle: const TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              )
                            ],
                          )),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
