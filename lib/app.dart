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
    if (size.width > 800) {
      return desktopHome;
    } else {
      return mobileHome;
    }
  }

  Widget getPage(HSLocation location, Size size) {
    Widget? page;

    switch (location) {
      case HSLocation.aboutMe:
        page = getHome(size);
        break;
      case HSLocation.testvalley:
        page = TestValleyPage();
        break;
      case HSLocation.effy:
        page = EffyPage();
        break;
      default:
        // page = getHome(size);
        break;
    }

    return page ?? Placeholder();
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
          PathLocationBloc locationBloc = context.read<PathLocationBloc>();
          Size screenSize = mediaQueryData.size;
          return Scaffold(
            body: StreamBuilder<HSLocation>(
                stream: locationBloc.location.stream,
                initialData: locationBloc.currentLocation,
                builder: (context, snapshot) {
                  HSLocation location = snapshot.data!;
                  return AnimatedSwitcher(
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                            decoration: BoxDecoration(boxShadow: boxShadow2),
                            constraints: screenSize.width > 800
                                ? BoxConstraints(
                                    maxWidth: 1400,
                                  )
                                : null,
                            child: getPage(location, screenSize)),
                      ));
                }),
          );
        }),
      ),
    );
  }
}
