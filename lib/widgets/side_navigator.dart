import 'package:flutter/material.dart';

import 'package:hyounsik_info/essential.dart';

class SideNavigator extends StatelessWidget {
  final HSLocation location;
  const SideNavigator({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    PathLocationBloc locationBloc = context.read<PathLocationBloc>();
    return Column(
      children: HSLocation.values.map((e) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: GestureDetector(
            onTap: () {
              if (locationBloc.currentLocation != location) {
                locationBloc.location.add(e);
              }
            },
            child: Container(
              child: Text(e.name),
            ),
          ),
        );
      }).toList(),
    );
  }
}
