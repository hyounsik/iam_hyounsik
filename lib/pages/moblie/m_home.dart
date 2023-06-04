import 'package:flutter/material.dart';
import 'package:hyounsik_info/essential.dart';
import 'package:hyounsik_info/simple_data.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  final ScrollController scrollController1 = ScrollController();
  final ScrollController scrollController2 = ScrollController();
  final ScrollController scrollController3 = ScrollController();
  final ScrollController scrollController4 = ScrollController();
  @override
  Widget build(BuildContext context) {
    String cloud = "https://image.hyounsik.info/cloud_3.png";
    String me = "https://image.hyounsik.info/hyounsik.png";
    String testvalley1 =
        "https://image.hyounsik.info/testvalley/testvalley_1.jpeg";
    String testvalleyIcon =
        "https://image.hyounsik.info/testvalley/testvalley_icon.png";
    String effyIcon = "https://image.hyounsik.info/effy/effy_icon.png";
    Size mediaSize = MediaQuery.of(context).size;
    PathLocationBloc locationBloc = context.read<PathLocationBloc>();

    return Scaffold(
      body: HSContent(
        backgroundDatas: [
          HSBackgroundWidgetData(
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.lightBlue.shade100,
                  Colors.lightBlue.shade50,
                  Colors.white,
                ],
              )),
            ),
            scrollController1,
          ),
          HSBackgroundWidgetData(
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image.network(me),
            ),
            scrollController2,
            sizeRatio: 1.6,
            scale: 0.5,
            alignment: Alignment.center,
            // padding: const EdgeInsets.only(right: 48),
          ),
          HSBackgroundWidgetData(Image.network(cloud), scrollController3,
              sizeRatio: 1.04,
              scale: 1.3,
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(right: 48),
              reverse: true),
          HSBackgroundWidgetData(
              Transform.flip(flipX: true, child: Image.network(cloud)),
              scrollController4,
              sizeRatio: 1.4,
              scale: 1.2,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 48, bottom: 56),
              reverse: false),
        ],
        foregroundContent: Center(
            child: Container(
          width: mediaSize.width,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Header(),
                ...simpleCardDatas.map((item) {
                  return SimpleCard(
                    onTap: () {
                      locationBloc.location.add(item.location);
                    },
                    imgUrls: item.images.sublist(0, 1),
                    dateString: item.dateString,
                    title: item.title,
                    subTitle: item.subTtile,
                    imageWidth: constraints.maxWidth - 48,
                    imageHeight: constraints.maxWidth - 48,
                    color: Colors.black54,
                    textColor: Colors.white70,
                  );
                }).toList(),
                Footer()
              ],
            );
          }),
        )),
      ),
    );
  }
}
