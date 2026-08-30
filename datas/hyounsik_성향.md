# 이현식 — 성향 정리

책장 사진(5칸)에서 관찰되는 독서 이력을 바탕으로 정리한 개발 성향 문서.
경력 기술서([hyounsik.md](hyounsik.md))의 근거를 보강하는 용도로 쓴다.

---

## 한 줄 요약

**언어와 프레임워크는 계속 갈아타되, 설계 원칙과 코드 품질에 대한 기준은 한 축으로 유지해 온 개발자.**
여기에 팀·프로세스에 대한 관심과 디자인 감각이 얹혀 있다.

---

## 1. 설계·구조에 대한 지속적 관심

| 책 | 성격 |
| --- | --- |
| Clean Architecture (Robert C. Martin) | 아키텍처 원칙 |
| 엔터프라이즈 애플리케이션 아키텍처 패턴 (PoEAA, Fowler) | 레이어·데이터 매퍼 패턴 |
| 데이터 중심 애플리케이션 설계 (DDIA) | 분산 시스템 설계 |
| 리팩터링 1판 · 2판 (Fowler) | 구조 개선 |
| Refactoring to Patterns | 패턴 기반 리팩토링 |
| Head First Object-Oriented Analysis & Design | 객체지향 설계 |
| Cocoa Design Patterns | 플랫폼별 패턴 |

**해석**: 리팩터링을 1판과 2판 모두 갖고 있고, Fowler 계열(PoEAA·리팩터링)과 Martin 계열(Clean Architecture)을 함께 본다.
새 프로젝트마다 아키텍처를 다시 세우는 실무 이력과 직접 연결된다 —
'effy live'의 *Active Record → Clean Architecture(Data Mapper) + BLoC 전면 리팩토링*,
TestValley의 *V1 → V2 아키텍처 재설계*, Soonshot의 *도메인 기반 설계 적용*이 모두 이 계열 독서의 실행이다.

## 2. 코드 품질과 테스트

- Test-Driven Development: By Example (Kent Beck)
- Effective Unit Testing
- Effective Java (2nd Edition) · 자바 퍼즐러 (Joshua Bloch)
- Effective JavaScript
- JavaScript: The Good Parts
- Professional 소프트웨어 개발

**해석**: "동작하는 코드"가 아니라 "왜 이렇게 쓰는가"를 다루는 Effective/Puzzler 계열이 여러 권.
언어의 함정과 관용을 파고드는 성향이 보인다.

## 3. 반응형·함수형 사고

- Functional Thinking
- 반응형 프로그래밍 RxJS
- 처음 배우는 엘릭서(Elixir) 프로그래밍

**해석**: 실무에서 RxDart·RxSwift를 일관되게 선택해 온 배경이 독서로 뒷받침된다.
Elixir는 업무에 쓰지 않았음에도 갖고 있다 — 관심 영역이 실무 필요를 넘어선다는 신호.

## 4. 언어·플랫폼의 폭

Swift / SwiftUI / Objective-C / Cocoa · Java · JavaScript · TypeScript · Node.js · Python · Go · Elixir · Dart · Django(Python) · Cocos2d-x

**해석**: 특정 언어에 정체성을 두지 않는다.
"내가 아는 기술보다 요구에 맞는 기술을 찾아 적용하는 것을 선호한다"는 기존 자기소개와 정확히 일치한다.
iOS(Objective-C) → 서버(Node.js) → Flutter(Dart) → 웹(Svelte/TypeScript)으로 이어진 경력 궤적이 그대로 책장에 남아 있다.

## 5. 데이터 저장소를 목적별로 고르는 태도

- Neo4j로 시작하는 그래프 데이터베이스 2/e
- The Definitive Guide to SQLite (SQLite 마스터북)
- NoSQL 프로그래밍
- 웹 앱 API 개발을 위한 GraphQL
- 구글 빅쿼리 완벽 가이드
- 데이터 중심 애플리케이션 설계

**해석**: 하나의 DB로 모든 걸 해결하려 하지 않는다.
실무에서 *Firestore(실시간 동기화) + Neo4j(소셜 그래프) + MySQL(결제)* 를 목적별로 나눠 쓴 설계와 대응된다.

## 6. 프레임워크 세대 변화를 계속 따라감

AngularJS in Action → Learning React · React Native(1판, 2/E) → Svelte and Sapper in Action

**해석**: 웹 프론트엔드 세대교체를 한 세대도 건너뛰지 않고 따라왔다.
2025년 더크리스피에서 **Svelte 5의 룬(Runes)** 을 실무 MVP에 적용한 것이 이 흐름의 최신 지점이다.
React Native를 1판·2판 모두 갖고 있다는 점도 눈에 띈다 — Flutter를 주력으로 쓰면서도 경쟁 스택을 계속 관찰해 왔다.

## 7. 팀·프로세스·사람에 대한 관심

- 맨먼스 미신 (The Mythical Man-Month)
- Slack · 리스크 관리 (Tom DeMarco)
- Team Geek — 소프트웨어 괴짜들을 위한 세 가지 법칙
- 드리밍 인 코드
- 프로젝트가 서쪽으로 간 까닭은

**해석**: 기술서만 있는 책장이 아니다. DeMarco 계열이 여러 권이라는 건
**일정·인력·리스크를 관리 대상으로 보는 시각**을 갖고 있다는 뜻이다.
개발리드·개발총괄 이력, 데일리 스크럼·스프린트 도입 경험과 맞물린다.

## 8. 디자인·시각 감각

- Simple and Usable — 단순한 디자인이 성공한다
- 스케치 쉽게 하기 (인물 드로잉 / 풍경 드로잉) — 2권
- 최고의 집을 만드는 공간 배치의 교과서
- 아날로그의 반격

**해석**: 개발자 책장에 드로잉 책이 두 권 있는 건 흔치 않다.
디자이너와 WidgetBook으로 소통하며 위젯을 만들고, 시안 구현을 협업해 온 이력의 밑바탕으로 보인다.
UI를 "받아서 구현하는 대상"이 아니라 같이 다루는 영역으로 인식한다.

## 9. 영어와 원문 접근

- Grammar in Use (Basic · Intermediate)
- English for Developers
- IT 트렌드로 배우는 개발자 영어 독해

**해석**: 원문 문서·레퍼런스를 직접 읽으려는 의지.
RemoteMonster에서 **영문 SDK 레퍼런스 문서와 가이드를 직접 작성**했고,
'effy live'에서 해외 사용자 대상 PayPal 결제와 Product Hunt 런칭(글로벌 사용자 10만 명)을 다룬 이력과 이어진다.

## 10. 커리어와 삶에 대한 질문

- 퇴사하겠습니다
- 왜 학교는 불행한가
- 아날로그의 반격

**해석**: 일하는 방식과 삶의 방향을 스스로 되묻는 편. 기술 외의 관점을 의식적으로 들인다.

---

## 종합 — 세 문장

1. **설계 기준은 유지하고 도구는 바꾼다.** Fowler·Martin 계열의 설계서를 꾸준히 읽으면서, 언어는 Objective-C에서 Dart, TypeScript까지 필요에 따라 옮겨 왔다.
2. **품질을 언어 수준에서 따진다.** Effective/Puzzler 계열과 TDD·단위 테스트 서적이 나란히 있다. 돌아가는 코드와 좋은 코드를 구분하려는 태도.
3. **혼자 잘하는 것에서 멈추지 않는다.** 팀·일정·리스크를 다루는 책과 디자인·드로잉 책이 함께 있다. 개발리드·개발총괄 역할을 맡아 온 이력과 일관된다.

---

## 비고

- 이 문서는 **책장 사진의 책등(spine)을 판독해 정리한 것**이라, 일부 제목은 오독 가능성이 있다.
- 소장 사실이 곧 정독을 뜻하지는 않으므로, 면접 등에서 인용할 때는 실제로 읽고 적용한 책 중심으로 고르는 것이 안전하다.
- 특히 **Clean Architecture / 리팩터링 / DDIA / Effective Java**는 실무 이력(대규모 리팩토링, 멀티 DB 설계)과 직접 연결되므로 근거로 쓰기 좋다.
