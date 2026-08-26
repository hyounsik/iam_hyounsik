# 프로젝트 개요 및 작업 내용

## 목적
이현식의 **포트폴리오 겸 개인 홈페이지** (https://hyounsik.info).

- Next.js (App Router) + TypeScript + Tailwind CSS v4 + HeroUI v3
- `output: 'export'`로 정적 export 후 Firebase Hosting에 배포 (SSR 미사용)
- 디자인 레퍼런스: https://spencergabor.work — 초대형 condensed 타이포그래피, 기울어진 카드 스택, 하단 전면 CONTACT 섹션
- 레퍼런스 스크린샷: `datas/examples/spencergabor.work(1~4).png`
- 콘텐츠 소스 오브 트루스: `lib/site.ts`(프로필), `lib/projects.ts`(프로젝트)
- 이력 원본 자료: `datas/hyounsik.md`(**최신 이력서 — 콘텐츠 기준**), `datas/portfolio_2024.md`

## 히스토리
원래 Flutter로 만든 모바일 앱이었으나, 2026-07-20 커밋에서 Flutter/Android/iOS 코드를 전부 제거하고 Next.js 기반 정적 웹사이트로 전환했다. 그 이전 커밋들은 Flutter 앱 시절 작업이며 현재 구조와 무관하다.

## 자료 관리 규칙
- 자료가 되는 것들(이력서, 포트폴리오, 스크린샷, 영상 정보)은 모두 `datas/` 폴더에 저장한다.
- `datas/` 하위는 회사/서비스별 폴더로 구분: `kokiri`, `effy`, `testValley`, `crispy`, `remon`, `flk`, `rainbow`, `sentence`, `examples`
- 스크린샷 파일명은 사용자가 구분 가능하게 직접 정리 예정
- YouTube 영상 링크는 `datas/video_info`에 사용자가 정리 예정
- `datas/`는 배포 산출물(`out/`)에 포함되지 않는다.

## 미디어 자산 상태
- 25/26년 작업(드라마 리믹스, AI 캐릭터챗, Soonshot, AI 챗봇, Crispy Lit)은 실제 이미지가 없어 **더미 사용 중**
- 더미 이미지: `public/placeholder/shot-1~6.svg`
- 더미 영상: YouTube embed 더미 링크
- `lib/projects.ts`의 `Media.placeholder: true` 플래그로 교체 필요 자산을 표시
- 실제 링크가 확인된 영상은 이미 반영: KOKIRI(`youtu.be/nl0sN3i6weU`), Effy Live(`youtu.be/fvDae0-39jE`), Waggle Quiz(`youtu.be/e_SQb7TKld8`)
- 연락처(`lib/site.ts`의 `contact`)는 **더미 데이터** — 실제 정보로 교체 필요

## 기술 스택 결정
| 항목 | 선택 | 비고 |
| --- | --- | --- |
| Framework | Next.js 16 (App Router) | 정적 export |
| UI | HeroUI v3 (`@heroui/react`) | `@nextui-org/react`가 deprecated 되어 후속 패키지 사용. Provider 래퍼 불필요 |
| CSS | Tailwind CSS v4 | 설정 파일 없이 `app/globals.css`의 `@theme`으로 토큰 정의 |
| React | 19 | HeroUI v3 / Next 16 요구사항 |
| Font | Oswald (display), Inter (sans) | spencergabor 스타일의 condensed 헤드라인용 |
| Hosting | Firebase Hosting | 프로젝트 `iam-hyounsik` |

## 스크립트
| 스크립트 | 용도 |
| --- | --- |
| `npm run dev` | 로컬 개발 서버 |
| `npm run build` | 정적 export → `out/` |
| `npm run preview` | build 후 Firebase Hosting 에뮬레이터(:5000)로 배포 환경 검증 |
| `npm run serve` | `out/` 단순 정적 서버 확인 |
| `npm run lint` | ESLint |
| `npm run clean` | `.next`, `out` 삭제 |
| `npm run deploy` | build + `firebase deploy --only hosting` |
| `npm run deploy:ci` | `.cert/firebase-service-account.json` 서비스 계정으로 비대화식 배포 |

## 인증 정보
- `.cert/` 폴더에 Firebase 서비스 계정 키 등 배포 인증 정보를 둔다.
- `.cert/`는 `.gitignore`에 포함되어 **커밋되지 않는다** (인증 정보 유출 방지).

## 현재 구조
```
app/
  layout.tsx                # 폰트(Inter, Oswald), 메타데이터
  page.tsx                  # 홈 — Hero / Featured Work / More Work / Contact
  projects/[slug]/page.tsx  # 프로젝트 상세 (generateStaticParams 정적 생성)
  icon.tsx / not-found.tsx
  globals.css               # HeroUI 스타일 import + @theme 토큰 + .display-hero

components/
  project-card.tsx     # 기울어진 프로젝트 카드
  contact-section.tsx  # 하단 대형 CONTACT 섹션

lib/
  site.ts       # 프로필, 연락처(더미), 회사 목록, 스킬, 학력
  projects.ts   # Project[] — 프로젝트 데이터 및 featured/more 분류

public/placeholder/   # 더미 이미지 (SVG)
datas/                # 원본 자료
```

## 프로젝트(콘텐츠) 목록
`lib/projects.ts` 기준. `datas/hyounsik.md`의 경력을 프로젝트 단위로 재구성했다.

| slug | 프로젝트 | 회사 | 기간 | Featured |
| --- | --- | --- | --- | --- |
| drama-remix | 드라마 리믹스 | 에이디지컴퍼니 | 2026.07 - 2026.08 | ✓ |
| ai-character-chat | AI 캐릭터챗 | 에이디지컴퍼니 | 2026.03 - 2026.04 | ✓ |
| soonshot | Soonshot | 에이디지컴퍼니 | 2025.10 - 2026.08 | ✓ |
| ai-chatbot-client | AI 챗봇 서비스 클라이언트 | 더크리스피 | 2025.07 - 2025.08 | |
| crispy-lit | Crispy Lit Short Drama | 더크리스피 | 2025.03 - 2025.07 | ✓ |
| kokiri | KOKIRI | 코이랩스 | 2023.09 - 2025.01 | ✓ |
| testvalley | TestValley | 비엘큐 | 2022.11 - 2023.09 | ✓ |
| effy-live | Effy Live | 에피라이브 | 2019.08 - 2022.11 | ✓ |
| outsourcing-flutter | Flutter 외주 프로젝트 | 에피라이브 | 2019 - 2022 | |
| remote-monster | Waggle & RemoteMonster SDK | 리모트몬스터 | 2017.08 - 2019.05 | ✓ |
| rainbow-brain | Tving & Nursing ERP | 레인보우브레인 | 2015.09 - 2017.05 | |
| sentence-lab | Frame & Skip | 센텐스 | 2013.12 - 2015.07 | |
| feelink-epub | EPub 리더 SDK | 포니링크 | 2010.03 - 2013.02 | |

## 진행 상황
- [x] 프로젝트 구성 — Next 16 / React 19 / Tailwind v4 / HeroUI v3로 갱신
- [x] 패키지 준비 — Tailwind v3 설정 제거, `postcss.config.mjs` 전환
- [x] 배포·로컬 테스트 스크립트 정비 (`preview`, `deploy`, `deploy:ci`, `clean`)
- [x] `.gitignore` 정비 — `.cert/` 커밋 제외 명시
- [x] README 정비
- [x] 데이터 레이어 구성 — `lib/site.ts`, `lib/projects.ts` (hyounsik.md 기준)
- [ ] spencergabor 레퍼런스 기반 디자인 정교화 (타이포 스케일, 스크롤 인터랙션, 카드 스택)
- [ ] 실제 스크린샷/영상으로 더미 자산 교체 (`datas/` 정리 후)
- [ ] 실제 연락처로 더미 연락처 교체
