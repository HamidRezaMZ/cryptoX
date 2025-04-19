import 'package:cryptox/domain/Providers/theme_provider.dart';
import 'package:cryptox/presentation/Pages/account_page/account_page.dart';
import 'package:cryptox/presentation/Pages/login_page/login_page.dart';
import 'package:cryptox/presentation/Pages/preferences_page/preferences_page.dart';
import 'package:cryptox/presentation/Pages/profile_page/helper/customized_inkwell.dart';
import 'package:cryptox/presentation/Pages/send_feedback_page/send_feedback_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
          "Settings",
          style: theme.textTheme.labelLarge!.copyWith(fontSize: 25),
        ),
        leadingWidth: width * 0.09,
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
          child: Column(
            children: [
              CustomizedInkwell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccountPage(),
                      )),
                  text: "Account",
                  svg: "Assets/svg/user.svg"),
              CustomizedInkwell(
                text: "Share My Public Address",
                svg: "Assets/svg/share.svg",
                onTap: () {},
              ),
              CustomizedInkwell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PreferencesPage(),
                      )),
                  text: "Preferences",
                  svg: "Assets/svg/cog.svg"),
              CustomizedInkwell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SendFeedbackPage(),
                      )),
                  text: "Send Feedback",
                  svg: "Assets/svg/chat.svg"),
              CustomizedInkwell(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogInPage(),
                      )),
                  text: "Log Out",
                  svg: "Assets/svg/logout.svg"),
            ],
          ),
        ),
      )),
    );
  }
}
