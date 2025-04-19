import 'package:cryptox/domain/Providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Preferences",
            style: theme.textTheme.labelLarge!.copyWith(fontSize: 20),
          ),
          leadingWidth: width * 0.09,
          elevation: 0,
          forceMaterialTransparency: true,
          leading: Container(
            width: width * 0.05,
            height: height * 0.05,
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                "Assets/svg/arrow.svg",
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Text("General",
                    style: theme.textTheme.labelLarge!.copyWith(fontSize: 30)),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  width: width,
                  height: height * 0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Language",
                          style: theme.textTheme.labelLarge!
                              .copyWith(fontSize: 20,fontWeight: FontWeight.normal)),
                      Row(
                        children: [
                          Text("English",style:  theme.textTheme.labelLarge!
                              .copyWith(fontSize: 18,fontWeight: FontWeight.w300,)),
                          SvgPicture.asset(
                            "Assets/svg/chevron_right.svg",
                            width: 20,
                            height: 20,
                            color: themeProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height * 0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Theme",
                          style: theme.textTheme.labelLarge!
                              .copyWith(fontSize: 20,fontWeight: FontWeight.normal)),
                      Row(
                        children: [
                          Text(themeProvider.isDarkMode ? "Dark" : "Light",style:  theme.textTheme.labelLarge!
                              .copyWith(fontSize: 18,fontWeight: FontWeight.w300,)),
                          SvgPicture.asset(
                            "Assets/svg/chevron_right.svg",
                            width: 20,
                            height: 20,
                            color: themeProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height * 0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Captcha Type",
                          style: theme.textTheme.labelLarge!
                              .copyWith(fontSize: 20,fontWeight: FontWeight.normal)),
                      Row(
                        children: [
                          Text("Default",style:  theme.textTheme.labelLarge!
                              .copyWith(fontSize: 18,fontWeight: FontWeight.w300,)),
                          SvgPicture.asset(
                            "Assets/svg/chevron_right.svg",
                            width: 20,
                            height: 20,
                            color: themeProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height * 0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Font Size",
                          style: theme.textTheme.labelLarge!
                              .copyWith(fontSize: 20,fontWeight: FontWeight.normal)),
                      Row(
                        children: [
                          Text("20",style:  theme.textTheme.labelLarge!
                              .copyWith(fontSize: 18,fontWeight: FontWeight.w300,)),
                          SvgPicture.asset(
                            "Assets/svg/chevron_right.svg",
                            width: 20,
                            height: 20,
                            color: themeProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text("Security",
                    style: theme.textTheme.labelLarge!.copyWith(fontSize: 30)),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  width: width,
                  height: height * 0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Biometric",
                          style: theme.textTheme.labelLarge!
                              .copyWith(fontSize: 20,fontWeight: FontWeight.normal)),
                      Row(
                        children: [
                          Text("Default",style:  theme.textTheme.labelLarge!
                              .copyWith(fontSize: 18,fontWeight: FontWeight.w300,)),
                          SvgPicture.asset(
                            "Assets/svg/chevron_right.svg",
                            width: 20,
                            height: 20,
                            color: themeProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height * 0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Enable Two-Factor Authentication",
                          style: theme.textTheme.labelLarge!
                              .copyWith(fontSize: 20,fontWeight: FontWeight.normal)),
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
                SizedBox(
                  height: height * 0.02,
                ),
                Text("Notification",
                    style: theme.textTheme.labelLarge!.copyWith(fontSize: 30)),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  width: width,
                  height: height * 0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Notification Type",
                          style: theme.textTheme.labelLarge!
                              .copyWith(fontSize: 20,fontWeight: FontWeight.normal)),
                      Row(
                        children: [
                          Text("SMS, Email",style:  theme.textTheme.labelLarge!
                              .copyWith(fontSize: 18,fontWeight: FontWeight.w300,)),
                          SvgPicture.asset(
                            "Assets/svg/chevron_right.svg",
                            width: 20,
                            height: 20,
                            color: themeProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),);
  }
}
