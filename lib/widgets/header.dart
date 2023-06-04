import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;

    String hand_phone = "https://image.hyounsik.info/hyounsik_logo.png";
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 32,
        ),
        Opacity(
          opacity: 0.9,
          child: SizedBox(
            height: mediaSize.height * 0.5,
            child: Center(
              child: Image.network(hand_phone),
            ),
          ),
        ),
        // SizedBox(
        //   child: Center(
        //     child: Text(
        //       'I am hyounsik',
        //       style: headerTextStyle88,
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
