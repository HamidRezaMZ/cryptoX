import 'package:cryptox/presentation/Pages/home_page/helpers/home_desktop_widget.dart';

import 'package:flutter/material.dart';

import 'helpers/home_mobile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1024) {
          return const HomeMobileWidget();
        } else {
          return const HomeDesktopWidget();
        }
      },
    );
  }
}
