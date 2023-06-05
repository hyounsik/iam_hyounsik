import 'package:flutter/material.dart';
import 'package:hyounsik_info/essential.dart';

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
              HSBackgroundWidgetData(
                Padding(
                  padding: EdgeInsets.only(top: 80, right: mediaSize.width / 8),
                  child: Image.network(
                    pageData.backgroundImage ?? me,
                    width:
                        mediaSize.width / 5 > 300 ? mediaSize.width / 5 : 300,
                  ),
                ),
                scrollController2,
                sizeRatio: 1.15,
                // scale: 0.5,
                alignment: Alignment.centerRight,
              ),
              HSBackgroundWidgetData(Image.network(cloud), scrollController3,
                  sizeRatio: 1.08,
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
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          pageData.title,
                          style: subHeaderTextStyle24.apply(
                              shadows: fontWhiteShadow),
                        ),
                        Text(
                          pageData.subTtile,
                          style:
                              bodyTextStyle12.apply(shadows: fontWhiteShadow),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ...pageData.jobs.map((item) {
                    return mediaSize.width < mobileWidth
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: DetailJobCardM(item),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: DetailJobCard(item),
                          );
                  }).toList(),
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
      double imageWidth = constraints.maxWidth / 3;
      // constraints.maxWidth / 3 > 300 ? 300 : constraints.maxWidth / 3;
      return Container(
        constraints: BoxConstraints(minHeight: 300),
        decoration: BoxDecoration(color: Colors.white70, boxShadow: boxShadow),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              jobData.image,
              width: imageWidth,
              height: imageWidth,
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  jobData.title,
                  style: headerTextStyle32,
                ),
                ...jobData.jobDetails
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            e,
                            style: bodyTextStyle16,
                          ),
                        ))
                    .toList()
              ],
            )
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
