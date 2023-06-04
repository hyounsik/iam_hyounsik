import 'package:flutter/material.dart';
import 'package:hyounsik_info/essential.dart';

class TestValleyPage extends StatefulWidget {
  const TestValleyPage({super.key});

  @override
  State<TestValleyPage> createState() => _TestValleyPageState();
}

class _TestValleyPageState extends State<TestValleyPage> {
  final ScrollController scrollController1 = ScrollController();
  final ScrollController scrollController2 = ScrollController();
  @override
  Widget build(BuildContext context) {
    String testvalleyIcon =
        "https://image.hyounsik.info/testvalley/testvalley_icon.png";
    Size mediaSize = MediaQuery.of(context).size;
    PathLocationBloc locationBloc = context.read<PathLocationBloc>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          locationBloc.location.add(HSLocation.home);
        },
        child: Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
              borderRadius: borderRadiusMax,
              color: Colors.white,
              boxShadow: boxShadow),
          child: Center(
            child: Icon(
              Icons.keyboard_arrow_left,
              size: 72,
            ),
          ),
        ),
      ),
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
            Container(
              child: Image.network(testvalleyIcon),
            ),
            scrollController2,
            sizeRatio: 1.2,
            scale: 1,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 48),
          ),
        ],
        foregroundContent: Center(
            child: Container(
          width: mediaSize.width,
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Header(),
                _Header(),
                _Header(),
                _Header(),
                _Header(),
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
          height: mediaSize.height - 240,
        ),
        Text(
          '이현식',
          style: headerTextStyle88,
        )
      ],
    );
  }
}
