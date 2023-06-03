import 'dart:async';

import 'package:hyounsik_info/essential.dart';

enum HSLocation {
  aboutMe('about_me', 'about Me'),
  testvalley('testvalley', 'TestValley'),
  effy('effy', 'Effy Live');

  final String value;
  final String name;
  const HSLocation(this.value, this.name);
}

class PathLocationBloc extends Disposable {
  final BehaviorSubject<HSLocation> location =
      BehaviorSubject<HSLocation>.seeded(HSLocation.aboutMe);

  HSLocation get currentLocation => location.value;
  Function get setLocation => location.add;

  @override
  void dispose() {
    location.close();
  }
}
