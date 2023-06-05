import 'package:auto_size_text/auto_size_text.dart';
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
    bool isMobile = MediaQuery.of(context).size.width < mobileWidth;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            constraints: isMobile
                ? null
                : const BoxConstraints(
                    minHeight: 600,
                  ),
            decoration: BoxDecoration(
                color: color,
                boxShadow: boxShadow,
                borderRadius: borderRadius24),
            child: Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                Opacity(
                  opacity: 0.93,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...(imgUrls ?? [])
                              .map((imgUrl) => Padding(
                                    padding: (imgUrls ?? []).length == 1
                                        ? EdgeInsets.zero
                                        : const EdgeInsets.symmetric(
                                            horizontal: 24),
                                    child: Container(
                                      width: imageWidth,
                                      height: imageHeight,
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
                  ),
                ),
                SizedBox(
                  height: isMobile ? 0 : 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        dateString ?? '0000.00 ~ 0000.00',
                        maxLines: 1,
                        style: isMobile
                            ? (titleStyle ?? subHeaderTextStyle24)
                                .apply(color: textColor)
                            : subHeaderTextStyle32.apply(color: textColor),
                      ),
                      AutoSizeText(
                        title ?? 'Title',
                        maxLines: 1,
                        style: isMobile
                            ? (titleStyle ?? headerTextStyle56)
                                .apply(color: textColor)
                            : (titleStyle ?? headerTextStyle88)
                                .apply(color: textColor),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AutoSizeText(
                        subTitle ?? 'sub title',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: isMobile
                            ? (titleStyle ?? subHeaderTextStyle18)
                                .apply(color: textColor)
                            : headerTextStyle32.apply(color: textColor),
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
                              style: isMobile
                                  ? (titleStyle ?? linkTextStyle18)
                                      .copyWith(fontWeight: FontWeight.bold)
                                  : linkTextStyle24,
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
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
