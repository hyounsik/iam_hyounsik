import 'package:flutter/material.dart';
import 'package:hyounsik_info/essential.dart';

class Header extends StatelessWidget {
  final String image;
  final BoxFit? fit;
  const Header({super.key, required this.image, this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 32,
        ),
        Opacity(
          opacity: 0.9,
          child: Container(
            height: mediaSize.height * 0.5,
            width: mediaSize.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      image,
                    ),
                    fit: fit)),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}

class DetailHeader extends StatelessWidget {
  final String image;
  final BoxFit? fit;
  const DetailHeader(
      {super.key, required this.image, this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      bool isVertical = constraints.maxWidth < mediaSize.height;
      bool isMobile = mobileWidth > mediaSize.width;
      // double height =
      //     isMobile ? constraints.maxWidth : constraints.maxWidth / 2;
      double height = constraints.maxWidth / 2;
      double width = constraints.maxWidth;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Opacity(
            opacity: 0.99,
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        image,
                      ),
                      fit: fit)),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      );
    });
  }
}
