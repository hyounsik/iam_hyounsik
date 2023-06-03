import 'package:flutter/material.dart';
import 'package:hyounsik_info/essential.dart';

class SimpleCard extends StatelessWidget {
  final VoidCallback onTap;
  final List<String>? imgUrls;
  final String? dateString;
  final String? title;
  final String? subTitle;
  final double imageWidth;
  final double imageHeight;
  final Color color;
  final Color textColor;
  final TextStyle? titleStyle;
  const SimpleCard(
      {required this.onTap,
      required this.imageWidth,
      required this.imageHeight,
      this.color = Colors.white70,
      this.textColor = Colors.black87,
      this.titleStyle,
      this.imgUrls,
      super.key,
      this.dateString,
      this.title,
      this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 600,
            ),
            decoration: BoxDecoration(
                color: color,
                boxShadow: boxShadow,
                borderRadius: borderRadius24),
            child: Column(
              children: [
                Opacity(
                  opacity: 0.93,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...(imgUrls ?? [])
                          .map((imgUrl) => Padding(
                                padding: const EdgeInsets.all(16).add(
                                    const EdgeInsets.symmetric(horizontal: 8)),
                                child: Container(
                                  width: 300,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius24,
                                    boxShadow: boxShadow3,
                                    image: DecorationImage(
                                        image: NetworkImage(imgUrl)),
                                  ),
                                ),
                              ))
                          .toList()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      dateString ?? '0000.00 ~ 0000.00',
                      style: subHeaderTextStyle32.apply(color: textColor),
                    ),
                    Text(
                      title ?? 'Title',
                      style: (titleStyle ?? headerTextStyle88)
                          .apply(color: textColor),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      subTitle ?? 'sub title',
                      style: headerTextStyle32.apply(color: textColor),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        onTap();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '자세히',
                            style: linkTextStyle24,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.lightBlue,
                            size: 32,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
