
import 'package:cryptox/domain/Providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomizedContainer extends StatelessWidget {
  final GestureTapCallback onTab;

  final String? svgAddress;

  const CustomizedContainer(
      {super.key, required this.onTab,required this.svgAddress});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
            color: themeProvider.isDarkMode
                ? Colors.black
                : Colors.white,
            boxShadow: [
              BoxShadow(
                  color: themeProvider.isDarkMode
                      ? Colors.transparent
                      : Colors.grey.shade400,
                  blurRadius: 0.5,
                  offset: const Offset(3, 3)),
            ],
            borderRadius:
            const BorderRadius.all(Radius.circular(15))),
        height: 55,
        width: 55,
        child: Center(
          child: SvgPicture.asset(svgAddress.toString(),color: themeProvider.isDarkMode ? Colors.white : Colors.black,) ,
        ),
      ),
    );
  }
}
