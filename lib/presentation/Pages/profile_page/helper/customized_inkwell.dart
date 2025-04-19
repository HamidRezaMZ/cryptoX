import 'package:cryptox/domain/Providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomizedInkwell extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;
  final String svg;
  const CustomizedInkwell({super.key,required this.onTap, required this.text, required this.svg});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap:onTap,
          child: Container(
            width: width,
            height: height * 0.06,
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      svg,
                      width: 30,
                      height: 30,
                      color: themeProvider.isDarkMode
                          ? Colors.white
                          : Colors.black,
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Text(
                      text,
                      style: theme.textTheme.labelLarge!
                          .copyWith(fontSize: 18),
                    )
                  ],
                ),
                SvgPicture.asset(
                  "Assets/svg/chevron_right.svg",
                  width: 20,
                  height: 20,
                  color: themeProvider.isDarkMode
                      ? Colors.white
                      : Colors.black,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
      ],
    );
  }
}
