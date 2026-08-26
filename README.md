# hyounsik.info

이현식의 포트폴리오 겸 개인 홈페이지.

- **URL**: https://hyounsik.info
- **Stack**: Next.js 16 (App Router) · React 19 · TypeScript · Tailwind CSS v4 · HeroUI v3
- **Hosting**: Firebase Hosting (정적 export, SSR 없음)
- **Design reference**: https://spencergabor.work

## 요구 사항

- Node.js 20.9+ (Next.js 16 요구사항)
- Firebase CLI — `npm install -g firebase-tools`

## 시작하기

```bash
npm install
npm run dev
```

http://localhost:3000 에서 확인합니다.

## 스크립트

| 스크립트 | 설명 |
| --- | --- |
| `npm run dev` | 개발 서버 (HMR) |
| `npm run build` | 정적 export → `out/` 생성 |
| `npm run preview` | build 후 Firebase Hosting 에뮬레이터로 실제 배포 환경과 동일하게 확인 (http://localhost:5000) |
| `npm run serve` | `out/`을 단순 정적 서버로 확인 (build 이후 실행) |
| `npm run lint` | ESLint 검사 |
| `npm run clean` | `.next`, `out` 삭제 |
| `npm run deploy` | build 후 `firebase deploy --only hosting` (로컬 로그인 사용) |
| `npm run deploy:ci` | `.cert/firebase-service-account.json` 서비스 계정으로 비대화식 배포 |

## 배포

### 로컬에서 배포

```bash
firebase login       # 최초 1회
npm run deploy
```

### 서비스 계정으로 배포 (CI 또는 비대화식)

`.cert/firebase-service-account.json`에 Firebase 서비스 계정 키를 두고 실행합니다.

```bash
npm run deploy:ci
```

> `.cert/`는 `.gitignore`에 포함되어 있어 커밋되지 않습니다. 인증 정보는 절대 저장소에 올리지 마세요.

Firebase 프로젝트는 `.firebaserc`의 `iam-hyounsik`을 사용하며, `firebase.json`의 `hosting.public`이 `out`으로 지정되어 있어 export 결과물이 그대로 배포됩니다.

## 구조

```
app/
  layout.tsx                # 루트 레이아웃 — 폰트(Inter, Oswald), 메타데이터
  page.tsx                  # 홈 — Hero / Featured Work / More Work / Contact
  projects/[slug]/page.tsx  # 프로젝트 상세 (generateStaticParams로 정적 생성)
  icon.tsx                  # 파비콘
  not-found.tsx             # 404
  globals.css               # HeroUI 스타일 import + Tailwind v4 테마 토큰

components/
  project-card.tsx    # 프로젝트 카드 (기울어진 카드 스타일)
  contact-section.tsx  # 하단 대형 CONTACT 섹션

lib/
  site.ts       # 프로필, 연락처, 스킬, 학력 등 사이트 전역 정보
  projects.ts   # 프로젝트 데이터 (콘텐츠 소스 오브 트루스)

public/placeholder/   # 실제 스크린샷 대체용 더미 이미지

datas/                # 원본 자료 (이력서, 포트폴리오, 스크린샷) — 배포에 포함되지 않음
```

Tailwind CSS v4는 설정 파일 없이 CSS에서 `@theme`으로 토큰을 정의합니다 (`app/globals.css`). HeroUI v3는 Provider 래퍼가 필요하지 않습니다.

## 콘텐츠 수정

- 프로필·연락처·스킬: `lib/site.ts`
- 프로젝트 목록 및 상세: `lib/projects.ts` — 항목을 추가하면 `/projects/[slug]` 페이지가 자동으로 정적 생성됩니다
- 원본 이력 데이터: `datas/hyounsik.md` (최신 이력서), `datas/portfolio_2024.md`

이미지·영상은 아직 더미(`public/placeholder/*.svg`, 더미 YouTube 링크)를 사용하고 있습니다. `datas/` 하위의 실제 스크린샷과 `datas/video_info`의 YouTube 링크로 교체 예정입니다.
