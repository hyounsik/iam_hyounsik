import 'package:flutter/material.dart';
import 'package:hyounsik_info/essential.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  @override
  Widget build(BuildContext context) {
    String cloud = "https://image.hyounsik.info/cloud_3.png";
    String sun = "https://image.hyounsik.info/hend_phone.png";
    String testvalley1 =
        "https://image.hyounsik.info/testvalley/testvalley_1.jpeg";
    String testvalleyIcon =
        "https://image.hyounsik.info/testvalley/testvalley_icon.png";
    String effyIcon = "https://image.hyounsik.info/effy/effy_icon.png";
    Size mediaSize = MediaQuery.of(context).size;
    PathLocationBloc locationBloc = context.read<PathLocationBloc>();

    final ScrollController scrollController1 = ScrollController();
    final ScrollController scrollController2 = ScrollController();
    final ScrollController scrollController3 = ScrollController();
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
            Image.network(sun),
            scrollController2,
            sizeRatio: 1.15,
            scale: 0.6,
            alignment: Alignment.centerRight,
          ),
          HSBackgroundWidgetData(Image.network(cloud), scrollController3,
              sizeRatio: 1.04,
              scale: 1.1,
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
                const _Header(),
                ...List.generate(
                    5,
                    (index) => Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (index == 0) {
                                  locationBloc
                                      .setLocation(HSLocation.testvalley);
                                } else {
                                  locationBloc.setLocation(HSLocation.effy);
                                }
                              },
                              child: SizedBox(
                                width: double.infinity,
                                child: Container(
                                  constraints: BoxConstraints(
                                    minHeight: 500,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white70,
                                      boxShadow: boxShadow,
                                      borderRadius: borderRadius24),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 500,
                                        height: 500,
                                        decoration: BoxDecoration(
                                            borderRadius: borderRadius24,
                                            image: DecorationImage(
                                                image: NetworkImage(index == 0
                                                    ? testvalleyIcon
                                                    : effyIcon))),
                                        // child: Image.network(
                                        //   effyIcon,
                                        //   width: 500,
                                        // ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        )).toList()
              ],
            );
          }),
        )),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: mediaSize.height * 0.5,
        ),
        Text(
          '이현식',
          style: headerTextStyle1,
        )
      ],
    );
  }
}
