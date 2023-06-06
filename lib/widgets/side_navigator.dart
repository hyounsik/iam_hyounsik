import 'package:flutter/material.dart';

import 'package:hyounsik_info/essential.dart';

class SideNavigator extends StatelessWidget {
  final HSLocation location;
  const SideNavigator({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    PathLocationBloc locationBloc = context.read<PathLocationBloc>();
    final media = MediaQuery.of(context);
    final isMobile = mobileWidth > media.size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: isMobile ? 16 : 32),
        ...HSLocation.values.map((e) {
          bool isMe = locationBloc.currentLocation == e;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: isMobile ? 4 : 8),
            child: GestureDetector(
              onTap: () {
                if (!isMe) {
                  locationBloc.location.add(e);
                }
              },
              child: Container(
                padding: const EdgeInsets.only(left: 4, right: 4).add(
                  EdgeInsets.symmetric(vertical: isMobile ? 4 : 8),
                ),
                decoration: BoxDecoration(
                    color: isMe ? Colors.amberAccent : Colors.white70),
                child: Text(e.name,
                    style: isMobile
                        ? sideNaviTextStyleM.apply(
                            fontSizeDelta: isMe ? 2 : 1.0)
                        : sideNaviTextStyle.apply(
                            fontSizeDelta: isMe ? 5 : 1.0)),
              ),
            ),
          );
        }).toList(),
        // const SizedBox(height: 32),
      ],
    );
  }
}
