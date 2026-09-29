# 이현식

+821091812134 · h.sik3768@gmail.com

- [jd] 2010년부터 모바일 앱 개발 16년. Flutter 1.9 초기(2019)부터 7년간 크로스플랫폼 상용 앱 개발
- [jd] iOS·Android 동시 출시 이력 — 'effy live', TestValley, KOKIRI, Crispy Lit, Soonshot 등 상용 앱을 양 스토어 동시 런칭. App Store·Google Play 등록·심사 대응 및 리젝 사유 조치, TestFlight 기반 오픈베타 운영
- [jd] 앱 아키텍처와 상태관리·네비게이션 구조 설계 — 'effy live'부터 Soonshot까지 Flutter 상용 앱의 아키텍처를 직접 설계·전면 리팩토링 (Clean Architecture, 도메인 기반 설계, BLoC, RxDart·Provider·Riverpod, GoRouter·RouteMaster)
- [jd] 결제·정산 도메인 개발 — PayPal 결제 연동 및 포인트 환전, 인앱결제, Toss 결제 REST 자체 구현, 이커머스 결제 기능 개발. 결제 서버와 DB를 서비스 계층과 분리해 민감 데이터 취급 경로를 격리
- [jd] 네이티브 보안·미디어 모듈 통합 — 영상 DRM(Tving), EPub DRM(교보 E-Book) 모듈 연동, Method Channel을 통한 Swift·Objective-C 네이티브 모듈 브리지 작성
- [jd] 웹 서비스의 모바일 앱 전환 경험 — Mono-repo로 앱–웹(랜딩) 코드 공유 구조 설계, Flutter Web 전환, 웹 유입용 간소화(라이트) 앱 버전 개발
- [jd] 프론트 개발 리딩 및 코드 리뷰, WidgetBook 기반 디자이너 시안 구현 협업. 창업 멤버·개발총괄로서 린스타트업·애자일(데일리 스크럼, 스프린트) 환경에서 플랫폼 개발 수행
- [jd] TypeScript 기반 개발 (NestJS 서버, Svelte 5 클라이언트, Prisma·GraphQL)
- [jd] 영상 플레이어·대용량 리스트의 렌더링 성능 최적화(버퍼링·지연·메모리) 및 앱 안정화 경험
- 서비스 초기 설계 단계 부터 출시후 운영 까지 서비스 전반에 걸친 개발 경험
- 서버, 클라우드, Docker를 이용하여 테스트, CI, 배포, 모니터, 비즈니스 측정등 전반적인 사용자 응용 서비스 개발-운영 경험

## 경력 (16년 5개월) <!-- [jd] 15년 3개월 → 2026.08 기준으로 갱신 -->

### 주식회사 에이디지컴퍼니
**2025.10 - 재직중 (11개월)** · 정규직 · 모바일앱 개발 · 시니어 개발자

**드라마 리믹스 기능 개발** (2026.07 - 2026.08, 영상 리믹스 기능 개발, 시니어 개발자)
- 사용 기술: Firebase Cloud functions, ffmpeg, flutter
- 클라이언트측 영상 편집 클리핑, 회전, 크롭 / Text, Image 오버레이 기능 개발
- GCP CloudRun을 이용한 서버리스 영상 인코더 개발. 서버측 클리핑, 회전, 크롭/Text, Image 오버레이 기능 개발
- HLS 영상 생성. HLS 기반 영상 플레이 기능 개발
- 클라이언트 측 영상 편집 미리보기 -> 서버측 실제 영상 편집 기능 설계 및 개발

**AI 캐릭터챗 기능 개발** (2026.03 - 2026.04, 캐릭터챗 기능 개발, 시니어 개발자)
- 사용 기술: Firestore, Firebase Cloud functions, Gemini Api, vertex-Ai Api, flutter
- 드라마 캐릭터를 활용한 Ai 캐릭터챗 기능 개발
- Soonshot 모바일앱 캐릭터 대화 기능 개발
- 관리자용 페이지 개발. 캐릭터 생성/수정/관리, 지표관리
- [jd] 관리자 지표 화면의 차트 시각화 구현
- LLM(Gemini)을 이용한 캐릭터 대화 백엔드(서버리스) 기능 개발
- Firebase를 이용하여 단기/장기 대화 메모리 관리

**Soonshot - ShortForm 드라마앱 개발** (2025.10 - 2026.08, 플러터 앱 개발, 시니어 개발자)
숏폼 드라마 'Soonshot' 앱의 리뉴얼
- 사용 기술: Flutter, RxDart, Freezed, Provider, GetIt, GoRouter
- 1.0 버전 -> 1.5 버전으로 개편. 도메인 기반 설계를 적용하여 신규 개발
- 기존 기능을 유지하면서 신규 버전으로 개발 및 배포
- Provider, RxDart, GoRouter 등을 적용하여 상태 관리, 의존성 주입, 라우팅을 체계화하고 확장 가능한 아키텍처를 구축
- [jd] iOS·Android 동시 배포. App Store·Google Play 등록 및 심사 대응, 리젝 사유 조치
- [jd] TestFlight를 이용한 사내·베타 배포 경로 운영 및 단계적 출시(단계별 롤아웃) 관리

### 주식회사 더크리스피
**2025.03 - 2025.10 (8개월)** · 정규직 · 클라이언트 개발 · 개발리드

**AI 챗봇 서비스 클라이언트 개발** (2025.07 - 2025.08, 개발)
- 사용 기술: Svelte 5, Tailwind CSS
- Svelte 5와 Tailwind CSS를 기반으로 AI 챗봇 서비스의 MVP 클라이언트 개발 진행
- Svelte 5의 새로운 반응성 시스템 '룬(Runes)'을 적용하여 간결하고 효율적인 코드로 빠른 사용자 경험 구현
- Tailwind CSS를 활용하여 신속하고 일관된 UI를 구축하고, 컴포넌트 기반 아키텍처 설계

**Crispy Lit Short Drama (숏폼 드라마 앱) 클라이언트 개발** (2025.03 - 2025.07, 앱개발, 개발리더)
숏폼 드라마 '크리스피' 앱의 개발 담당
- 사용 기술: Flutter, RxDart, Freezed, Provider, GetIt, GoRouter, Riverpod
- RxDart를 활용해 HLS 영상 플레이어의 비동기 스트림을 관리하고 버퍼링 및 지연 문제를 해결하여 재생 성능을 최적화
- Provider, Riverpod, GoRouter 등을 적용하여 상태 관리, 의존성 주입, 라우팅을 체계화하고 확장 가능한 아키텍처를 구축
- Freezed를 통한 불변 객체 모델링으로 데이터 안정성을 확보하고, 지속적인 성능 개선 및 UI/UX 고도화 진행
- [jd] 클라이언트 개발 리딩 및 코드 리뷰 수행, 디자이너와 시안 구현 협업
- [jd] iOS·Android 동시 출시. 양 스토어 등록·심사 대응 및 배포 관리

### 코이랩스 주식회사
**2023.09 - 2025.01 (1년 5개월)** · 정규직 · 모바일앱 개발 · 개발리드

**Flutter 앱 개발 및 운영**
팀구성: Flutter 2명, 기획/디자인 1명, 서버 1명 · 사용기술: rx-dart, provider, firebase, go_router, melos

플러터 앱 개발 및 유지보수
- rxDart + provider 이용하여 상태 관리
- get_it를 이용하여 전역 서비스 적용
- 앱 구조 개선. Mono-repo 구성으로 앱과 랜딩 페이지 코드 공유 구성
- apps와 libs(core, widget, style) 분리 및 Mono-repo 구성으로 앱과 랜딩 페이지 코드 공유 구성
- GA 이벤트 추적 기능 개발 및 RemoteConfig, GA4를 이용한 A/B 테스트를 진행
- appLinks, universalLink 적용
- 신규 UI/UX 적용
- [jd] 모바일 개발 리딩 및 코드 리뷰. 데일리 스크럼·스프린트 단위 개발 프로세스를 도입하여 기획·디자인·서버와의 협업 주기를 정리
- [jd] iOS·Android 동시 배포 및 양 스토어 등록·심사 대응
- https://youtu.be/nl0sN3i6weU

**Flutter 웹 개발** (2024.02 - 2024.03)
- 플러터 앱과 widget과 style를 공유하는 flutter web 개발

**서버 유지 보수 (NestJS)**
사용기술: typescript, prisma, graphql, swagger, mysql, nestjs

nestJS 서버 유지보수
- 단어책 관련 API(Rest/GraphQL) 추가 및 DB 수정

서버 구조 변경 및 배포 환경 개선
- monorepo 환경 구성
- core/app 으로 코드를 분리하여 유지보수 비용 절감
- service server, admin server, cms, notification server 배포 프로세스 개선

### 주식회사비엘큐
**2022.11 - 2023.09 (11개월)** · 정규직

**TestValley App(이커머스) V2앱 개발 및 런칭** (2022.11 - 2023.09)
팀구성: Flutter 2명, 기획/디자인 1명, PO 1명, 서버 개발 5명 · 사용기술: rx-dart, freezed, provider, get_it, firebase, go_router

V2 앱 아키텍쳐 설계 및 개발
- V1 -> V2 개발 계획 수립 및 개발
- Flutter Theme를 이용한 스타일 관리 체계 적용
- core/widget/style/app 패키지를 분리. melos를 이용한 monorepo 구현
- widgetBook를 이용하여 디자이너와 소통하며 위젯 개발
- 앱 안정화 및 성능 개선
- [jd] 이커머스 결제 기능 개발 — 주문·결제 플로우 구현, PG 연동 및 인앱결제 처리, 결제 실패·취소 예외 흐름 대응
- [jd] Flutter 앱 개발 리딩 — 앱 개발 파트를 리딩하며 V1→V2 전환 계획 수립, 코드 리뷰, PO·서버(5명)·디자인과의 협업 조율
- iOS/AOS 앱 배포 및 운영
- [jd] iOS·Android 동시 출시. App Store·Google Play 등록 및 심사 대응, 리젝 사유 조치, TestFlight 베타 배포 운영

**TestValley App(이커머스) Legacy 앱 운영 및 개선** (2022.11 - 2023.04)
- 앱 안정화 및 성능 개선
- UI/UX 개선

### 에피라이브주식회사
**2019.08 - 2022.11 (3년 4개월)** · 정규직 · 개발총괄 · 개발총괄리드

**초기 시스템 구축 및 프로토타입 제작** (2019.05 - 2019.07)
- 시스템 설계
- 기술 스택 정의
- flutter 프로토 타입 개발

**'effy live' 음성 기반 소셜 서비스 개발** (2019.07 - 2022.10)
사용기술: rx-dart, built_value, provider, get_it, firebase, route_master, nodejs
40k LoC 규모의 플러터 개발. 클라이언트의 70%, 서버의 70% 기여. 초기개발부터 운영/유지보수
[jd] Flutter 1.9 초기부터 기능 개발 시작. 3.3까지 각 버전으로 마이그레이션 경험 (1.x → 2.0 null safety 전환, 3.0 Material 3 대응 포함)
[jd] 개발 전담 인력이 1명(본인)인 조건에서 시스템 설계·기술 스택 선정부터 앱·서버·DB 전체 개발과 운영까지 단독 담당. 개발총괄로서 기술 의사결정 주도
[jd] 린스타트업 방식으로 프로토타입 → MVP → 정식 출시 단계를 거치며 플랫폼을 구축

Flutter 앱 개발
- active Record 스타일에서 Clean Architecture(Data Mapper) + BloC 패턴으로 점진적 대규모 리팩토링
- 라이브 방송 기능 구현(webRtc)
- 오디오(speech to text) 포스트 기능 구현
- 랜덤 매칭 시스템 구현
- 소셜 기능 구현(Graph 기반)
- 기본 네비게이션에서 Route Master로 라우팅 체계 리팩토링 및 다이나믹 링크 적용
- Flutter Theme 체계에 기반한 밝은/어두운 테마 구현. Material 3 적용 마이그레이션
- Model, Style 라이브러리 분리 및 Mono-repo 구성으로 앱과 랜딩 페이지 코드 공유 구성
- [jd] 웹 유입 사용자를 위한 간소화(라이트) 앱 버전 개발 — 웹의 핵심 플로우만 추린 경량 앱을 별도 구성하여 웹→앱 전환 경로 확보
- [jd] iOS·Android 동시 출시 및 양 스토어 등록·심사 대응. 음성/라이브 방송 기능에 대한 심사 리젝 사유 조치 및 재심사 대응
- https://youtu.be/fvDae0-39jE

[jd] 결제·정산 기능 개발
- [jd] PayPal 결제 연동 — 해외 사용자 대상 결제 플로우 구현
- [jd] 인앱결제(iOS/Android) 연동 및 영수증 검증 처리
- [jd] 포인트 환전 기능 개발 — 사용자 적립 포인트의 현금 환전 요청·승인·지급 흐름 구현
- [jd] 결제 데이터 관리 — MySQL 기반 결제 전용 서버와 DB를 서비스 계층(Firebase/Firestore)과 분리하여, 금전 거래 데이터의 정합성 확보 및 취급 경로 격리

DB 설계(Firebase, MySql, Neo4j)
- 사용자 실시간 동기화 데이터 모델링
- 결제 DB 데이터 모델링
- Neo4j를 이용한 SNS 데이터 모델링

Firebase/App engine/AWS/GCP을 이용한 서버 구축
- 파이어베이스 실시간 동기화 기능을 이용한 Low 로딩 앱 개발
- neo4j 기반 소셜 네트워크 시스템 구현
- App engine(nodejs)를 이용한 App Server 구현
- CloudFunctions를 이용한 App server 구현
- NodeJs - MySql을 이용한 결제 서버 구현

**비마이 - 모임/만남 앱 (Outsourcing, Flutter)**
- 사용기술: rx-dart, built_value, provider, go_router, firebase
- 클라이언트/서버 개발. 초기개발부터 운영/유지보수
- 매끄러운 사용자 경험을 위한 RestAPI 캐시 도입
- 백그라운드 노티피케이션 및 로컬 노티피케이션 구현
- 사용자 매칭 시스템 개발

**부탁해요 - 심부름 앱 (러너스컴퍼니 Outsourcing, Flutter)**
- 사용기술: rx-dart, freezed, provider, get_it, widget book, chopper
- 플러터 클라이언트 개발
- 카카오 맵 웹뷰 통합 및 dart와 바인딩
- Toss 결제 구현. 별도의 flutter sdk가 없어서 REST API에 대해 자체적인 구현
- Swagger Open API 스펙의 서버 RestAPI를 chopper를 통한 자동화된 코드 생성
- 다량의 사용자 입력 폼 및 폼 인터랙션, 검증 구현
- RudderStack ETL을 사용해서 GA4, Apps Flyer, Amplitude의 데이터 스트림 파이프 구현
- Widget Book을 활용하여 디자인 시스템 구현 및 디자이너와 의사소통 체계 제공

**Speech to Text Performance Test PoC App (브레인소프트 Outsourcing, Flutter)**
- 사용기술: rx-dart, provider, method channel, firebase
- 플러터 클라이언트의 개발
- GCP, AWS, IBM, 브레인소프트의 STT Native SDK/Rest API를 Flutter Method Channel로 통합

**핀덴아이 교사앱 - 인력관리 앱 (Outsourcing, Flutter)**
- 사용기술: rx-dart, freezed, provider
- 플러터 클라이언트 개발
- RestAPI 연동

**발할라 액션 - 클럽 모임/만남 앱 (Outsourcing, Flutter)**
- 사용기술: rx-dart, freezed, provider
- 플러터 클라이언트 개발
- RestAPI 연동

### 주식회사리모트몬스터
**2017.08 - 2019.05 (1년 10개월)** · 정규직 · 풀스택개발

**Waggle Quiz** (2018.12 - 2019.04)
Waggle Quiz 서버 개발
- nodeJs & cloud functions

Waggle Quiz iOS 앱 개발
- webRtc 실시간 방송 및 퀴즈 진행
- swift uikit를 이용하여 UI 개발
- rx-swift 이용하여 firebase realtime DB 동기화 모듈 개발
- 1000+ 이상의 사용자가 동시 참여 가능한 라이브 방송 기능 개발
- naive App - CloudFunction - FirebaseDB를 이용한 서비스 설계
- CloudFunction(express), FirebaseDB 백엔드 개발
- https://youtu.be/e_SQb7TKld8

**Waggle 서비스 개발** (2017.10 - 2018.11)
팀구성: iOS/서버 1명, Android 1명, 디자인/기획 2명

Waggle iOS 앱 개발
- webRtc를 이용한 라이브 방송 기능 개발
- swift concurrency async/await 적용
- swift uikit를 이용하여 UI 개발
- swift url loading system을 이용하여 rest api 연결
- firebase cloud functions call api 연결
- rx-swift 이용하여 firebase realtime DB 동기화 모듈 개발

Waggle 서버 개발
- 서비스 아키텍처 설계
- nodeJs(expressjs) & cloud functions/firebase 서버 개발
- swagger 환경 구현

DB 개발
- neo4j를 이용한 소셜 네트워크 기능 개발
- firebase trigger를 이용한 firebaseDB와 neo4j 간 커넥터 설계 및 개발

**iOS용 WebRtc 라이브러리 개발** (2017.10 - 2019.05)
- cocoapods에 SDK 개발 및 배포
- 개발자 대상의 제품으로 개발자가 이해하기 쉽고 사용하기 좋은 API를 설계 및 유지 보수
- 개발자를 위한 SDK 레퍼런스 문서 및 가이드 작성
- https://docs.remotemonster.com
- https://cocoapods.org/pods/RemoteMonster

### 주식회사 레인보우브레인
**2015.09 - 2017.05 (1년 9개월)** · 정규직 · 앱개발

**'Tving' iOS 앱 개발 (Outsourcing, iOS/Objective-C)** (2016.10 - 2017.05)
iOS용 Tving 앱 4.x -> 5.0 개편 작업 참여
- UI코드를 모듈화하여 코드 재활용성 강화
- 메인 페이지 UI 및 기능 개발
- 공통 UI 모듈 개발
- 카테고리 상세 페이지 개발
- 컨텐츠 상세 페이지 개발
- websocket를 이용하여 실시간 채팅 기능 개발
- [jd] 영상 보안(DRM) 모듈 연동 — 유료 컨텐츠 재생을 위한 DRM 모듈을 플레이어에 통합. 라이선스 획득·복호화 재생 흐름 연동 및 예외 처리

**'Nursing ERP' IoT 장비 관리 서비스 개발** (2016.01 - 2016.09)
사용기술: expressJs, MongoDB, webSocket, AngularJs, Polymer

Nodejs를 이용한 application 서버 개발
- WebSocket 이용한 단말기 실시간 상태 관리 기능 개발
- MongoDB 서버 구축 및 DB 설계, CRUD 기능 개발

Polymer를 이용한 웹 클라이언트 개발(관리자 페이지)
Angularjs를 이용한 웹 클라이언트 개발(사용자 페이지)
- 환자 관리 사이트 개편 및 유지보수
- 환자 관리 사이트 – 장비관리 사이트 간 연동 기능 개발

**KT 홈캠 iOS 앱 개발 (Outsourcing, iOS/Objective-C)** (2015.09 - 2015.12)
iOS 앱 개발
- 영상 재생 및 관리 기능 개발
- 실시간 카메라 제어(REST) 기능 개발
- Socket 통신을 이용한 카메라 제어 기능 개발
- 카메라 관리 기능 개발

### 주식회사센텐스
**2013.12 - 2015.07 (1년 8개월)** · 정규직 · 앱개발

**메일 기반 Task 관리 앱 'Frame' 개발** (2015.01 - 2015.06)
팀구성: iOS/Mac 1명, android 1명, 윈도우 1명, 서버 1명, 디자인/기획 2명

iOS/macOS 앱 개발
- 이메일(imap) 관리 기능 개발
- Google email api 지원 기능 개발
- CouchDB를 이용한 플랫폼간 일정 동기화 기능 개발
- iOS/macOS 공용 백엔드 라이브러리 개발
- 앱 런칭 및 유지 보수

**iOS용 'Skip' 클립보드 공유 앱 개발** (2013.12 - 2014.12)
멀티플랫폼(iOS,AOS,PC,MacOS)간 클립보드 공유 기능 개발
- WebSocket를 이용한 실시간 동기화 기능 개발
- 이미지 동기화 기능 개발
UI 수정 및 기능 개선
iOS/MacOS 공용 통신 모듈 개발
앱 런칭 및 유지보수

### 주식회사 포니링크
**2010.03 - 2013.02 (3년)** · 정규직 · iOS 앱개발 · 사원

**iOS용 EPub 리더 SDK 개발 및 E-Book 앱 2.0 개발** (2011.04 - 2013.02, 앱개발, 사원)
iOS용 epub 리더 SDK 설계
- 기존 교보 E-Book 리더에 SDK 적용 지원
- 교보 E-Book 앱 런칭 및 유지보수
- [jd] 컨텐츠 보안(DRM) 모듈 연동 — 유료 도서의 DRM 복호화 모듈을 리더 SDK에 통합. 암호화된 컨텐츠의 복호화·렌더링 파이프라인 구성 및 단말 인증 처리
- [jd] SDK 배포 시 보안 요건 대응 — 복호화 키·사용자 데이터의 단말 내 저장 방식 정의

Sqlite DB 설계 및 json 타입 export/import 기능 개발
- 멀티플랫폼(iOS,AOS,PC)간 사용자데이터 동기화 방식 정의
- 사용자데이터(주석,메모 등) 포맷 정의

**iOS용 교보 E-Book 앱 개발** (2010.08 - 2011.03, 앱개발, 사원)
- 서재 기능 개발
- e-pub 파서 개발
- 사용자 데이터(주석,밑줄) 생성 및 관리 기능 개발
- 멀티스크린(iPhone/iPad) 지원 기능 개발(without universal)
- 앱 런칭 및 유지 보수

**Android용 교보 E-Book 앱 개발** (2010.03 - 2010.07, 앱개발, 사원)
- e-pub 뷰어 파트 개발
- 뷰어 성능 개선 및 UI 개발

## 학력

**원광대학교** (2003.03 - 2010.08, 졸업) · 컴퓨터공학과

## 스킬

Python, AWS, Git, iOS, HTML, JavaScript, MySQL, SQL, C / C++, GitHub, Flutter, Swift, Objective-C, Java, Neo4j, CouchDB, MongoDB, Firebase, GCP, Node.js, Dart

## 성향

- **분야를 가리지 않고 넓게 익히고, 필요한 것을 골라 씁니다.** 아키텍처·설계, 코드 품질, 함수형·반응형, 데이터베이스, 웹 프레임워크까지 꾸준히 학습해 왔고, 배운 것을 실무로 옮겨 'effy live'의 Active Record → Clean Architecture + BLoC 전면 리팩토링, TestValley V2 아키텍처 재설계, Soonshot 도메인 기반 설계를 진행했습니다.
- **돌아가는 코드와 좋은 코드를 구분하려 합니다.** 언어별 관용과 함정, 리팩터링 기법을 따로 공부해 코드 구조를 개선하는 기준으로 삼습니다.
- **반응형·함수형 사고를 실무 선택의 기준으로 삼습니다.** 함수형·반응형 프로그래밍을 별도로 학습해 RxDart·RxSwift를 일관되게 적용해 왔습니다.
- **특정 언어에 정체성을 두지 않습니다.** Swift/Objective-C/Cocoa, Java, JavaScript/TypeScript, Node.js, Python, Go, Elixir, Dart를 두루 다루며, iOS → 서버 → Flutter → 웹으로 이어진 경력 궤적과 일치합니다.
- **저장소를 목적별로 나눠 씁니다.** 관계형·문서·그래프 DB의 성격을 각각 익혀, 실제로 Firestore(실시간 동기화) + Neo4j(소셜 그래프) + MySQL(결제)을 목적에 따라 분리해 설계했습니다.
- **프레임워크 세대 변화를 건너뛰지 않고 따라갑니다.** AngularJS → React·React Native(1·2판) → Svelte/Sapper 순으로 학습해 왔고, 2025년 Svelte 5의 룬(Runes)을 실무 MVP에 적용했습니다.
- **팀과 일정, 리스크를 관리 대상으로 봅니다.** 맨먼스 미신, Slack·리스크 관리(Tom DeMarco), Team Geek 등을 읽었고, 개발리드·개발총괄로서 데일리 스크럼·스프린트 도입과 코드 리뷰 문화 정착에 반영했습니다.
- **UI를 함께 다루는 영역으로 인식합니다.** 디자인과 드로잉·공간 감각을 따로 익히며, 디자인 시스템을 매개로 디자이너와 시안을 맞춰가는 협업 방식으로 이어졌습니다.

## 수상/자격증/기타

- Product of the Day - Product Hunt — https://www.producthunt.com/products/effy

## 링크

- https://medium.com/@sk3767
- https://iam.hyounsik.com
