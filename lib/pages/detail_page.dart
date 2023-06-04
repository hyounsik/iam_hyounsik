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
                sizeRatio: 1.05),
            ...pageData.backgroundImages.map(
              (e) {
                return HSBackgroundWidgetData(
                    Image.network(e), scrollController1,
                    sizeRatio: 1.05);
              },
            ).toList(),
          ],
          foregroundContent:
              Center(child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DetailHeader(
                  image: pageData.titleImage,
                  fit: BoxFit.fitWidth,
                ),
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
          })),
        ),
        SideNavigator(location: location)
      ],
    );
  }
}
