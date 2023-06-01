import 'package:flutter/material.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Mobile Home',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
    ;
  }
}
