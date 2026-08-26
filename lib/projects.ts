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
  links?: { label: string; url: string }[];
};

const placeholder = (alt: string, tone = 1): Media => ({
  kind: 'image',
  src: `/placeholder/shot-${tone}.svg`,
  alt,
  placeholder: true,
});

const placeholderVideo = (alt: string): Media => ({
  kind: 'video',
  src: 'https://www.youtube.com/embed/dQw4w9WgXcQ',
  alt,
  placeholder: true,
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
    media: [placeholderVideo('드라마 리믹스 편집 화면'), placeholder('드라마 리믹스 편집 화면', 1)],
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
      '관리자용 페이지 개발 — 캐릭터 생성/수정/관리, 지표 관리',
      'LLM(Gemini)을 이용한 캐릭터 대화 백엔드(서버리스) 기능 개발',
      'Firebase를 이용하여 단기/장기 대화 메모리 관리',
    ],
    stack: ['Flutter', 'Firestore', 'Firebase Cloud Functions', 'Gemini API', 'Vertex AI'],
    media: [placeholder('AI 캐릭터챗 대화 화면', 2), placeholder('캐릭터 관리자 페이지', 3)],
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
    ],
    stack: ['Flutter', 'RxDart', 'Freezed', 'Provider', 'GetIt', 'GoRouter'],
    media: [placeholderVideo('Soonshot 앱 화면'), placeholder('Soonshot 홈 화면', 4)],
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
    media: [placeholder('AI 챗봇 클라이언트 화면', 5)],
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
    ],
    stack: ['Flutter', 'RxDart', 'Freezed', 'Provider', 'Riverpod', 'GetIt', 'GoRouter'],
    media: [placeholder('Crispy 앱 플레이어 화면', 6), placeholder('Crispy 앱 홈', 1)],
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
    media: [placeholder('KOKIRI 앱 홈 화면', 2), placeholder('KOKIRI 서버 구조도', 3)],
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
      '레거시 앱 안정화 및 UI/UX 개선 (2022.11 - 2023.04)',
    ],
    stack: ['Flutter', 'RxDart', 'Freezed', 'Provider', 'GetIt', 'melos', 'Firebase', 'GoRouter'],
    media: [placeholder('TestValley 홈 화면', 4), placeholder('TestValley 상품 상세', 5)],
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
      '40k LoC 규모의 플러터 개발. 초기 개발부터 운영·유지보수까지 담당',
      '플러터 1.17부터 3.7까지 각 버전 마이그레이션 경험',
      'active Record 스타일에서 Clean Architecture(Data Mapper) + BLoC 패턴으로 점진적 대규모 리팩토링',
      'WebRTC 라이브 방송, 오디오(speech to text) 포스트, 랜덤 매칭, Graph 기반 소셜 기능 구현',
      'Route Master로 라우팅 체계 리팩토링 및 다이나믹 링크 적용',
      'Flutter Theme 기반 밝은/어두운 테마 구현, Material 3 마이그레이션',
      'DB 설계 — 사용자 실시간 동기화 모델링, 결제 DB 모델링, Neo4j 기반 SNS 데이터 모델링',
      'Firebase 실시간 동기화로 로딩 없는 앱 구현, App Engine(nodejs)·CloudFunctions 기반 App Server, NodeJs-MySQL 결제 서버 구현',
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
    media: [placeholder('Effy Live 타임라인', 6), placeholder('Effy Live 시스템 구조도', 1)],
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
    media: [placeholder('Flutter 외주 프로젝트 화면', 2)],
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
    media: [placeholder('Waggle Quiz 앱 화면', 3), placeholder('RemoteMonster SDK 문서', 4)],
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
      "'Nursing ERP' IoT 장비 관리 — Nodejs application 서버, WebSocket 단말기 실시간 상태 관리 기능 개발",
      'Nursing ERP — MongoDB 서버 구축 및 DB 설계, CRUD 기능 개발',
      'Nursing ERP — Polymer 관리자 페이지, AngularJS 사용자 페이지 개발 및 사이트 간 연동',
      'KT 홈캠 iOS 앱 — 영상 재생·관리, 실시간 카메라 제어(REST/Socket), 카메라 관리 기능 개발',
    ],
    stack: ['Objective-C', 'ExpressJS', 'MongoDB', 'WebSocket', 'AngularJS', 'Polymer'],
    media: [placeholder('Tving 앱 화면', 5)],
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
    media: [placeholder('Frame 앱 화면', 6), placeholder('Skip 앱 화면', 1)],
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
      'Sqlite DB 설계 및 json 타입 export/import 기능 개발',
      '멀티플랫폼(iOS, AOS, PC)간 사용자데이터 동기화 방식 정의, 사용자데이터(주석·메모) 포맷 정의',
      'iOS 교보 E-Book 앱 — 서재 기능, e-pub 파서, 주석·밑줄 생성 및 관리 기능 개발',
      'iOS 교보 E-Book 앱 — 멀티스크린(iPhone/iPad) 지원 기능 개발 (without universal)',
      'Android 교보 E-Book 앱 — e-pub 뷰어 파트 개발, 뷰어 성능 개선 및 UI 개발',
    ],
    stack: ['Objective-C', 'Java', 'SQLite', 'EPub'],
    media: [placeholder('교보 E-Book 리더 화면', 2)],
  },
];

export const featuredProjects = projects.filter((project) => project.featured);
export const moreProjects = projects.filter((project) => !project.featured);

export function getProject(slug: string): Project | undefined {
  return projects.find((project) => project.slug === slug);
}
