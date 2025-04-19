import 'dart:async';


import 'package:cryptox/domain/Providers/theme_provider.dart';
import 'package:cryptox/presentation/Pages/login_page/login_page.dart';
import 'package:cryptox/presentation/Pages/main_wrapper/main_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 4), (t) {

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LogInPage(),
          ));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset(
              "Assets/svg/line.svg",
              height: height,
              width: width,
              color: const Color.fromRGBO(108, 59, 170, 1),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: height * 0.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Crypt",
                        style:
                            theme.textTheme.labelLarge!.copyWith(fontSize: 90),
                      ),
                      const Text(
                        "X",
                        style: TextStyle(
                            color: Color.fromRGBO(108, 59, 170, 1),
                            fontSize: 95,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: height * 0.1, bottom: height * 0.1),
                  child: Column(
                    children: [
                      Text(
                        "Checking Connection...",
                        style:
                            theme.textTheme.labelSmall!.copyWith(fontSize: 15),
                      ),
                      Lottie.asset("Assets/Images/loading.json",
                          width: width * 0.2, height: width * 0.2),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
