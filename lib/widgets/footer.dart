import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 240,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Copyright 2023. Lee HS all rights reserved.'),
          SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}
