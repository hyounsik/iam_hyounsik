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
      'https://image.hyounsik.info/remon/remon_logo2.png',
      'https://image.hyounsik.info/remon/waggle_logo.png'
    ],
    'title': '리모트몬스터',
    'subTtile': 'IOS용 WebRTC Library 개발 및 관련 IOS 앱 개발',
    'dateString': '2017.08 ~ 2019.05',
    'path': HSLocation.remon.value
  },
  {
    'images': [
      'https://image.hyounsik.info/rainbow/rain_logo.png',
      'https://image.hyounsik.info/rainbow/tving_logo.png'
    ],
    'title': '레인보우브레인',
    'subTtile': 'TViNG등 IOS 앱 개발',
    'dateString': '2015.09 ~ 2017.05',
    'path': HSLocation.rainbow.value
  },
  {
    'images': ['https://image.hyounsik.info/sentence/sentence_logo.png'],
    'title': 'Sentence.lab',
    'subTtile': 'IOS/MacOS 앱 개발',
    'dateString': '2013.12 ~ 2015.07',
    'path': HSLocation.sentence.value
  },
  {
    'images': [
      'https://image.hyounsik.info/flk/flk_logo.png',
      'https://image.hyounsik.info/flk/epub_logo.png'
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
    'backgroundImage':
        'https://image.hyounsik.info/testvalley/testvalley_hand.png',
    'backgroundAccColor': 0xFF19BEE2,
    'backgroundColors': [
      0xFF00DA9B,
      0x1100DA9B,
      0xFFFFFFFF,
    ],
    'titleImage':
        'https://image.hyounsik.info/testvalley/testvalley_black_t_logo.png',
    'title': 'TestValley(비엘큐)',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/testvalley/testvalley_hand.png',
        'title': 'TestVally V2 앱(Flutter) 개발',
        'jobDetails': [
          '- 팩키지 구조 설계',
          '- 공통 UI Widget 제작',
          '- Core(통신, 전역 상태 관리) 팩키지 구현',
          '   - Rest Api 통신 서비스 구현',
          '   - Rest Api 구현',
          '- Material 3.0 기반 디자인 시스템 구현',
          '- V2앱 구현',
          '- V2앱 배포(AOS, IOS)'
        ]
      },
      {
        'image': 'https://image.hyounsik.info/testvalley/isas_tobe.png',
        'title': 'Legacy앱 유지보수 및 속도 개선',
        'jobDetails': ['- 앱 속도 개선', '- 앱 UI/UX 개선', '- 앱 안정성 개선']
      }
    ]
  },
  HSLocation.effy.value: {
    'id': '${HSLocation.effy.value}_id',
    'backgroundImage': 'https://image.hyounsik.info/hyounsik/hyounsik.png',
    'backgroundAccColor': 0x55FA7D7A,
    'backgroundColors': [0xffFA7D7A, 0xFFFFFFFF, 0xFFFFFFFF],
    'titleImage': 'https://image.hyounsik.info/effy/effy_t_logo.png',
    'title': 'Effy live',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/effy/effy_icon.png',
        'title': 'AOS/IOS (Flutter) 앱 개발',
        'jobDetails': ['상세 작업 내용']
      },
      {
        'image': 'https://image.hyounsik.info/effy/effy_icon.png',
        'title': 'DB 설계',
        'jobDetails': ['상세 작업 내용']
      },
      {
        'image': 'https://image.hyounsik.info/effy/effy_icon.png',
        'title': 'API 서버 구현',
        'jobDetails': ['상세 작업 내용']
      },
      {
        'image': 'https://image.hyounsik.info/effy/effy_icon.png',
        'title': '시스템 설계',
        'jobDetails': ['상세 작업 내용']
      }
    ]
  },
  HSLocation.remon.value: {
    'id': '${HSLocation.remon.value}_id',
    'backgroundImage': 'https://image.hyounsik.info/remon/webrtc_v_logo.png',
    'backgroundAccColor': 0x00000000,
    'backgroundColors': [0xFFFF921D, 0xFFFFFFFF, 0xFFFFFFFF],
    'titleImage': 'https://image.hyounsik.info/remon/remon_t_logo.png',
    'title': 'TestValley',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/remon/waggle_logo.png',
        'title': 'Waggle IOS 앱 개발',
        'jobDetails': ['상세 작업 내용']
      },
      {
        'image': 'https://image.hyounsik.info/remon/waggle_logo.png',
        'title': 'Waggle 앱 서버 개발',
        'jobDetails': ['상세 작업 내용']
      },
      {
        'image': 'https://image.hyounsik.info/remon/waggle_logo.png',
        'title': 'Waggle DB 설계',
        'jobDetails': ['상세 작업 내용']
      },
      {
        'image': 'https://image.hyounsik.info/remon/waggle_logo.png',
        'title': 'Waggle Quiz IOS 앱 개발',
        'jobDetails': ['상세 작업 내용']
      },
      {
        'image': 'https://image.hyounsik.info/remon/waggle_logo.png',
        'title': 'Waggle Quiz 서버 개발',
        'jobDetails': ['상세 작업 내용']
      },
      {
        'image': 'https://image.hyounsik.info/remon/waggle_logo.png',
        'title': 'Web RTC 라이브러리 제작 및 배포',
        'jobDetails': ['상세 작업 내용']
      }
    ]
  },
  HSLocation.rainbow.value: {
    'id': '${HSLocation.rainbow.value}_id',
    'backgroundImage': 'https://image.hyounsik.info/rainbow/rainbow_puke_1.png',
    'backgroundAccColor': 0x00000000,
    'backgroundColors': [
      0xFF1DFFFF,
      0xbb1DFFFF,
      0xFFFFFFFF,
      0xFFFFFFFF,
      0xFFFFFFFF
    ],
    'titleImage': 'https://image.hyounsik.info/rainbow/rain_t_logo.png',
    'title': 'TestValley',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
        'title': 'Tving',
        'jobDetails': ['상세 작업 내용']
      },
      {
        'image': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
        'title': '너스',
        'jobDetails': ['상세 작업 내용']
      },
      {
        'image': 'https://image.hyounsik.info/testvalley/testvalley_icon.png',
        'title': '홈캠',
        'jobDetails': ['상세 작업 내용']
      }
    ]
  },
  HSLocation.sentence.value: {
    'id': '${HSLocation.sentence.value}_id',
    'backgroundImage': 'https://image.hyounsik.info/hyounsik/hyounsik.png',
    'backgroundAccColor': 0x00000000,
    'backgroundColors': [0x00000000, 0xFFFFFFFF, 0xFFFFFFFF],
    'titleImage': 'https://image.hyounsik.info/sentence/sentence_t_logo.png',
    'title': 'TestValley',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/sentence/sentence_logo.png',
        'title': '메일 기반 Task 관리 앱 "Frame" 개발',
        'jobDetails': ['상세 작업 내용']
      },
      {
        'image': 'https://image.hyounsik.info/sentence/sentence_logo.png',
        'title': '클립 보드 공유 앱 개발',
        'jobDetails': ['상세 작업 내용']
      }
    ]
  },
  HSLocation.flk.value: {
    'id': '${HSLocation.flk.value}_id',
    'backgroundImage': 'https://image.hyounsik.info/hyounsik/hyounsik.png',
    'backgroundAccColor': 0x00000000,
    'backgroundColors': [0xFFEC1D49, 0x44EC1D49, 0xFFFFFFFF, 0xFFFFFFFF],
    'titleImage': 'https://image.hyounsik.info/flk/flk_h_logo.png',
    'title': 'TestValley',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/flk/flk_logo.png',
        'title': 'IOS용 교보 Epub 리더 앱 개발',
        'jobDetails': ['상세 작업 내용']
      },
      {
        'image': 'https://image.hyounsik.info/flk/flk_logo.png',
        'title': 'IOS용 Epub 리더 Library 개발',
        'jobDetails': ['상세 작업 내용']
      },
      {
        'image': 'https://image.hyounsik.info/flk/flk_logo.png',
        'title': 'AOS용 교보 Epub 리더 앱 개발',
        'jobDetails': ['상세 작업 내용']
      }
    ]
  },
  HSLocation.aboutMe.value: {
    'id': '${HSLocation.aboutMe.value}_id',
    'backgroundImage': 'https://image.hyounsik.info/hyounsik/hyounsik.png',
    'backgroundAccColor': 0x00000000,
    'backgroundColors': [0x00000000, 0xFFFFFFFF],
    'titleImage': 'https://image.hyounsik.info/hyounsik/hyounsik_logo.png',
    'title': 'TestValley',
    'subTtile': 'AOS/IOS (Flutter) 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/flk/flk_logo.png',
        'title': '관심사',
        'jobDetails': ['상세 작업 내용']
      },
      {
        'image': 'https://image.hyounsik.info/flk/flk_logo.png',
        'title': 'AOS/IOS (Flutter) 앱 개발',
        'jobDetails': ['상세 작업 내용']
      },
      {
        'image': 'https://image.hyounsik.info/flk/flk_logo.png',
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
  final String? backgroundImage;
  final Color backgroundAccColor;
  final List<Color> backgroundColors;
  final String title;
  final String subTtile;
  final List<DetailJobData> jobs;
  const DetailPageData(
      this.titleImage,
      this.title,
      this.subTtile,
      this.jobs,
      this.id,
      this.backgroundImage,
      this.backgroundColors,
      this.backgroundAccColor);

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
      data['backgroundImage'],
      colors,
      Color(data['backgroundAccColor']),
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
