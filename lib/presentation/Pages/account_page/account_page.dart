import 'package:cryptox/domain/Providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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
          "Account",
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
              Text("Information",
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
                    Text("Email",
                        style: theme.textTheme.labelLarge!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.normal)),
                    Text("pythonh70@gmail.com",
                        style: theme.textTheme.labelLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ))
                  ],
                ),
              ),
              SizedBox(
                width: width,
                height: height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Name",
                        style: theme.textTheme.labelLarge!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.normal)),
                    Text("HamidReza",
                        style: theme.textTheme.labelLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ))
                  ],
                ),
              ),
              SizedBox(
                width: width,
                height: height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Birthdate",
                        style: theme.textTheme.labelLarge!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.normal)),
                    Row(
                      children: [
                        Text("2005/11/18",
                            style: theme.textTheme.labelLarge!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            )),
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
                    Text("Change Password",
                        style: theme.textTheme.labelLarge!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.normal)),
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
                width: width,
                height: height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delete Account",
                        style: theme.textTheme.labelLarge!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.red)),
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
              Text("Wallet",
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
                    Text("Connect To New Wallet",
                        style: theme.textTheme.labelLarge!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            )),
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
            ],
          ),
        ),
      ),
    );
  }
}
