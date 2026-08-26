# 이현식 — Flutter·iOS·Server 풀스택 개발자

포트폴리오 작성일: 2024-09-01

## KOKIRI (2023.09 ~)

'코끼리'는 MBC 사내 벤처로 시작하여 MBC와 SM으로부터 투자를 받은 한국어 교육 서비스. K-Drama, K-Pop과 같은 영상을 통한 한국어 교육 서비스를 제공하며, 단어책·한국어 교재 등 책과 앱을 연결하거나 Kokiri앱 외 미니앱을 분리하는 방식으로 사용자 확대를 시도하고 있다.

**Flutter App V2 개발**
- 개발 프로세스 개선: 스프린트 단위 업무 처리, 타팀간 협업 개선
- 프로젝트 구조 개선: Lib/App 파트 분리하여 미니앱과 Flutter 웹 개발이 용이하도록 구조 개선
- RiverPod에서 RxDart + Provider로 교체하여 상태관리 코드 개선
- UX 개선 및 안정성 개선
- 관리자 페이지 유지보수
- 주요 사용 스택: RxDart, Provider, GetIt, melos, dio, freezed, firebase, GraphQL

**서버 운영 및 개발**
- 배포 프로세스 개선: nestJS monorepo 적용, Service server/Admin server/Push server를 하나의 이미지로 통합 관리
- 프로젝트 구조 개선: Core / App 파트 분리하여 코드 공통화
- 사용 언어 및 기술: TypeScript, NestJS
- 서버 구조: CMS-Server, API-Server, RevenueCat-Server, Push-Server를 Prisma 기반 Core Library로 묶어 MonoRepo로 통합. Firebase Auth/FireStore, Graph(관계/추천) DB, User/Content DB, Payment DB, BigQuery를 연결한 서비스 아키텍처 구성

## TestValley (2022.11 ~ 2023.09)

전자제품 버티컬 커머스 앱. 주식회사 비엘큐에서 서비스하는 '테스트밸리 - 전자제품 사는 게 즐겁다' (Google Play, 4.7★/285 리뷰/10K+ 다운로드).

**Flutter App 개발 (Version 2)**
- 홈 화면 전면 개편, 앱 유저플로우 개선
- 퍼포먼스 개선: 메모리 문제 등 최적화 개선, 웹뷰 → 플러터로 교체
- 레거시 앱 운영 및 V2앱 전환 작업 병행 진행
- 주요 사용 스택: RxDart, Provider, GetIt, melos, dio, freezed, firebase

## Effy Live (창업 참여, ~2022.11)

음성 숏폼 & Live SNS 서비스. 창업에 직접 참여. 전 회사에서 쌓은 WebRTC 라이브 방송 서비스 경험과 SNS 서비스 제작 경험을 바탕으로 2019년 6월부터 2022년 11월까지 4년간 개발·운영. Neo4j로 게시물-사용자 지식그래프를 구성하고, 클라우드 서비스를 적극 활용해 적은 인원으로 기존 SNS 대부분의 기능을 구현하는 데 중점을 두었다.

**Flutter client 개발**
- Firestore의 sync 기능을 활용한 대기 없는 client 개발 — couchDB 경험을 살려 로딩 경험 최소화를 목표로 설계
- Cloud Function 적용: 무겁거나 관리자 권한이 필요한 작업은 Cloud Function으로 처리하고, 결과를 Firestore에 반영해 클라이언트가 sync로 리스닝하여 대기 시간을 대폭 단축
- RxDart, Provider를 이용한 BLoC 패턴 구현, Firestore sync 스트림을 RxDart로 적극 활용

**시장 반응**
- Product Hunt에서 Daily 순위 2위(Product of the Day) 등 사용자들로부터 높은 평가를 받으며 사용자 10만 명 이상을 모음

**시스템 구조**
- 풀스택 개발자 1명이 서버부터 클라이언트까지 담당해야 하는 상황을 고려해, 운영 비용을 최대한 줄이는 방향으로 인프라 설계
- BackEnd: Firebase(Auth/Cloud Functions/FCM/Firestore) ↔ Service/Purchase Server ↔ MySQL/Neo4j ↔ BigQuery
- Cloud Service: Google Analytics, AWS Transcoder, Pub/Sub, Cloud CDN, Agora WebRTC

## Remote Monster (~2019)

WebRTC SaaS, 영상 기반 소셜 서비스.

**WebRTC iOS 라이브러리 개발**
- RemoteMonster 라이브러리 개발 및 배포 (cocoapods.org/pods/RemoteMonster)
- WebRTC를 이용한 라이브 방송 SDK 개발
- 개발 언어 및 기술: Swift, SocketIO, WebRTC

**Waggle Quiz iOS 앱 개발**
- 라이브 퀴즈쇼 앱 개발, SwiftUI를 이용한 iOS 앱 개발
- WebRTC를 이용한 라이브 방송 시청 기능 개발
- Firebase Realtime DB를 이용하여 1000명 이상 사용자가 한 공간에서 채팅/문제 풀이를 진행하는 기능 개발
- Firebase Cloud Function 기반 serverless 백엔드 기능 개발
- 주요 기술 스택: Swift, Swift UIKit, JavaScript, Node.js, Express

**Waggle iOS 앱 개발**
- 청소년 대상 영상 SNS 서비스 개발: SwiftUI 기반 iOS 앱, Node.js 서버, Neo4j 기반 Graph 모델 설계, Firebase RealtimeDB 설계 및 개발, 서비스 아키텍처 설계
- 주요 기술 스택: Swift, Swift UIKit, JavaScript, Node.js, Express, Neo4j

## 레인보우 와이어리스 (iOS 앱 개발 및 서버 개발)

- 'Nursing ERP' IoT 장비 관리 서비스 개발: Node.js 기반 application 서버 개발, Polymer 기반 웹 클라이언트(관리자 페이지), AngularJS 기반 웹 클라이언트(사용자 페이지)
- iOS용 'Tving' 앱 개발: 4.x → 5.0 개편 작업 참여, 메인 페이지 UI 및 기능 개발, 공통 UI 모듈 개발, 카테고리 상세 페이지 개발, 컨텐츠 상세 페이지 개발

## Sentence lab. (iOS & MacOS용 utility 앱 개발)

**Email 베이스 할일 목록 관리 ('Frame')**
- iOS용 EMail 클라이언트 개발: Pop3/IMAP 관리 모듈, 편지함 관리 모듈, UI/UX 개발
- couchDB를 이용하여 멀티 디바이스간 할일 목록 동기화 기능 개발
- iOS&macOS용 공용 통신 모듈 개발
- 주요 기술 스택: Objective-C, CocoaTouch, couchDB

**iOS & macOS 클립보드 공유 앱 개발 ('Skip')**
- Objective-C를 이용한 iOS&macOS 앱 개발: iOS&macOS용 클라이언트 개발, iOS&macOS 공용 socket 통신 관리 모듈 개발

## Feelink (FLK, Simply Connect)

**iOS용 EPub 리더 SDK 개발 및 E-Book 앱 2.0 개발**
- iOS용 epub 리더 SDK 설계, 기존 교보 E-Book 리더에 SDK 적용 지원, 교보 E-Book 앱 런칭 및 유지보수
- Sqlite DB 설계 및 json 타입 export/import 기능 개발: 멀티플랫폼(iOS,AOS,PC)간 사용자데이터 동기화 방식 정의, 사용자데이터(주석,메모 등) 포맷 정의

**EPub Viewer 라이브러리 개발**
- iOS용 교보 E-Book 앱 개발: 서재 기능, e-pub 파서, 사용자 데이터(주석/밑줄) 생성 및 관리 기능, 멀티스크린(iPhone/iPad) 지원(without universal), 앱 런칭 및 유지보수
- Android용 교보 E-Book 앱 개발: e-pub 뷰어 파트 개발, 뷰어 성능 개선 및 UI 개발
