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
                  // Image.network(e), backgroudScrollControllers[e]!,
                  Container(
                    width: 50,
                    height: constraints.maxWidth * 0.8,
                    color: pageData.backgroundAccColor,
                  ),
                  scrollController2,
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  sizeRatio: 1.3),
              if (pageData.backgroundImage != null)
                HSBackgroundWidgetData(
                    Image.network(pageData.backgroundImage!), scrollController3,
                    // Container(),
                    // backgroudScrollControllers[e]!,
                    reverse: true,
                    sizeRatio: 1.5),
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
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pageData.title,
                          style: subHeaderTextStyle24,
                        ),
                        Text(pageData.subTtile),
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
                  style: headerTextStyle48,
                ),
                ...jobData.jobDetails
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            e,
                            style: subHeaderTextStyle24,
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
