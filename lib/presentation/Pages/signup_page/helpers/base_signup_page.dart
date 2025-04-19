import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../Helpers/auth_text_field.dart';
import '../../../Helpers/signup_button.dart';
import '../../login_page/login_page.dart';
import '../../main_wrapper/main_wrapper.dart';

class BaseSignupPage extends StatelessWidget {
  final double height;
  final double width;  final double signUpPartWidth;

  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final bool isObscure;
  const BaseSignupPage({super.key, required this.height, required this.width, required this.userNameController, required this.emailController, required this.passwordController, required this.isObscure, required this.signUpPartWidth});

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
                      "Sign Up",
                      style: theme.textTheme.labelLarge!
                          .copyWith(fontSize: height * 0.035),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      "Create An Account",
                      style: theme.textTheme.labelLarge!.copyWith(
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    SizedBox(
                      width: signUpPartWidth,
                      child: Form(
                          key: key,
                          child: Column(
                            children: [
                              AuthTextField(
                                prefixIcon: const Icon(Icons.person),
                                hintText: "UserName",
                                controller: userNameController,
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
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              AuthTextField(
                                prefixIcon: const Icon(Icons.email),
                                hintText: "Email",
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Email";
                                  } else
                                  if (!value.endsWith("@gmail.com")) {
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
                                        : const Icon(Icons.visibility_off)),
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
                                buttonText: "Sign Up",
                                color: Colors.deepPurple,
                                onPressed: () {
                                  if (key.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MainWrapper(),
                                        ));
                                  }
                                },
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "Do You Have Account?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              SignUpButton(
                                buttonText: "Login",
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (
                                            context) => const LogInPage(),
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
          ),
        ],
      ),
    );
  }
}
