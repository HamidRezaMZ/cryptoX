import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final Icon prefixIcon;
  final IconButton? suffixIcon;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  final bool? isObscure;
  // final FocusNode? focusNode;
  // // final VoidCallback? onEditingComplete;
  // final bool? autoFocus;

  const AuthTextField({
    super.key,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    required this.controller,
    this.validator,
    this.isObscure,
     // this.focusNode,
    // this.onEditingComplete,
    // this.autoFocus,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // onEditingComplete: widget.onEditingComplete,
      // focusNode: widget.focusNode,
      // autofocus: widget.autoFocus ?? false,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,

        hintText: widget.hintText,
       hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
      fontSize: MediaQuery.of(context).size.height * 0.013,
          fontWeight: FontWeight.normal),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      obscureText: widget.isObscure ?? false,
      controller: widget.controller,
      validator: widget.validator,
    );
  }
}
