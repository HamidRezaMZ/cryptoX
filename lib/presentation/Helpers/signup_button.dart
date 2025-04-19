import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final Color color;
  final TextStyle? textStyle;
  const SignUpButton({super.key, this.onPressed, required this.buttonText, required this.color, this.textStyle});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return SizedBox(
      height: 50,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(15)),
              side: BorderSide(
                  color: Colors.deepPurple, width: 2),
            )),
        child:  Text(
          buttonText,
          style: textStyle ?? const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
