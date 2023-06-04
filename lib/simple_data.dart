import 'package:flutter/material.dart';

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
    'id': '${HSLocation.testvalley.value}_id',
    'backgroundImages': [
      'https://image.hyounsik.info/testvalley/testvalley_icon.png'
    ],
    'backgroundColors': [0x00000000, 0xFFFFFFFF],
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
    'id': '${HSLocation.effy.value}_id',
    'backgroundImages': ['https://image.hyounsik.info/effy/effy_icon.png'],
    'backgroundColors': [0x00000000, 0xFFFFFFFF],
    'titleImage': 'https://image.hyounsik.info/effy/effy_icon.png',
    'title': 'TestValley',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/effy/effy_icon.png',
        'title': 'AOS/IOS (Flutter) 앱 개발',
        'jobDetails': ['상세 작업 내용']
      }
    ]
  },
  HSLocation.remon.value: {
    'id': '${HSLocation.remon.value}_id',
    'backgroundImages': ['https://image.hyounsik.info/remon_logo2.png'],
    'backgroundColors': [0x00000000, 0xFFFFFFFF],
    'titleImage': 'https://image.hyounsik.info/remon_logo2.png',
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
    'id': '${HSLocation.rainbow.value}_id',
    'backgroundImages': [
      'https://image.hyounsik.info/testvalley/testvalley_icon.png'
    ],
    'backgroundColors': [0x00000000, 0xFFFFFFFF],
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
    'id': '${HSLocation.sentence.value}_id',
    'backgroundImages': [
      'https://image.hyounsik.info/testvalley/testvalley_icon.png'
    ],
    'backgroundColors': [0x00000000, 0xFFFFFFFF],
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
    'id': '${HSLocation.flk.value}_id',
    'backgroundImages': [
      'https://image.hyounsik.info/testvalley/testvalley_icon.png'
    ],
    'backgroundColors': [0x00000000, 0xFFFFFFFF],
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
    'id': '${HSLocation.aboutMe.value}_id',
    'backgroundImages': [
      'https://image.hyounsik.info/testvalley/testvalley_icon.png'
    ],
    'backgroundColors': [0x00000000, 0xFFFFFFFF],
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

DetailPageData detailCardData(HSLocation location) {
  return DetailPageData.fromMap(detailMapDatas[location.value]);
}

class DetailPageData {
  final String id;
  final String titleImage;
  final List<String> backgroundImages;
  final List<Color> backgroundColors;
  final String title;
  final String subTtile;
  final List<DetailJobData> jobs;
  const DetailPageData(this.titleImage, this.title, this.subTtile, this.jobs,
      this.id, this.backgroundImages, this.backgroundColors);

  factory DetailPageData.fromLocation(HSLocation location) {
    return DetailPageData.fromMap(detailMapDatas[location.value]);
  }

  factory DetailPageData.fromMap(Map<String, dynamic> data) {
    List<DetailJobData> jobs = [];
    if (data['jobs'] != null && data['jobs'] is List<Map<String, dynamic>>) {
      final list = data['jobs'] as List<Map<String, dynamic>>;
      jobs = list.map((e) => DetailJobData.fromMap(e)).toList();
    }

    List<Color> colors = [];
    if (data['backgroundColors'] != null &&
        data['backgroundColors'] is List<int>) {
      final list = data['backgroundColors'] as List<int>;
      colors = list.map((e) => Color(e)).toList();
    }
    return DetailPageData(
      data['titleImage'],
      data['title'] ?? 'Title',
      data['subTtile'] ?? 'Sub Title',
      jobs,
      data['id'] ?? 'unknown',
      data['backgroundImages'] ?? [],
      colors,
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
