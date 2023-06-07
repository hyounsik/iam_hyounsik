import 'package:flutter/material.dart';

import 'blocs/path_location_bloc.dart';

final List<Map<String, dynamic>> simpleMapDatas = [
  {
    'images': ['https://image.hyounsik.info/testvalley/testvalley_icon.png'],
    'title': 'TestValley',
    'subTtile': 'AOS/iOS(Flutter) e-Commerce 앱 개발',
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
    'subTtile': 'iOS용 WebRTC Library 개발 및 관련 iOS 앱 개발',
    'dateString': '2017.08 ~ 2019.05',
    'path': HSLocation.remon.value
  },
  {
    'images': [
      'https://image.hyounsik.info/rainbow/rain_logo.png',
      'https://image.hyounsik.info/rainbow/tving_logo.png'
    ],
    'title': '레인보우브레인',
    'subTtile': 'TViNG등 iOS 앱 개발',
    'dateString': '2015.09 ~ 2017.05',
    'path': HSLocation.rainbow.value
  },
  {
    'images': ['https://image.hyounsik.info/sentence/sentence_logo.png'],
    'title': 'Sentence.lab',
    'subTtile': 'iOS/MacOS 앱 개발',
    'dateString': '2013.12 ~ 2015.07',
    'path': HSLocation.sentence.value
  },
  {
    'images': [
      'https://image.hyounsik.info/flk/flk_logo.png',
      'https://image.hyounsik.info/flk/epub_logo.png'
    ],
    'title': '필링크',
    'subTtile': 'iOS앱 개발 및 Epub Library 개발',
    'dateString': '2010.03 ~ 2013.02',
    'path': HSLocation.flk.value
  },
  {
    'images': ['https://image.hyounsik.info/hyounsik/hyounsik_logo_w.png'],
    'title': 'Lee Hyoun Sik',
    'subTtile': '이현식 입니다.',
    'dateString': '2010.03 ~ 현재',
    'path': HSLocation.aboutMe.value
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
    'backgroundColor': 0x00000000,
    'backgroundColors': [
      0xFF00DA9B,
      0x1100DA9B,
      0xFFFFFFFF,
    ],
    'titleImage':
        'https://image.hyounsik.info/testvalley/testvalley_black_t_logo_2.png',
    'title': 'TestValley(비엘큐)',
    'dateString': '2022.11 ~ 현재',
    'subTtile':
        '''Flutter를 이용한 AOS/iOS 앱 개발을 하였습니다.\nFlutter로 제작된 Legacy 앱 운영 및 개선 작업과 동시에\nV2앱 신규 개발을 진행 하여 성공적으로 V2앱을 런칭 하였습니다.''',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/testvalley/testvalley_app.png',
        'title': 'TestVally 앱 개발 및 운영',
        'dateString': '2022.11 ~ 현재',
        'jobDetails': [
          'App Store & Play Store 배포 및 운영',
          '앱 추가 기능 개발',
        ],
        'backgroundColor': 0xEE000000,
        'textColor': 0xFFFFFFFF
      },
      {
        'image':
            'https://image.hyounsik.info/testvalley/testvalley_v2_architecture_2.png',
        'title': 'TestVally V2 앱(Flutter) 설계 및 개발',
        'dateString': '2022.12 ~ 2023.05',
        'jobDetails': [
          'V2 버전 구조 설계 및 구현',
          'GetIt을 이용한 Service 의존성 주입',
          'Dio를 사용하여 Rest Api 구현',
          'Provider와 RxDart를 이용한 상태 관리',
          'Firebse FCM, Remote config 등을 이용하여 앱 운영 및 관리',
          'GA를 이용한 이벤트 추적'
        ],
        'backgroundColor': 0xDDFFFFFF,
        'textColor': 0xFF000000
      },
      {
        'image':
            'https://image.hyounsik.info/testvalley/testvalley_v1_to_v2_2.png',
        'title': 'Legacy앱 유지보수 및 속도 개선',
        'dateString': '2022.11 ~ 2023.05',
        'jobDetails': ['앱 속도 개선 및 안정성 개선', 'V1 to V2 점진적 업데이트를 위한 구조 설계 및 구현'],
        'backgroundColor': 0xEE000000,
        'textColor': 0xFFFFFFFF
      }
    ]
  },
  HSLocation.effy.value: {
    'id': '${HSLocation.effy.value}_id',
    'backgroundImage': 'https://image.hyounsik.info/hyounsik/hyounsik.png',
    'backgroundAccColor': 0x55FA7D7A,
    'backgroundColor': 0xFF000000,
    'backgroundColors': [0xffFA7D7A, 0xFFFFFFFF, 0xFFFFFFFF],
    'titleImage': 'https://image.hyounsik.info/effy/sign_cd_h_2.png',
    'title': 'Effy live',
    'dateString': '2019.06 ~ 2022.10',
    'subTtile':
        '회사 창립 멤버로 시작 하여 서비스 전체를 설계 하고 개발 하였습니다.\n앱개발 부터 서버, DB 모든 분야에 집적적으로 관여 하였습니다.',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/effy/effy_app_2.png',
        'title': 'Flutter를 이용한 앱 개발',
        'dateString': '2019.06 ~ 2022.10',
        'jobDetails': [
          'webRtc를 이용하여 라이브 방송 기능 구현',
          '오디오(speech to text) 포스트 기능 구현',
          '사용자 매칭 시스팀 구현',
          '사용자 별 알맞은 타임라임 제공',
          '소셜 기능 구현',
          'FireStore Sync기능을 이용하여 Seamless한 UX/UI 구현'
        ],
        'backgroundColor': 0xEE000000,
        'textColor': 0xFFFFFFFF
      },
      {
        'image': 'https://image.hyounsik.info/effy/server_arch.png',
        'title': 'DB 설계 및 관련 기능 구현',
        'dateString': '2019.06 ~ 2022',
        'jobDetails': [
          '소셜 기능 구현을 위한 Neo4j 모델 및 관계 설계',
          'Firestore 모델 설계',
          'MySql 모델 설계',
          'Firestore - Neo4j - MySql를 연결 하여 사용자별 맞춤 데이터 제공',
        ],
        'backgroundColor': 0xEE000000,
        'textColor': 0xFFFFFFFF
      },
      {
        'image': 'https://image.hyounsik.info/effy/server_arch_3.png',
        'title': '시스템 설계 및 백앤드 구현',
        'dateString': '2019.06 ~ 2022',
        'jobDetails': [
          '앱-서버-DB 설계 및 개발',
          'Could Funtions를 이용한 App API 구현',
          'Firestore - Neo4j - MySql 데이터 동기화',
          'NodeJS 기반 API 서버 구현',
          'NodeJS 결제 관리 서버 구현 (inApp 결제, paypal 결제 및 환전)'
        ],
        'backgroundColor': 0xEE000000,
        'textColor': 0xFFFFFFFF
      }
    ]
  },
  HSLocation.remon.value: {
    'id': '${HSLocation.remon.value}_id',
    'backgroundImage': 'https://image.hyounsik.info/remon/webrtc_v_logo.png',
    'backgroundAccColor': 0x00000000,
    'backgroundColor': 0xFF000000,
    'backgroundColors': [0xFFFF921D, 0xFFFFFFFF, 0xFFFFFFFF],
    'titleImage': 'https://image.hyounsik.info/remon/remon_t_logo.png',
    'title': 'Remote Monster',
    'dateString': '2017.08 ~ 2019.05',
    'subTtile': 'Web RTC 라이브러리 및 소셜 라이브 앱(iOS) 개발과 앱 서버(nodeJS)를 개발 하였습니다.',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/remon/webrtc_h_w_logo.png',
        'title': 'Web RTC 라이브러리 개발 및 배포',
        'dateString': '2017.08 ~ 2019.05',
        'jobDetails': [
          'iOS용 Web RTC Library 구현',
          'Cocoapods을 통하여 Library 배포 및 운영',
        ],
        'backgroundColor': 0xEE000000,
        'textColor': 0xFFFFFFFF
      },
      {
        'image': 'https://image.hyounsik.info/remon/waggle_quiz_app.png',
        'title': 'Waggle Quiz iOS 앱 개발',
        'dateString': '2018.12 ~ 2019.04',
        'jobDetails': [
          '자사 Web RTC 라이브러리를 이용하여 라이브 방송 기능 구현',
          'Firesbase Realtime DB의 sync 기능을 이용하여 실시간 퀴즈 정보 연동',
          '퀴즈 방송 앱 운영과 유지 보수'
        ],
        'backgroundColor': 0xEE000000,
        'textColor': 0xFFFFFFFF
      },
      {
        'image': 'https://image.hyounsik.info/remon/waggle_quiz_server.png',
        'title': 'Waggle Quiz 서버 개발',
        'dateString': '2018.12 ~ 2019.04',
        'jobDetails': ['Firesbase 기반 앱 서버 개발', 'Vue를 이용하여 관리자 페이지 구현'],
        'backgroundColor': 0xFFFFFFFF,
        'textColor': 0xFF000000
      },
      {
        'image': 'https://image.hyounsik.info/remon/waggle_app_s.png',
        'title': 'Waggle iOS 앱 개발',
        'dateString': '2017.10 ~ 2018.11',
        'jobDetails': [
          '자사 Web RTC 라이브러리를 이용하여 라이브 방송 기능 구현',
          '쇼셜 기능 구현',
          '베타 사용자 운영 및 기획 참여'
        ],
        'backgroundColor': 0xEE000000,
        'textColor': 0xFFFFFFFF
      },
      {
        'image': 'https://image.hyounsik.info/remon/remon_server_2.png',
        'title': 'Waggle 앱 서버 개발 및 DB 설계',
        'dateString': '2017.10 ~ 2018.11',
        'jobDetails': [
          'Neo4J를 이용하여 유저-방송 관계 DB 설계 및 구현',
          'NodeJS를 이용하여 App Server 개발',
          'Cloud Function를 이용하여 RealtimeDB와 Neo4J 연동 기능 구현',
          'Firebase Realtime DB를 이용하여 Seamleas앱 구현',
        ],
        'backgroundColor': 0xFFFFFFFF,
        'textColor': 0xFF000000
      }
    ]
  },
  HSLocation.rainbow.value: {
    'id': '${HSLocation.rainbow.value}_id',
    'backgroundImage': 'https://image.hyounsik.info/rainbow/rainbow_puke_1.png',
    'backgroundAccColor': 0x00000000,
    'backgroundColor': 0xFF000000,
    'backgroundColors': [
      0xFF1DFFFF,
      0xbb1DFFFF,
      0xFFFFFFFF,
      0xFFFFFFFF,
      0xFFFFFFFF
    ],
    'titleImage': 'https://image.hyounsik.info/rainbow/rain_t_logo.png',
    'title': '레인보우 와이어리스',
    'dateString': '2015.09 ~ 2017.05',
    'subTtile': 'iOS 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/rainbow/tving_h_logo.png',
        'title': 'iOS용 Tving 앱 5.0 개편 작업 참여',
        'dateString': '2016.10 ~ 2017.05',
        'jobDetails': [
          '메인 페이지 UI 및 기능 개발',
          '공통 UI 모듈 개발',
          '카테고리 상세 페이지 개발',
          '컨텐츠 상세 페이지 개발'
        ],
        'backgroundColor': 0xEE000000,
        'textColor': 0xFFFFFFFF
      },
      {
        'image': 'https://image.hyounsik.info/rainbow/nurse.png',
        'title': '`Nursing ERP` IoT 장비 관리 서비스 개발',
        'dateString': '2016.01 ~ 2016.09',
        'jobDetails': [
          'Nodejs를 이용한 application 서버 개발',
          '- WebSocket 이용한 단말기 실시간 상태 관리 기능 개발',
          '- MongoDB 서버 구축 및 DB 설계, CRUD 기능 개발',
          'Polymer를 이용한 웹 클라이언트 개발(관리자 페이지)',
          'Angularjs를 이용한 웹 클라이언트 개발(사용자 페이지)',
          '- 환자 관리 사이트 개편 및 유지보수',
          '- 환자 관리 사이트 - 장비관리 사이트 간 연동 기능 개발]',
        ],
        'backgroundColor': 0xEE000000,
        'textColor': 0xFFFFFFFF
      },
      {
        'image': 'https://image.hyounsik.info/rainbow/rain_h_logo.png',
        'title': 'iOS용 KT 홈캠 앱 개발',
        'dateString': '2015.05 ~ 2015.12',
        'jobDetails': [
          '영상 재생 및 관리 기능 개발',
          '실시간 카메라 제어(REST) 기능 개발',
          'Socket 통신을 이용한 카메라 제어 기능 개발',
          '카메라 관리 기능 개발',
        ],
        'backgroundColor': 0xFF000000,
        'textColor': 0xFFFFFFFF
      }
    ]
  },
  HSLocation.sentence.value: {
    'id': '${HSLocation.sentence.value}_id',
    'backgroundImage': 'https://image.hyounsik.info/hyounsik/hyounsik.png',
    'backgroundAccColor': 0x00000000,
    'backgroundColor': 0xFF000000,
    'backgroundColors': [0x00000000, 0xFFFFFFFF, 0xFFFFFFFF],
    'titleImage': 'https://image.hyounsik.info/sentence/sentence_t_logo.png',
    'title': 'TestValley',
    'dateString': '2013.12 ~ 2015.07',
    'subTtile': 'iOS/Mac용 앱 개발',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/sentence/frame.png',
        'title': '메일 기반 Task 관리 앱 "Frame" 개발',
        'dateString': '2015.01 ~ 2015.06',
        'jobDetails': [
          '이메일(imap) 관리 기능 개발',
          'Google email api 지원 기능 개발',
          'CouchDB를 이용한 플랫폼간 일정 동기화 기능 개발',
          'iOS/macOS 공용 백앤드 라이브러리 개발',
          '앱 런칭 및 유지 보수'
        ],
        'backgroundColor': 0xEE000000,
        'textColor': 0xFFFFFFFF
      },
      {
        'image': 'https://image.hyounsik.info/sentence/skip.png',
        'title': 'iOS용 ‘Skip’ 클립보드 공유 앱 개발',
        'dateString': '2013.12 ~ 2014.12',
        'jobDetails': [
          '멀티플랫폼(iOS,AOS,PC,MacOS)간 클립보드 공유 기능 개발',
          '- WebSocket를 이용한 실시간 동기화 기능 개발',
          'iOS/MacOS 공용 통신 모듈 개발',
          '앱 런칭 및 유지보수',
        ],
        'backgroundColor': 0xEE000000,
        'textColor': 0xFFFFFFFF
      }
    ]
  },
  HSLocation.flk.value: {
    'id': '${HSLocation.flk.value}_id',
    'backgroundImage': 'https://image.hyounsik.info/hyounsik/hyounsik.png',
    'backgroundAccColor': 0x00000000,
    'backgroundColor': 0xFF000000,
    'backgroundColors': [0xFFEC1D49, 0x44EC1D49, 0xFFFFFFFF, 0xFFFFFFFF],
    'titleImage': 'https://image.hyounsik.info/flk/flk_h_logo_2.png',
    'title': 'flk',
    'dateString': '2010.03 ~ 2013.02',
    'subTtile': 'iOS 앱 개발 및 Epub Reder 라이브러리 개발 및 운영',
    'jobs': [
      {
        'image': 'https://image.hyounsik.info/flk/epub_t_h_logo.png',
        'title': 'iOS용 Epub 리더 Library 개발',
        'dateString': '2012.01 ~ 2013.02',
        'jobDetails': [
          'iOS용 epub 리더 SDK 설계',
          '- 기존 교보 E-Book 리더에 SDK적용 지원',
          '- 교보 E-Book 앱 런칭 및 유지보수',
          'Sqlite DB 설계 및 json 타입 export/import 기능 개발',
          '- 멀티플랫폼(iOS,AOS,PC)간 사용자데이터 동기화 방식 정의',
          '- 사용자데이터(주석,메모 등) 포맷 정의',
        ],
        'backgroundColor': 0xEE000000,
        'textColor': 0xFFFFFFFF
      },
      {
        'image': 'https://image.hyounsik.info/flk/epub_reader.png',
        'title': 'iOS용 교보 Epub 리더 앱 개발',
        'dateString': '2010.08 ~ 2013.02',
        'jobDetails': [
          '서재 기능 개발',
          'e-pub 파서 개발',
          '사용자 데이터(주석,밑줄) 생성 및 관리 기능 개발',
          '멀티스크린(iPhone/iPad)지원 기능 개발(without universal)',
          '앱 런칭 및 유지 보수'
        ],
        'backgroundColor': 0xFFFFFFFF,
        'textColor': 0xFF000000
      },
      {
        'image': 'https://image.hyounsik.info/flk/aos.png',
        'title': 'AOS용 교보 Epub 리더 앱 개발',
        'dateString': '2010.03 ~ 2010.07',
        'jobDetails': ['e-pub 뷰어 파트 개발', '뷰어 성능 개선 및 UI 개발'],
        'backgroundColor': 0xEE000000,
        'textColor': 0xFFFFFFFF
      }
    ]
  },
  HSLocation.aboutMe.value: {
    'id': '${HSLocation.aboutMe.value}_id',
    'backgroundImage': 'https://image.hyounsik.info/hyounsik/hyounsik.png',
    'backgroundAccColor': 0x00000000,
    'backgroundColor': 0xFF000000,
    'backgroundColors': [0x00000000, 0xFFFFFFFF],
    'titleImage': 'https://image.hyounsik.info/hyounsik/hyounsik_logo.png',
    'title': 'Lee Hyoun Sik',
    'dateString': '2010.03 ~ 2013.02',
    'subTtile':
        '안녕하세요. 이현식 입니다.\nh.sik3768@gmail.com\nhttps://github.com/hyounsik/iam_hyounsik',
    'jobs': [
      {
        // 'image': 'https://image.hyounsik.info/h_1.png',
        'title': '관심사',
        'dateString': '',
        'jobDetails': ['Swift UI', 'Elixir', 'Flutter', 'Lego ❤️'],
        'backgroundColor': 0xAA000000,
        'textColor': 0xFFFFFFFF
      },
      {
        // 'image': 'https://image.hyounsik.info/h_1.png',
        'title': '소개',
        'dateString': '',
        'jobDetails': [
          '2010년 안드로이드 개발을 시작으로 아이폰 및 서버 개발등 여러 분야에서 다양한 경험을 쌓았습니다.',
          'Flutter를 이용하여 음성 기반 소셜 네트워크 서비스를 만들어 보자는 목표를 가지고 "Effy Live"를 바닥부터 제작하였습니다.',
          'Effy Live에서는 앱 개발과 Firebase/App engine(node)를 서버 개발 및 Neo4j/MySql/Firestore db 설계와 시스템 아키텍처 구성을 담당하였습니다.',
          '현재는 (주)비엘큐에서 Flutter를 이용하여 Momile앱을 개발 하고 있습니다.',
          '내가 아는 기술보다 요구에 맞는 기술을 찾아 적용 하는 것을 선호 합니다. 앞으로도 계속 배우는 개발자가 되고 싶습니다.',
        ],
        'backgroundColor': 0xAA000000,
        'textColor': 0xFFFFFFFF
      },
      {
        // 'image': 'https://image.hyounsik.info/h_1.png',
        'title': '나는 무엇을 해보았지?',
        'dateString': '',
        'jobDetails': [
          'Python',
          'AWS',
          'Git',
          'iOS',
          'HTML',
          'JavaScript',
          'MySQL',
          'SQL',
          'C / C++',
          'Github',
          'Flutter',
          'Swift',
          'Objective-C',
          'Java',
          'Neo4j',
          'CouchDB',
          'MongoDB',
          'Firebase',
          'GCP',
          '등등..'
        ],
        'backgroundColor': 0xAA000000,
        'textColor': 0xFFFFFFFF
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
  final Color backgroundColor;
  final List<Color> backgroundColors;
  final String title;
  final String subTtile;
  final String dateString;
  final List<DetailJobData> jobs;
  const DetailPageData(
      this.titleImage,
      this.title,
      this.subTtile,
      this.dateString,
      this.jobs,
      this.id,
      this.backgroundImage,
      this.backgroundColors,
      this.backgroundColor,
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
      data['dateString'] ?? '',
      jobs,
      data['id'] ?? 'unknown',
      data['backgroundImage'],
      colors,
      Color(data['backgroundAccColor']),
      Color(data['backgroundColor']),
    );
  }
}

class DetailJobData {
  final String? image;
  final String title;
  final String dateString;
  final List<String> jobDetails;
  final Color backgroundColor;
  final Color textColor;
  const DetailJobData(this.image, this.title, this.dateString, this.jobDetails,
      this.backgroundColor, this.textColor);

  factory DetailJobData.fromMap(Map<String, dynamic> data) {
    List<String> jobDetails = [];
    if (data['jobDetails'] != null && data['jobDetails'] is List<String>) {
      jobDetails = data['jobDetails'] as List<String>;
    }
    return DetailJobData(
        data['image'],
        data['title'] ?? 'Title',
        data['dateString'] ?? '',
        jobDetails,
        Color(data['backgroundColor']),
        Color(data['textColor']));
  }
}
