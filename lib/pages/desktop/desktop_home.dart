import 'package:flutter/material.dart';
import 'package:hyounsik_info/essential.dart';
import 'package:hyounsik_info/simple_data.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  final ScrollController scrollController1 = ScrollController();
  final ScrollController scrollController2 = ScrollController();
  final ScrollController scrollController3 = ScrollController();
  @override
  Widget build(BuildContext context) {
    String cloud = "https://image.hyounsik.info/cloud_3.png";
    String me = 'https://image.hyounsik.info/hyounsik.png';

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
              padding: const EdgeInsets.only(top: 80),
              child: Image.network(me),
            ),
            scrollController2,
            sizeRatio: 1.15,
            scale: 0.5,
            alignment: Alignment.centerRight,
          ),
          HSBackgroundWidgetData(Image.network(cloud), scrollController3,
              sizeRatio: 1.08,
              scale: 1.2,
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(right: 48),
              reverse: true),
        ],
        foregroundContent: Center(
            child: Container(
          width: mediaSize.width,
          padding: const EdgeInsets.symmetric(horizontal: 48),
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
                    imgUrls: item.images,
                    dateString: item.dateString,
                    title: item.title,
                    subTitle: item.subTtile,
                    imageWidth: 300,
                    imageHeight: 300,
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
