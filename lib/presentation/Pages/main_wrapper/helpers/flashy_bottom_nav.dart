import 'package:cryptox/domain/Providers/bottom_nav_provider.dart';
import 'package:cryptox/domain/Providers/theme_provider.dart';
import 'package:cryptox/package/flashy_bottom_nav.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';

class FlashyBottomNav extends StatelessWidget {
  const FlashyBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var bottomNavProvider = Provider.of<BottomNavigationBarProvider>(context);
    var theme = Theme.of(context);
    return FlashyTabBar(
      backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
      showElevation: false,
      animationCurve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 250),
      items: [
        FlashyTabBarItem(
            icon: SvgPicture.asset(
              themeProvider.isDarkMode
                  ? "Assets/svg/home_outline.svg"
                  : "Assets/svg/home_filled.svg",
              color: themeProvider.isDarkMode
                  ? Colors.white
                  : Colors.grey.shade800,
              width: 30,
              height: 30,
            ),
            title: Text(
              "Home",
              style: theme.bottomNavigationBarTheme.selectedLabelStyle,
            )),
        FlashyTabBarItem(
            icon: SvgPicture.asset(
              themeProvider.isDarkMode
                  ? "Assets/svg/chart_bar_outline.svg"
                  : "Assets/svg/chart_filled.svg",
              color: themeProvider.isDarkMode
                  ? Colors.white
                  : Colors.grey.shade800,
              width: 30,
              height: 30,
            ),
            title: Text(
              "Market",
              style: theme.bottomNavigationBarTheme.selectedLabelStyle,
            )),
        FlashyTabBarItem(
            icon: SvgPicture.asset(
              themeProvider.isDarkMode
                  ? "Assets/svg/wallet_outline.svg"
                  : "Assets/svg/wallet.svg",
              color: themeProvider.isDarkMode
                  ? Colors.white
                  : Colors.grey.shade800,
              width: 30,
              height: 30,
            ),
            title: Text(
              "Wallet",
              style: theme.bottomNavigationBarTheme.selectedLabelStyle,
            )),
        FlashyTabBarItem(
            icon: SvgPicture.asset(
              themeProvider.isDarkMode
                  ? "Assets/svg/user_outline.svg"
                  : "Assets/svg/user_filled.svg",
              color: themeProvider.isDarkMode
                  ? Colors.white
                  : Colors.grey.shade800,
              width: 30,
              height: 30,
            ),
            title: Text(
              "Profile",
              style: theme.bottomNavigationBarTheme.selectedLabelStyle,
            )),
      ],
      onItemSelected: (index) {
        bottomNavProvider.updateIndex(index);
      },
      selectedIndex: bottomNavProvider.currentIndex,
    );
  }
}
