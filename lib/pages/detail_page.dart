import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hyounsik_info/essential.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DetailPage extends StatefulWidget {
  final HSLocation location;
  const DetailPage(this.location, {super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final HSLocation location;
  late final DetailPageData pageData;

  final ScrollController scrollController1 = ScrollController();
  final ScrollController scrollController2 = ScrollController();
  final ScrollController scrollController3 = ScrollController();

  final Map<String, ScrollController> backgroudScrollControllers = {};
  @override
  void initState() {
    location = widget.location;
    pageData = DetailPageData.fromLocation(location);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    PathLocationBloc locationBloc = context.read<PathLocationBloc>();
    String cloud = "https://image.hyounsik.info/cloud_3.png";
    String me = 'https://image.hyounsik.info/hyounsik/hyounsik.png';
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          HSContent(
            backgroundDatas: [
              HSBackgroundWidgetData(
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: pageData.backgroundColors,
                    )),
                  ),
                  scrollController1,
                  sizeRatio: 1.5),
              // HSBackgroundWidgetData(
              //   Padding(
              //     padding: EdgeInsets.only(top: 80, right: mediaSize.width / 8),
              //     child: Image.network(
              //       pageData.backgroundImage ?? me,
              //       width:
              //           mediaSize.width / 5 > 300 ? mediaSize.width / 5 : 300,
              //     ),
              //   ),
              //   scrollController2,
              //   sizeRatio: 1.15,
              //   // scale: 0.5,
              //   alignment: Alignment.centerRight,
              // ),
              HSBackgroundWidgetData(Image.network(cloud), scrollController3,
                  sizeRatio: 1.8,
                  scale: 1.2,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.only(right: 48),
                  reverse: true),
            ],
            foregroundContent:
                Center(child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DetailHeader(
                    image: pageData.titleImage,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          pageData.title,
                          textAlign: TextAlign.end,
                          style: subHeaderTextStyle24.apply(
                              shadows: fontWhiteShadow),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        if (pageData.dateString.isNotEmpty)
                          AutoSizeText(
                            pageData.dateString,
                            style: subHeaderTextStyle24.apply(
                                shadows: fontWhiteShadow, fontSizeFactor: 0.8),
                            minFontSize: 16,
                            maxLines: 1,
                          ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          pageData.subTtile,
                          style:
                              bodyTextStyle16.apply(shadows: fontWhiteShadow),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  StaggeredGrid.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      ...pageData.jobs.map((item) {
                        return DetailJobCard(item);
                      }).toList(),
                    ],
                  ),
                  Footer()
                ],
              );
            })),
          ),
          SideNavigator(location: location)
        ],
      );
    });
  }
}

class DetailJobCard extends StatelessWidget {
  final DetailJobData jobData;
  const DetailJobCard(this.jobData, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile = MediaQuery.of(context).size.width < mobileWidth;

      double imageWidth =
          isMobile ? constraints.maxWidth / 1.2 : constraints.maxWidth / 1.2;
      // constraints.maxWidth / 3 > 300 ? 300 : constraints.maxWidth / 3;
      TextStyle titleStyle = isMobile
          ? headerTextStyle32.apply(color: jobData.textColor)
          : headerTextStyle48.apply(color: jobData.textColor);
      TextStyle dateStyle = isMobile
          ? subHeaderTextStyle24.apply(color: jobData.textColor)
          : subHeaderTextStyle24.apply(color: jobData.textColor);
      TextStyle bodyStyle = isMobile
          ? bodyTextStyle16.apply(color: jobData.textColor)
          : bodyTextStyle16.apply(color: jobData.textColor);
      return Container(
        constraints: BoxConstraints(minHeight: 300),
        decoration: BoxDecoration(color: jobData.backgroundColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  AutoSizeText(
                    jobData.title,
                    style: titleStyle,
                    minFontSize: 24,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (jobData.dateString.isNotEmpty)
                    AutoSizeText(
                      jobData.dateString,
                      style: dateStyle.copyWith(fontWeight: FontWeight.bold),
                      minFontSize: 16,
                      maxLines: 1,
                    ),
                  const SizedBox(
                    height: 16,
                  ),
                  ...jobData.jobDetails
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              e,
                              style: bodyStyle,
                            ),
                          ))
                      .toList()
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            if (jobData.image != null)
              Image.network(
                jobData.image!,
                width: imageWidth,
                // height: imageWidth,
              ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      );
    });
  }
}

class DetailJobCardM extends StatelessWidget {
  final DetailJobData data;
  const DetailJobCardM(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
