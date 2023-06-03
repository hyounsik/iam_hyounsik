import 'package:flutter/material.dart';
import 'package:hyounsik_info/essential.dart';

class HSContent extends StatefulWidget {
  final Widget? foregroundContent;
  final List<HSBackgroundWidgetData>? backgroundDatas;

  const HSContent({this.foregroundContent, this.backgroundDatas, super.key});

  @override
  State<HSContent> createState() => _HSContentState();
}

class _HSContentState extends State<HSContent> {
  final ScrollController foreController = ScrollController();

  late final List<HSBackgroundWidgetData> backgroundDatas;
  @override
  void initState() {
    widget.backgroundDatas ?? [];
    backgroundDatas = widget.backgroundDatas ?? [];
    foreController.addListener(() {
      for (final widgetData in backgroundDatas) {
        ScrollController backController = widgetData.scrollController;
        if (backController.positions.isNotEmpty) {
          final backgroudMax = backController.position.maxScrollExtent;
          final foregroundMax = foreController.position.maxScrollExtent;
          final foregroundOffset = foreController.offset;
          final ratio = backgroudMax / foregroundMax;
          backController.jumpTo(foregroundOffset * ratio);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...(widget.backgroundDatas ?? []).map((e) {
          return HSBackground(widgetData: e);
        }).toList(),
        HSForeground(
          controller: foreController,
          child: widget.foregroundContent,
        )
      ],
    );
  }
}
