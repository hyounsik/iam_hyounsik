import 'package:flutter/material.dart';
import 'package:hyounsik_info/essential.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final desktopHome = const DesktopHomePage();
  final mobileHome = const MobileHomePage();

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
                      child: _Page(
                          key: ValueKey(location.value),
                          location: location,
                          size: screenSize));
                }),
          );
        }),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final HSLocation location;
  final Size size;
  const _Page({super.key, required this.location, required this.size});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            decoration: BoxDecoration(boxShadow: boxShadow2),
            constraints: size.width > 600
                ? const BoxConstraints(
                    maxWidth: 1400,
                  )
                : null,
            child: location == HSLocation.home
                ? size.width < 600
                    ? const MobileHomePage()
                    : const DesktopHomePage()
                : DetailPage(location)));
  }
}
