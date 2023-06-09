import 'package:flutter/material.dart';

class HSForeground extends StatelessWidget {
  final ScrollController controller;
  final Widget? child;
  const HSForeground({required this.controller, this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          controller: controller,
          child: Container(
            child: child ?? Placeholder(),
          ),
        );
      },
    );
  }
}
