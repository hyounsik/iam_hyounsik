import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class HSBackground extends StatelessWidget {
  final ScrollController controller;
  final String? image;

  const HSBackground({required this.controller, this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxHeight * 1.1;
        double width = constraints.maxWidth;

        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            controller: controller,
            child: Container(
              height: height,
              width: width,
              child: image != null
                  ?
                  // kDebugMode
                  //     ? ImageNetwork(
                  //         image: image!, height: height, width: width)
                  // : Image.network(
                  //     image!,
                  //     fit: BoxFit.cover,
                  //   )
                  // ImageNetwork(
                  //     image: image!,
                  //     height: height,
                  //     width: width,
                  //     fitWeb: BoxFitWeb.fill,
                  //   )
                  Image.network(
                      image!,
                      fit: BoxFit.fill,
                    )
                  : Placeholder(),
            ),
          ),
        );
      },
    );
  }
}
