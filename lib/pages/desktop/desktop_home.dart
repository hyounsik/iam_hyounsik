import 'package:flutter/material.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Desktop Home',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
