import 'blocs/path_location_bloc.dart';

final List<Map<String, dynamic>> simpleMapDatas = [
  {
    'images': ['https://image.hyounsik.info/testvalley/testvalley_icon.png'],
    'title': 'TestValley',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'dateString': '2022.11 ~ 현재',
    'path': HSLocation.testvalley.value
  },
  {
    'images': ['https://image.hyounsik.info/effy/effy_icon.png'],
    'title': 'Effy Live',
    'subTtile': '"EffyLive" 음성 기반 소셜 서비스 개발',
    'dateString': '2019.05 ~2022.10',
    'path': HSLocation.effy.value
  },
  {
    'images': [
      'https://image.hyounsik.info/remon_logo2.png',
      'https://image.hyounsik.info/waggle_logo.png'
    ],
    'title': '리모트몬스터',
    'subTtile': 'WebRTC Library 개발 및 관련 앱 개발',
    'dateString': '2017.08 ~ 2019.05',
    'path': HSLocation.remon.value
  },
  {
    'images': [
      'https://image.hyounsik.info/rain_logo.png',
      'https://image.hyounsik.info/tving_logo.png'
    ],
    'title': '레인보우브레인',
    'subTtile': 'TViNG등 IOS 앱 개발',
    'dateString': '2015.09 ~ 2017.05',
    'path': HSLocation.rainbow.value
  },
  {
    'images': ['https://image.hyounsik.info/sentence_logo.png'],
    'title': 'Sentence.lab',
    'subTtile': 'IOS/MacOS 앱 개발',
    'dateString': '2013.12 ~ 2015.07',
    'path': HSLocation.sentence.value
  },
  {
    'images': [
      'https://image.hyounsik.info/flk_logo.png',
      'https://image.hyounsik.info/epub_logo.png'
    ],
    'title': '필링크',
    'subTtile': 'IOS앱 개발 및 Epub Library 개발',
    'dateString': '2010.03 ~ 2013.02',
    'path': HSLocation.flk.value
  },
];

List<SimpleCardData> get simpleCardDatas =>
    simpleMapDatas.map((e) => SimpleCardData.fromMap(e)).toList();

class SimpleCardData {
  final List<String> images;
  final String title;
  final String subTtile;
  final String dateString;
  final HSLocation location;

  SimpleCardData({
    required this.images,
    required this.title,
    required this.subTtile,
    required this.dateString,
    required this.location,
  });

  factory SimpleCardData.fromMap(Map<String, dynamic> data) {
    return SimpleCardData(
        images: data['images'] ?? [],
        title: data['title'] ?? 'Title',
        subTtile: data['subTtile'] ?? 'Sub Title',
        dateString: data['dateString'] ?? '000.00 ~ 0000.00',
        location: HSLocationEX.fromString(data['path']));
  }
}

final Map<String, dynamic> detailMapDatas = {
  HSLocation.testvalley.value: {
    'titleImage': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
    'title': 'TestValley',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
        'title': 'AOS/IOS (Flutter) 앱 개발',
        'jobDetails': ['상세 작업 내용']
      }
    ]
  },
  HSLocation.effy.value: {
    'titleImage': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
    'title': 'TestValley',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
        'title': 'AOS/IOS (Flutter) 앱 개발',
        'jobDetails': ['상세 작업 내용']
      }
    ]
  },
  HSLocation.remon.value: {
    'titleImage': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
    'title': 'TestValley',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
        'title': 'AOS/IOS (Flutter) 앱 개발',
        'jobDetails': ['상세 작업 내용']
      }
    ]
  },
  HSLocation.rainbow.value: {
    'titleImage': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
    'title': 'TestValley',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
        'title': 'AOS/IOS (Flutter) 앱 개발',
        'jobDetails': ['상세 작업 내용']
      }
    ]
  },
  HSLocation.sentence.value: {
    'titleImage': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
    'title': 'TestValley',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
        'title': 'AOS/IOS (Flutter) 앱 개발',
        'jobDetails': ['상세 작업 내용']
      }
    ]
  },
  HSLocation.flk.value: {
    'titleImage': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
    'title': 'TestValley',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
        'title': 'AOS/IOS (Flutter) 앱 개발',
        'jobDetails': ['상세 작업 내용']
      }
    ]
  },
  HSLocation.aboutMe.value: {
    'titleImage': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
    'title': 'TestValley',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
        'title': 'AOS/IOS (Flutter) 앱 개발',
        'jobDetails': ['상세 작업 내용']
      }
    ]
  }
};

DetailCardData detailCardData(HSLocation location) {
  return DetailCardData.fromMap(detailMapDatas[location.value]);
}

class DetailCardData {
  final String titleImage;
  final String title;
  final String subTtile;
  final List<DetailJobData> jobs;
  const DetailCardData(this.titleImage, this.title, this.subTtile, this.jobs);

  factory DetailCardData.fromMap(Map<String, dynamic> data) {
    List<DetailJobData> jobs = [];
    if (data['jobs'] != null && data['jobs'] is List<Map<String, dynamic>>) {
      final list = data['jobs'] as List<Map<String, dynamic>>;
      jobs = list.map((e) => DetailJobData.fromMap(e)).toList();
    }
    return DetailCardData(
      data['titleImage'],
      data['title'] ?? 'Title',
      data['subTtile'] ?? 'Sub Title',
      jobs,
    );
  }
}

class DetailJobData {
  final String image;
  final String title;
  final List<String> jobDetails;
  const DetailJobData(this.image, this.title, this.jobDetails);

  factory DetailJobData.fromMap(Map<String, dynamic> data) {
    List<String> jobDetails = [];
    if (data['jobDetails'] != null && data['jobDetails'] is List<String>) {
      jobDetails = data['jobDetails'] as List<String>;
    }
    return DetailJobData(data['image'], data['title'] ?? 'Title', jobDetails);
  }
}
