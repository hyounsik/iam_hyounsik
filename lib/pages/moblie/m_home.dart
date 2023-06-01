import 'package:flutter/material.dart';
import 'package:hyounsik_info/essential.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  Widget build(BuildContext context) {
    String imageUrl = "https://image.hyounsik.info/default_m_backgroud.jpg";
    return Scaffold(
      body: HSContent(
        backgroundImage: imageUrl,
        foregroundContent: const Center(
          child: Text(
            'Mobile Home',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32),
          ),
        ),
      ),
    );
  }
}
