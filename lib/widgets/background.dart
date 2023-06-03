import 'package:flutter/material.dart';

class HSBackgroundWidgetData {
  final Widget child;
  final ScrollController scrollController;
  final bool reverse;
  final Axis scrollDirection;
  final AlignmentGeometry alignment;
  final double sizeRatio;
  final EdgeInsets padding;
  final double scale;
  HSBackgroundWidgetData(this.child, this.scrollController,
      {this.reverse = false,
      this.sizeRatio = 1.0,
      this.scale = 1.0,
      this.alignment = Alignment.center,
      this.padding = EdgeInsets.zero,
      this.scrollDirection = Axis.vertical});
}

class HSBackground extends StatelessWidget {
  final HSBackgroundWidgetData widgetData;

  const HSBackground({required this.widgetData, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isVertical = widgetData.scrollDirection == Axis.vertical;
        double height =
            constraints.maxHeight * (isVertical ? widgetData.sizeRatio : 1.0);
        double width =
            constraints.maxWidth * (!isVertical ? widgetData.sizeRatio : 1.0);

        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            controller: widgetData.scrollController,
            reverse: widgetData.reverse,
            scrollDirection: widgetData.scrollDirection,
            child: Container(
                height: height,
                width: width,
                padding: widgetData.padding,
                child: Align(
                  alignment: widgetData.alignment,
                  child: Transform.scale(
                    scale: widgetData.scale,
                    child: widgetData.child,
                  ),
                )),
          ),
        );
      },
    );
  }
}
