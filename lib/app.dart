import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:hyounsik_info/essential.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final desktopHome = const DesktopHomePage();
  final mobileHome = const MobileHomePage();
  Widget getHome(Size size) {
    if (size.width > 600) {
      return desktopHome;
    } else {
      return mobileHome;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => PathLocationBloc(),
          dispose: (context, value) => value.dispose(),
        )
      ],
      child: MaterialApp(
        home: LayoutBuilder(builder: (context, constraints) {
          MediaQueryData mediaQueryData = MediaQuery.of(context);
          Size screenSize = mediaQueryData.size;
          return Scaffold(
            body: AnimatedSwitcher(
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              switchInCurve: Curves.bounceInOut,
              switchOutCurve: Curves.bounceInOut,
              duration: const Duration(milliseconds: 500),
              child: getHome(screenSize),
            ),
          );
        }),
      ),
    );
  }
}
