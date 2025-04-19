import 'package:cryptox/domain/Providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../Helpers/auth_text_field.dart';
import '../../../Helpers/signup_button.dart';
import '../../login_page/login_page.dart';
import '../../main_wrapper/main_wrapper.dart';
class SignupMobileWidget extends StatefulWidget {
  final double height;
  final double width;
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final bool isObscure;
  const SignupMobileWidget({super.key, required this.height, required this.width, required this.userNameController, required this.emailController, required this.passwordController, required this.isObscure});

  @override
  State<SignupMobileWidget> createState() => _SignupMobileWidgetState();
}

class _SignupMobileWidgetState extends State<SignupMobileWidget> {

  // FocusNode userNameFocusNode = FocusNode();
  // FocusNode emailFocusNode = FocusNode();
  // FocusNode passwordFocusNode = FocusNode();
  //
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   userNameFocusNode.dispose();
  //   emailFocusNode.dispose();
  //   passwordFocusNode.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    var theme = Theme.of(context);



    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isKeyboardVisible? SizedBox(height: widget.height*0.05,width: 0,) :Lottie.asset(
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
                      "Sign Up",
                      style: theme.textTheme.labelLarge!
                          .copyWith(fontSize: widget.height * 0.028),
                    ),
                    SizedBox(
                      height: widget.height * 0.01,
                    ),
                    Text(
                      "Create An Account",
                      style: theme.textTheme.labelLarge!.copyWith(
                          fontSize: widget.height * 0.02,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: widget.height * 0.03,
                    ),
                    AuthTextField(
                      prefixIcon: const Icon(Icons.person),
                      hintText: "UserName",
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
                      // focusNode: userNameFocusNode,
                      // onEditingComplete: () => emailFocusNode.requestFocus,
                    ),
                    SizedBox(
                      height: widget.height * 0.02,
                    ),
                    AuthTextField(
                      prefixIcon: const Icon(Icons.email),
                      hintText: "Email",
                      controller: widget.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Email";
                        } else if (!value.endsWith("@gmail.com")) {
                          return "Please Enter Valid Email";
                        }
                        return null;
                      },
                      // focusNode: emailFocusNode,
                      // onEditingComplete: () => passwordFocusNode.requestFocus,
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
                      // onEditingComplete: (){
                      //   if(key.currentState!.validate()){
                      //     authProvider.register(
                      //         widget.userNameController.text,
                      //         widget.emailController.text,
                      //         widget.passwordController.text,
                      //         context
                      //     );
                      //   }
                      // },
                    ),
                    SizedBox(
                      height: widget.height * 0.04,
                    ),
                    SignUpButton(
                      buttonText: "Sign Up",

                      color: Colors.deepPurple,
                      onPressed: () {

                          authProvider.register(
                            widget.userNameController.text,
                              widget.emailController.text,
                              widget.passwordController.text,
                              context
                          );
                        }

                    ),
                    SizedBox(
                      height: widget.height * 0.05,
                    ),
                     Row(
                      children: [
                        Text(
                          "Do You Have Account?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:  widget.height * 0.015,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: widget.height * 0.01,
                    ),
                    SignUpButton(
                      buttonText: "Login",
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInPage(),));
                      },
                      textStyle:  TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: widget.height * 0.02),
                    ),
                    SizedBox(
                      height: widget.height * 0.03,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
