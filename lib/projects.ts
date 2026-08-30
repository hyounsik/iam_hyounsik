export type Media = {
  kind: 'image' | 'video';
  /** 이미지 경로 또는 YouTube watch/embed URL */
  src: string;
  alt: string;
  /** 실제 자료로 교체가 필요한 더미 자산 */
  placeholder?: boolean;
};

export type Project = {
  slug: string;
  title: string;
  company: string;
  period: string;
  role: string;
  /** 홈 상단 FEATURED WORK 영역 노출 여부 */
  featured: boolean;
  accentColor: string;
  summary: string;
  highlights: string[];
  stack: string[];
  media: Media[];
  /**
   * 상세 페이지의 이미지 배치 방식.
   * 'full'(기본) — 한 장씩 가로 폭 전체로 노출
   * 'stack' — 기울어진 카드 더미로 작게 노출. 원본 해상도가 낮아 확대하면 열화되는 경우에 사용
   */
  mediaLayout?: 'full' | 'stack';
  /** mediaLayout이 'stack'일 때의 카드 크기 (기본 'md') */
  mediaStackSize?: 'sm' | 'md' | 'lg';
  links?: { label: string; url: string }[];
};

/** public/images 아래의 실제 스크린샷 */
const shot = (src: string, alt: string, needsReview = false): Media => ({
  kind: 'image',
  src: `/images/${src}`,
  alt,
  ...(needsReview ? { placeholder: true } : {}),
});

/** YouTube embed (watch URL이 아닌 /embed/ 형식이어야 iframe이 동작) */
const youtube = (id: string, alt: string): Media => ({
  kind: 'video',
  src: `https://www.youtube.com/embed/${id}`,
  alt,
});

export const projects: Project[] = [
  {
    slug: 'drama-remix',
    title: '드라마 리믹스',
    company: '에이디지컴퍼니',
    period: '2026.07 - 2026.08',
    role: '시니어 개발자',
    featured: true,
    accentColor: '#FF5A36',
    summary:
      '클라이언트에서 미리보기하고 서버에서 실제 인코딩하는 영상 리믹스 파이프라인을 설계·개발했습니다.',
    highlights: [
      '클라이언트측 영상 편집 — 클리핑, 회전, 크롭 / Text·Image 오버레이 기능 개발',
      'GCP CloudRun을 이용한 서버리스 영상 인코더 개발. 서버측 클리핑·회전·크롭 / Text·Image 오버레이 기능 개발',
      'HLS 영상 생성 및 HLS 기반 영상 플레이 기능 개발',
      '클라이언트 미리보기 → 서버측 실제 영상 편집으로 이어지는 기능 설계 및 개발',
    ],
    stack: ['Flutter', 'Firebase Cloud Functions', 'ffmpeg', 'GCP CloudRun', 'HLS'],
    media: [
      shot('crispy/crispy_preview.png', '드라마 리믹스 편집 미리보기 화면', true),
      shot('crispy/crispy_preview2.png', '리믹스 결과 재생 화면', true),
    ],
  },
  {
    slug: 'ai-character-chat',
    title: 'AI 캐릭터챗',
    company: '에이디지컴퍼니',
    period: '2026.03 - 2026.04',
    role: '시니어 개발자',
    featured: true,
    accentColor: '#7C5CFF',
    summary:
      '드라마 캐릭터를 LLM으로 살려낸 캐릭터 대화 기능을, 앱부터 서버리스 백엔드와 운영 도구까지 만들었습니다.',
    highlights: [
      '드라마 캐릭터를 활용한 AI 캐릭터챗 기능 개발',
      'Soonshot 모바일앱 캐릭터 대화 기능 개발',
      '관리자용 페이지 개발 — 캐릭터 생성/수정/관리, 지표 관리 및 지표 화면 차트 시각화',
      'LLM(Gemini)을 이용한 캐릭터 대화 백엔드(서버리스) 기능 개발',
      'Firebase를 이용하여 단기/장기 대화 메모리 관리',
    ],
    stack: ['Flutter', 'Firestore', 'Firebase Cloud Functions', 'Gemini API', 'Vertex AI'],
    // 원본이 359x780로 작아 확대하면 열화되므로 스택으로 작게 노출
    media: [
      shot('crispy/crushpop_chat_1.jpeg', 'AI 캐릭터챗 대화 화면', true),
      shot('crispy/crushpop_character.jpeg', '캐릭터 프로필 화면', true),
      shot('crispy/crushpop_chat_model.jpeg', '캐릭터 관리자 페이지', true),
    ],
    mediaLayout: 'stack',
  },
  {
    slug: 'soonshot',
    title: 'Soonshot',
    company: '에이디지컴퍼니',
    period: '2025.10 - 2026.08',
    role: '시니어 개발자',
    featured: true,
    accentColor: '#111318',
    summary:
      "숏폼 드라마 앱 'Soonshot'을 도메인 기반 설계로 다시 세우며 1.0에서 1.5로 개편했습니다.",
    highlights: [
      '1.0 버전 → 1.5 버전 개편. 도메인 기반 설계를 적용하여 신규 개발',
      '기존 기능을 유지하면서 신규 버전으로 개발 및 배포',
      'Provider, RxDart, GoRouter로 상태 관리·의존성 주입·라우팅을 체계화하고 확장 가능한 아키텍처 구축',
      'iOS·Android 동시 배포. App Store·Google Play 등록 및 심사 대응, TestFlight 기반 베타 배포와 단계적 출시 관리',
    ],
    stack: ['Flutter', 'RxDart', 'Freezed', 'Provider', 'GetIt', 'GoRouter'],
    media: [
      shot('crispy/crispy_drama.png', 'Soonshot 드라마 재생 화면', true),
      shot('crispy/crispy_home_mainbanner.png', 'Soonshot 홈 화면', true),
      shot('crispy/crispy_home_newcontent.png', 'Soonshot 신규 콘텐츠 영역', true),
    ],
  },
  {
    slug: 'ai-chatbot-client',
    title: 'AI 챗봇 서비스 클라이언트',
    company: '더크리스피',
    period: '2025.07 - 2025.08',
    role: '개발',
    featured: false,
    accentColor: '#FF7A00',
    summary:
      'Svelte 5의 룬(Runes) 반응성 시스템으로 AI 챗봇 MVP 클라이언트를 빠르게 만들었습니다.',
    highlights: [
      'Svelte 5와 Tailwind CSS를 기반으로 AI 챗봇 서비스의 MVP 클라이언트 개발',
      "Svelte 5의 새로운 반응성 시스템 '룬(Runes)'을 적용하여 간결하고 효율적인 코드로 빠른 사용자 경험 구현",
      'Tailwind CSS를 활용하여 신속하고 일관된 UI를 구축하고, 컴포넌트 기반 아키텍처 설계',
    ],
    stack: ['Svelte 5', 'Tailwind CSS'],
    // 원본이 359x780로 작아 확대하면 열화되므로 스택으로 작게 노출
    media: [
      shot('crispy/crushpop_store.jpeg', 'AI 챗봇 클라이언트 화면', true),
      shot('crispy/crushpop_profile.jpeg', '프로필 화면', true),
    ],
    mediaLayout: 'stack',
  },
  {
    slug: 'crispy-lit',
    title: 'Crispy Lit Short Drama',
    company: '더크리스피',
    period: '2025.03 - 2025.07',
    role: '개발리더',
    featured: true,
    accentColor: '#FFC300',
    summary:
      "숏폼 드라마 앱 '크리스피'의 개발을 이끌며 HLS 플레이어의 버퍼링·지연 문제를 해결했습니다.",
    highlights: [
      'RxDart를 활용해 HLS 영상 플레이어의 비동기 스트림을 관리하고 버퍼링 및 지연 문제를 해결하여 재생 성능을 최적화',
      'Provider, Riverpod, GoRouter로 상태 관리·의존성 주입·라우팅을 체계화하고 확장 가능한 아키텍처 구축',
      'Freezed를 통한 불변 객체 모델링으로 데이터 안정성을 확보하고, 지속적인 성능 개선 및 UI/UX 고도화 진행',
      '클라이언트 개발 리딩 및 코드 리뷰, 디자이너와 시안 구현 협업',
      'iOS·Android 동시 출시 및 양 스토어 등록·심사 대응',
    ],
    stack: ['Flutter', 'RxDart', 'Freezed', 'Provider', 'Riverpod', 'GetIt', 'GoRouter'],
    media: [
      shot('crispy/crispy_home_mainbanner.png', 'Crispy 앱 홈 메인 배너'),
      shot('crispy/crispy_drama.png', 'Crispy 드라마 플레이어 화면'),
      shot('crispy/crispy_home_newcontent.png', 'Crispy 신규 콘텐츠 목록'),
      shot('crispy/crispy_reward.png', 'Crispy 리워드 화면'),
      shot('crispy/crispy_profile.png', 'Crispy 프로필 화면'),
    ],
  },
  {
    slug: 'kokiri',
    title: 'KOKIRI',
    company: '코이랩스',
    period: '2023.09 - 2025.01',
    role: '개발리드',
    featured: true,
    accentColor: '#FF4A17',
    summary:
      'MBC·SM이 투자한 K-Content 한국어 교육 서비스. 앱 구조 개선부터 NestJS 서버·배포 프로세스까지 담당했습니다.',
    highlights: [
      'rxDart + provider로 상태 관리, get_it으로 전역 서비스 적용',
      'apps와 libs(core, widget, style)를 분리한 Mono-repo 구성으로 앱과 랜딩 페이지 코드 공유',
      'GA 이벤트 추적 기능 개발 및 RemoteConfig, GA4를 이용한 A/B 테스트 진행',
      'appLinks, universalLink 적용 및 신규 UI/UX 적용',
      '모바일 개발 리딩 및 코드 리뷰. 데일리 스크럼·스프린트 단위 개발 프로세스 도입',
      'iOS·Android 동시 배포 및 양 스토어 등록·심사 대응',
      'Flutter 웹 개발 — 앱과 widget·style을 공유하는 flutter web 구성 (2024.02 - 2024.03)',
      'NestJS 서버 유지보수 — 단어책 관련 API(Rest/GraphQL) 추가 및 DB 수정',
      '서버 monorepo 구성, core/app 코드 분리로 유지보수 비용 절감',
      'service server, admin server, cms, notification server 배포 프로세스 개선',
    ],
    stack: [
      'Flutter',
      'RxDart',
      'Provider',
      'GetIt',
      'melos',
      'Firebase',
      'GoRouter',
      'NestJS',
      'Prisma',
      'GraphQL',
      'MySQL',
    ],
    media: [
      youtube('nl0sN3i6weU', 'KOKIRI 앱 소개 영상'),
      shot('kokiri/kokiri_home.png', 'KOKIRI 앱 홈 화면'),
      shot('kokiri/kokiri_news.png', 'KOKIRI 뉴스 화면'),
      shot('kokiri/kokiri_player_b.png', 'KOKIRI 영상 플레이어 화면'),
      shot('kokiri/kokiri_app_store.png', 'KOKIRI App Store 등록 페이지'),
    ],
    links: [{ label: '앱 소개 영상', url: 'https://youtu.be/nl0sN3i6weU' }],
  },
  {
    slug: 'testvalley',
    title: 'TestValley',
    company: '비엘큐',
    period: '2022.11 - 2023.09',
    role: 'Flutter 앱 개발',
    featured: true,
    accentColor: '#19BEE2',
    summary:
      '전자제품 버티컬 커머스 앱의 V2 아키텍처를 설계하고, 레거시 앱 운영과 병행하며 성공적으로 런칭했습니다.',
    highlights: [
      'V1 → V2 개발 계획 수립 및 아키텍처 설계·개발',
      'Flutter Theme를 이용한 스타일 관리 체계 적용',
      'core/widget/style/app 패키지 분리 및 melos를 이용한 monorepo 구현',
      'widgetBook을 이용해 디자이너와 소통하며 위젯 개발',
      '홈 화면 전면 개편, 앱 유저플로우 개선, 웹뷰 → 플러터 교체',
      '메모리 등 퍼포먼스 최적화, iOS/AOS 앱 배포 및 운영',
      '주문·결제 플로우 구현, PG 연동 및 인앱결제 처리, 결제 실패·취소 예외 흐름 대응',
      'Flutter 앱 개발 파트 리딩 — 코드 리뷰, PO·서버(5명)·디자인과의 협업 조율',
      'App Store·Google Play 등록 및 심사 대응, TestFlight 베타 배포 운영',
      '레거시 앱 안정화 및 UI/UX 개선 (2022.11 - 2023.04)',
    ],
    stack: ['Flutter', 'RxDart', 'Freezed', 'Provider', 'GetIt', 'melos', 'Firebase', 'GoRouter'],
    media: [
      shot('testValley/testValley_home.PNG', 'TestValley 홈 화면'),
      shot('testValley/testValley_product_detail.PNG', 'TestValley 상품 상세 화면'),
      shot('testValley/testValley_category.PNG', 'TestValley 카테고리 화면'),
      shot('testValley/testValley_quicksell.PNG', 'TestValley 중고판매(퀵셀) 화면'),
      shot('testValley/testValley_search.PNG', 'TestValley 검색 화면'),
    ],
  },
  {
    slug: 'effy-live',
    title: 'Effy Live',
    company: '에피라이브',
    period: '2019.08 - 2022.11',
    role: '개발총괄리드',
    featured: true,
    accentColor: '#FA7D7A',
    summary:
      '창업 멤버로 참여해 음성 기반 소셜 서비스를 바닥부터 만들고 4년간 운영했습니다. 클라이언트 70%, 서버 70%를 기여했습니다.',
    highlights: [
      '40k LoC 규모의 플러터 개발. 개발 전담 인력 1명 조건에서 앱·서버·DB 전체를 초기 개발부터 운영·유지보수까지 담당',
      '플러터 1.9 초기부터 3.3까지 각 버전 마이그레이션 경험 (2.0 null safety 전환, 3.0 Material 3 대응 포함)',
      'active Record 스타일에서 Clean Architecture(Data Mapper) + BLoC 패턴으로 점진적 대규모 리팩토링',
      'WebRTC 라이브 방송, 오디오(speech to text) 포스트, 랜덤 매칭, Graph 기반 소셜 기능 구현',
      'Route Master로 라우팅 체계 리팩토링 및 다이나믹 링크 적용',
      'Flutter Theme 기반 밝은/어두운 테마 구현, Material 3 마이그레이션',
      'DB 설계 — 사용자 실시간 동기화 모델링, 결제 DB 모델링, Neo4j 기반 SNS 데이터 모델링',
      'Firebase 실시간 동기화로 로딩 없는 앱 구현, App Engine(nodejs)·CloudFunctions 기반 App Server, NodeJs-MySQL 결제 서버 구현',
      'PayPal 결제 연동 및 인앱결제(iOS/Android) 영수증 검증 처리',
      '포인트 환전 기능 개발 — 적립 포인트의 환전 요청·승인·지급 흐름 구현',
      '결제 전용 서버와 MySQL DB를 서비스 계층(Firebase)과 분리해 구성',
      '웹 유입 사용자를 위한 간소화(라이트) 앱 버전 개발',
      'iOS·Android 동시 출시 및 양 스토어 등록·심사 대응',
      'Product Hunt Product of the Day 선정, 사용자 10만 명 이상 확보',
    ],
    stack: [
      'Flutter',
      'RxDart',
      'built_value',
      'Provider',
      'GetIt',
      'Firebase',
      'route_master',
      'Node.js',
      'Neo4j',
      'MySQL',
      'WebRTC',
    ],
    media: [
      youtube('fvDae0-39jE', 'Effy Live 앱 소개 영상'),
      shot('effy/effy_shortform_feed.PNG', 'Effy Live 숏폼 피드'),
      shot('effy/effy_live_broadcast_group.PNG', 'Effy Live 라이브 방송 화면'),
      shot('effy/effy_random_match.PNG', 'Effy Live 랜덤 매칭 화면'),
      shot('effy/effy_create_page.PNG', 'Effy Live 음성 포스트 작성 화면'),
      shot('effy/effy_google_play_store.png', 'Effy Live Google Play 등록 페이지'),
    ],
    links: [
      { label: '앱 소개 영상', url: 'https://youtu.be/fvDae0-39jE' },
      { label: 'Product Hunt', url: 'https://www.producthunt.com/products/effy' },
    ],
  },
  {
    slug: 'outsourcing-flutter',
    title: 'Flutter 외주 프로젝트',
    company: '에피라이브',
    period: '2019 - 2022',
    role: 'Flutter 클라이언트/서버 개발',
    featured: false,
    accentColor: '#6B7280',
    summary:
      '모임·심부름·인력관리·STT PoC 등 다양한 도메인의 Flutter 외주 프로젝트를 맡아 클라이언트와 서버를 만들었습니다.',
    highlights: [
      '비마이 — 모임/만남 앱. 클라이언트/서버 개발, RestAPI 캐시 도입, 백그라운드·로컬 노티피케이션, 사용자 매칭 시스템 개발',
      '부탁해요 — 심부름 앱(러너스컴퍼니). 카카오 맵 웹뷰 통합 및 dart 바인딩, Toss 결제 REST API 자체 구현, chopper 기반 자동 코드 생성',
      '부탁해요 — RudderStack ETL로 GA4·Apps Flyer·Amplitude 데이터 스트림 파이프 구현, Widget Book으로 디자인 시스템 구현',
      'Speech to Text PoC(브레인소프트) — GCP·AWS·IBM·브레인소프트 STT Native SDK/Rest API를 Flutter Method Channel로 통합',
      '핀덴아이 교사앱 — 인력관리 앱 클라이언트 개발 및 RestAPI 연동',
      '발할라 액션 — 클럽 모임/만남 앱 클라이언트 개발 및 RestAPI 연동',
    ],
    stack: ['Flutter', 'RxDart', 'Freezed', 'Provider', 'GetIt', 'chopper', 'Widget Book', 'Firebase'],
    media: [
      shot('effy/effy_search.PNG', 'Flutter 외주 프로젝트 화면', true),
      shot('effy/effy_inbox.PNG', '알림/인박스 화면', true),
    ],
  },
  {
    slug: 'remote-monster',
    title: 'Waggle & RemoteMonster SDK',
    company: '리모트몬스터',
    period: '2017.08 - 2019.05',
    role: '풀스택 개발',
    featured: true,
    accentColor: '#FF921D',
    summary:
      'WebRTC iOS SDK를 만들어 배포하고, 그 SDK로 1000명 이상이 동시에 참여하는 라이브 퀴즈쇼 서비스를 개발했습니다.',
    highlights: [
      'iOS용 WebRTC 라이브러리 개발 및 cocoapods 배포. 개발자가 이해하기 쉬운 API 설계 및 유지보수',
      '개발자를 위한 SDK 레퍼런스 문서 및 가이드 작성',
      'Waggle Quiz — WebRTC 실시간 방송 및 퀴즈 진행, 1000+ 동시 참여 라이브 방송 기능 개발',
      'Waggle Quiz — rx-swift로 Firebase Realtime DB 동기화 모듈 개발, CloudFunction(express)·FirebaseDB 백엔드 개발',
      'Waggle — WebRTC 라이브 방송, swift concurrency async/await 적용, UIKit UI 개발',
      'Waggle 서버 — 서비스 아키텍처 설계, nodeJs(expressjs) & cloud functions 서버 개발, swagger 환경 구현',
      'DB — neo4j 기반 소셜 네트워크 기능, firebase trigger로 firebaseDB ↔ neo4j 커넥터 설계 및 개발',
    ],
    stack: ['Swift', 'UIKit', 'RxSwift', 'WebRTC', 'SocketIO', 'Node.js', 'Express', 'Firebase', 'Neo4j'],
    media: [
      youtube('e_SQb7TKld8', 'Waggle Quiz 라이브 퀴즈쇼 영상'),
      shot('remon/remon_waggle_quiz_home.jpg', 'Waggle Quiz 홈 화면'),
      shot('remon/remon_waggle_quiz_winner.jpg', 'Waggle Quiz 우승자 화면'),
      shot('remon/remon_waggle_quiz_design.jpg', 'Waggle Quiz 디자인 시안'),
      shot('remon/remon_neo4j_data.jpeg', 'Neo4j 기반 소셜 그래프 데이터 구조'),
    ],
    links: [
      { label: 'Waggle Quiz 영상', url: 'https://youtu.be/e_SQb7TKld8' },
      { label: 'CocoaPods', url: 'https://cocoapods.org/pods/RemoteMonster' },
      { label: 'SDK 문서', url: 'https://docs.remotemonster.com' },
    ],
  },
  {
    slug: 'rainbow-brain',
    title: 'Tving & Nursing ERP',
    company: '레인보우브레인',
    period: '2015.09 - 2017.05',
    role: '앱 개발',
    featured: false,
    accentColor: '#1DFFFF',
    summary:
      'Tving iOS 앱 5.0 개편에 참여하고, IoT 장비 관리 서비스의 서버와 웹 클라이언트를 개발했습니다.',
    highlights: [
      "'Tving' iOS 앱 4.x → 5.0 개편 참여 — UI 코드 모듈화로 재활용성 강화, 메인·카테고리·컨텐츠 상세 페이지 개발",
      'Tving — websocket을 이용한 실시간 채팅 기능 개발',
      'Tving — 영상 보안(DRM) 모듈을 플레이어에 연동. 라이선스 획득·복호화 재생 흐름 구현 및 예외 처리',
      "'Nursing ERP' IoT 장비 관리 — Nodejs application 서버, WebSocket 단말기 실시간 상태 관리 기능 개발",
      'Nursing ERP — MongoDB 서버 구축 및 DB 설계, CRUD 기능 개발',
      'Nursing ERP — Polymer 관리자 페이지, AngularJS 사용자 페이지 개발 및 사이트 간 연동',
      'KT 홈캠 iOS 앱 — 영상 재생·관리, 실시간 카메라 제어(REST/Socket), 카메라 관리 기능 개발',
    ],
    stack: ['Objective-C', 'ExpressJS', 'MongoDB', 'WebSocket', 'AngularJS', 'Polymer'],
    media: [
      shot('rainbow/rainbow_history_item5.png', 'Tving iOS 앱 화면'),
      shot('rainbow/rainbow_tving_logo.webp', 'Tving 로고'),
    ],
  },
  {
    slug: 'sentence-lab',
    title: 'Frame & Skip',
    company: '센텐스',
    period: '2013.12 - 2015.07',
    role: '앱 개발',
    featured: false,
    accentColor: '#6B7280',
    summary:
      '메일 기반 Task 관리 앱과 멀티플랫폼 클립보드 공유 앱을 iOS·macOS 공용 구조로 개발했습니다.',
    highlights: [
      "'Frame' — 이메일(imap) 관리 기능, Google email api 지원 기능 개발",
      'Frame — CouchDB를 이용한 플랫폼간 일정 동기화 기능, iOS/macOS 공용 백엔드 라이브러리 개발',
      "'Skip' — 멀티플랫폼(iOS, AOS, PC, macOS)간 클립보드 공유 기능 개발",
      'Skip — WebSocket을 이용한 실시간 동기화, 이미지 동기화 기능 개발',
      'Skip — iOS/macOS 공용 통신 모듈 개발, 앱 런칭 및 유지보수',
    ],
    stack: ['Objective-C', 'CocoaTouch', 'CouchDB', 'WebSocket'],
    media: [shot('sentence/sentence_frame_app_screenshot.png', 'Frame 앱 화면')],
  },
  {
    slug: 'feelink-epub',
    title: 'EPub 리더 SDK',
    company: '포니링크',
    period: '2010.03 - 2013.02',
    role: 'iOS 앱 개발',
    featured: false,
    accentColor: '#EC1D49',
    summary:
      '교보 E-Book 앱을 iOS·Android로 개발하고, 이를 iOS용 EPub 리더 SDK로 재구성해 배포했습니다.',
    highlights: [
      'iOS용 epub 리더 SDK 설계 및 기존 교보 E-Book 리더에 SDK 적용 지원',
      '컨텐츠 보안(DRM) 모듈 연동 — 암호화된 유료 도서의 복호화·렌더링 파이프라인 구성 및 단말 인증 처리',
      '복호화 키와 사용자 데이터의 단말 내 저장 방식 정의',
      'Sqlite DB 설계 및 json 타입 export/import 기능 개발',
      '멀티플랫폼(iOS, AOS, PC)간 사용자데이터 동기화 방식 정의, 사용자데이터(주석·메모) 포맷 정의',
      'iOS 교보 E-Book 앱 — 서재 기능, e-pub 파서, 주석·밑줄 생성 및 관리 기능 개발',
      'iOS 교보 E-Book 앱 — 멀티스크린(iPhone/iPad) 지원 기능 개발 (without universal)',
      'Android 교보 E-Book 앱 — e-pub 뷰어 파트 개발, 뷰어 성능 개선 및 UI 개발',
    ],
    stack: ['Objective-C', 'Java', 'SQLite', 'EPub'],
    media: [shot('flk/epub_reader.png', '교보 E-Book 리더 화면')],
  },
];

export const featuredProjects = projects.filter((project) => project.featured);
export const moreProjects = projects.filter((project) => !project.featured);

export function getProject(slug: string): Project | undefined {
  return projects.find((project) => project.slug === slug);
}
