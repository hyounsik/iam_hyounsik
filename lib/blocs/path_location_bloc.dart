import 'package:hyounsik_info/essential.dart';

enum HSLocation {
  home('home', 'Home'),
  testvalley('testvalley', 'TestValley'),
  effy('effy', 'Effy Live'),
  remon('remon', '리모트 몬스터'),
  rainbow('rainbow', '레인보우 와이어리스'),
  sentence('sentence', 'Sentence.lab'),
  flk('flk', 'Feelink'),
  aboutMe('about_me', 'About me');

  final String value;
  final String name;
  const HSLocation(this.value, this.name);
}

extension HSLocationEX on HSLocation {
  static HSLocation fromString(String string) {
    switch (string) {
      case 'home':
        return HSLocation.home;
      case 'testvalley':
        return HSLocation.testvalley;
      case 'remon':
        return HSLocation.remon;
      case 'rainbow':
        return HSLocation.rainbow;
      case 'sentence':
        return HSLocation.sentence;
      case 'flk':
        return HSLocation.flk;
      case 'about_me':
        return HSLocation.aboutMe;
      default:
        return HSLocation.home;
    }
  }
}

class PathLocationBloc extends Disposable {
  final BehaviorSubject<HSLocation> location =
      BehaviorSubject<HSLocation>.seeded(HSLocation.home);

  HSLocation get currentLocation => location.value;
  Function get setLocation => location.add;

  @override
  void dispose() {
    location.close();
  }
}
