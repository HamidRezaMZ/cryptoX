import 'package:cryptox/domain/Providers/bottom_nav_provider.dart';
import 'package:cryptox/domain/Providers/theme_provider.dart';
import 'package:cryptox/presentation/Pages/home_page/home_page.dart';
import 'package:cryptox/presentation/Pages/main_wrapper/helpers/flashy_bottom_nav.dart';
import 'package:cryptox/presentation/Pages/market_page/market_page.dart';
import 'package:cryptox/presentation/Pages/profile_page/profile_page.dart';
import 'package:cryptox/presentation/Pages/wallet_page/wallet_page.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomNavProvider = Provider.of<BottomNavigationBarProvider>(context);
    List<Widget> pages = [
      const HomePage(),
      MarketPage(),
      const WalletPage(),
      const ProfilePage(),
    ];
    var themeProvider = Provider.of<ThemeProvider>(context);
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1024) {
        return SafeArea(

          child: Scaffold(
              body: pages[bottomNavProvider.currentIndex],
              bottomNavigationBar: const FlashyBottomNav()
          ),
        );
      } else {
        return SafeArea(
          child: Scaffold(
            body: pages[bottomNavProvider.currentIndex],

          ),
        );
      }
    },);
  }
}
