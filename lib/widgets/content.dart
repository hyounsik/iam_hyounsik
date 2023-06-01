import 'package:flutter/material.dart';
import 'package:hyounsik_info/essential.dart';

class HSContent extends StatefulWidget {
  final Widget? foregroundContent;
  final String? backgroundImage;
  const HSContent({this.foregroundContent, this.backgroundImage, super.key});

  @override
  State<HSContent> createState() => _HSContentState();
}

class _HSContentState extends State<HSContent> {
  final ScrollController backController = ScrollController();
  final ScrollController foreController = ScrollController();
  @override
  void initState() {
    foreController.addListener(() {
      final backgroudMax = backController.position.maxScrollExtent;
      final foregroundMax = foreController.position.maxScrollExtent;
      final foregroundOffset = foreController.offset;
      final ratio = backgroudMax / foregroundMax;
      backController.jumpTo(foregroundOffset * ratio);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HSBackground(
          controller: backController,
          image: widget.backgroundImage,
        ),
        HSForeground(
          controller: foreController,
          child: widget.foregroundContent,
        )
      ],
    );
  }
}
