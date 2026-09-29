export const site = {
  url: 'https://iam.hyounsik.com',
  /**
   * Google Search Console 소유권 확인 코드.
   * Search Console → 속성 추가 → URL 접두어 → 'HTML 태그' 방식에서
   * <meta name="google-site-verification" content="여기값"> 의 content만 넣는다.
   * 비워 두면 meta 태그가 출력되지 않는다.
   */
  googleSiteVerification: '',
  /**
   * 검색엔진 색인 허용 여부.
   *   false — 모든 페이지에 noindex가 붙어 검색 결과에 나오지 않는다 (현재 설정)
   *   true  — 정상 색인. 켤 때는 Search Console 속성을 다시 등록하고 사이트맵을 제출한다
   * 값을 바꾼 뒤 재배포해야 실제로 반영된다.
   */
  searchIndexing: false as boolean,
  name: '이현식',
  nameEn: 'Hyoun Sik Lee',
  role: 'Flutter · iOS · Server Developer',
  location: 'Seoul, Korea',
  careerLength: '경력 15년 3개월',
  intro: [
    'iOS/Flutter 기반 앱 개발과 NodeJs와 DocumentDB, GraphDB를 이용한 백엔드 개발',
    '서비스 초기 설계 단계 부터 출시후 운영 까지 서비스 전반에 걸친 개발 경험',
    '조직의 상황에 맞는 기술 스택 선정과 마이크로 서비스 설계 및 운영',
    '서버, 클라우드, Docker를 이용하여 테스트, CI, 배포, 모니터, 비즈니스 측정등 전반적인 사용자 응용 서비스 개발-운영 경험',
  ],
  contact: {
    email: 'h.sik3768@gmail.com',
    github: 'https://github.com/hyounsik',
    medium: 'https://medium.com/@sk3767',
  },
  companies: [
    '에이디지컴퍼니',
    '더크리스피',
    '코이랩스',
    '비엘큐',
    '에피라이브',
    '리모트몬스터',
    '레인보우브레인',
    '센텐스',
    '포니링크',
  ],
  education: {
    school: '원광대학교',
    major: '컴퓨터공학과',
    period: '2003.03 - 2010.08',
    status: '졸업',
  },
  skills: [
    'Flutter',
    'Dart',
    'Swift',
    'Objective-C',
    'TypeScript',
    'JavaScript',
    'Node.js',
    'Python',
    'Java',
    'C / C++',
    'Firebase',
    'GCP',
    'AWS',
    'MySQL',
    'Neo4j',
    'MongoDB',
    'CouchDB',
    'Git',
  ],
  awards: [
    {
      title: 'Product of the Day — Product Hunt',
      url: 'https://www.producthunt.com/products/effy',
    },
  ],
  /**
   * 홈 히어로의 이미지 스택에 노출할 이미지.
   * 프로젝트 데이터와 분리해 직접 지정한다 — 대표 이미지를 자동으로 고르지 않고
   * 히어로에 어울리는 자산을 원하는 순서로 배치하기 위함.
   * 개수는 가변이며, 배열 순서대로 왼쪽부터 겹쳐 쌓인다.
   *
   * 작게 겹쳐 보이는 영역이라 화면 스크린샷은 형태가 뭉개진다.
   * 한눈에 읽히는 로고/심볼만 쓰고, 어두운 것과 밝은 것을 번갈아 배치한다.
   */
  heroImages: [
    { src: '/images/adg/soonshot_logo.png', alt: 'Soonshot 심볼' },
    { src: '/images/effy/effy_icon.png', alt: 'RemoteMonster 심볼' },
    { src: '/images/crispy/crispy_home_mainbanner.png', alt: 'Crispy Lit 홈 화면' },
    { src: '/images/rainbow/rainbow_tving_logo_square.png', alt: 'TVING 심볼' },
  ],
} as const;
