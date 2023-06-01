import 'package:flutter/material.dart';
import 'package:hyounsik_info/essential.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  @override
  Widget build(BuildContext context) {
    String imageUrl = "https://image.hyounsik.info/default_backgroud.jpg";
    return Scaffold(
      body: HSContent(
        backgroundImage: imageUrl,
        foregroundContent: const Center(
          child: Text(
            'Desktop Home',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32),
          ),
        ),
      ),
    );
  }
}
