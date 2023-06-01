import 'package:flutter/material.dart';
import 'package:hyounsik_info/pages/pages.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Widget getHome(Size size) {
    if (size.width > 600) {
      return DesktopHomePage();
    } else {
      return MobileHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutBuilder(builder: (context, constraints) {
        MediaQueryData mediaQueryData = MediaQuery.of(context);
        Size screenSize = mediaQueryData.size;
        Widget home = getHome(screenSize);
        return Scaffold(
          body: AnimatedSwitcher(
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            duration: const Duration(milliseconds: 250),
            child: home,
          ),
        );
      }),
    );
  }
}
