import 'package:cryptox/domain/Providers/authentication_provider.dart';

import 'package:cryptox/domain/Providers/bottom_nav_provider.dart';
import 'package:cryptox/domain/Providers/crypto_api_provider.dart';
import 'package:cryptox/domain/Providers/theme_provider.dart';
import 'package:cryptox/presentation/Pages/detail_page/detail_page.dart';
import 'package:cryptox/presentation/Pages/login_page/login_page.dart';
import 'package:cryptox/presentation/Pages/main_wrapper/main_wrapper.dart';
import 'package:cryptox/presentation/Pages/signup_page/signup_page.dart';

import 'package:cryptox/presentation/Pages/splash_page/splash_page.dart';

import 'package:cryptox/presentation/Theme/dark_theme.dart';
import 'package:cryptox/presentation/Theme/light_theme.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
      ChangeNotifierProvider(create: (_) => CryptoApiProvider()),
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    child: const Config(),
  ));
}

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  void initState() {
    // TODO: implement initState

    final cryptoProvider =
    Provider.of<CryptoApiProvider>(context, listen: false);
    cryptoProvider.getAllCryptoData();
    cryptoProvider.getTopGainerData();
    cryptoProvider.getTopLooserData();
    cryptoProvider.getTopMarketCapData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: themeProvider.isDarkMode
                ? const Color(0xFF131313)
                : const Color(0xffFFFFF0),
            systemNavigationBarIconBrightness:
            themeProvider.isDarkMode ? Brightness.light : Brightness.dark,
            systemNavigationBarColor:
            themeProvider.isDarkMode ? Colors.black : Colors.white,
            statusBarIconBrightness:
            themeProvider.isDarkMode ? Brightness.light : Brightness.dark,
            systemNavigationBarDividerColor:
            themeProvider.isDarkMode ? Colors.black : Colors.white,
          ),
          child: MaterialApp(
            title: 'Exchange Crypto',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            showPerformanceOverlay: false,
            themeMode: themeProvider.themeMode,
            themeAnimationCurve: Curves.easeInOutCubicEmphasized,
            themeAnimationDuration: const Duration(seconds: 1),

            home: Directionality(
              textDirection: TextDirection.ltr,
              child: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth < 1024) {
                  return const SplashPage();
                } else {
                  return const MainWrapper();
                }
              },),
              // child: LogInPage(),
            ),)
          ,
        );
      },
    );
  }
}
