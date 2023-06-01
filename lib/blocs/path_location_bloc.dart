import 'package:hyounsik_info/essential.dart';

enum HSLocation {
  aboutMe('about_me', 'about Me');

  final String value;
  final String name;
  const HSLocation(this.value, this.name);
}

class PathLocationBloc extends Disposable {
  final BehaviorSubject<HSLocation> location =
      BehaviorSubject<HSLocation>.seeded(HSLocation.aboutMe);

  @override
  void dispose() {}
}
