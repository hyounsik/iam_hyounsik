# iam.hyounsik.com 개발 가이드

## 개요
개인 포트폴리오 사이트(https://iam.hyounsik.com). Next.js(App Router)를 정적 export(`output: 'export'`)로 빌드해 Firebase Hosting에 배포한다. 서버 사이드 렌더링(SSR)은 사용하지 않으며, 모든 페이지는 빌드 시점에 정적 HTML로 생성된다.

## 요구 사항
- Node.js 20.19+/22.13+ 권장 (현재 로컬 Node v22.12는 일부 devDependency의 `engines` 범위를 살짝 벗어나지만 빌드/실행에는 지장 없음)
- Firebase CLI (`npm install -g firebase-tools` 또는 `firebase login` 이후 사용 — 로컬에 `firebase` 14.22.0 설치되어 있음)

## 실행 (Run)

```bash
npm install
npm run dev
```

`http://localhost:3000`에서 홈(`/`)과 프로젝트 상세 페이지(`/projects/[slug]`)를 확인한다.

## 빌드 (Build)

```bash
npm run build
```

- `next build`가 정적 export를 수행해 `out/` 디렉터리에 사이트 전체(홈 1개 + 프로젝트 상세 7개 + 404)를 생성한다.
- 동적 라우트(`app/projects/[slug]/page.tsx`)는 `generateStaticParams()`가 `lib/careers.ts`의 slug 목록을 반환하므로, export 시 모든 프로젝트 페이지가 정적 HTML로 미리 생성된다.

빌드 산출물 미리보기 (Firebase에 올라갈 `out/`을 그대로 로컬에서 확인):

```bash
npm run preview   # serve out — build 이후에 실행
```

## 테스트 (Test)
현재 별도의 자동화 테스트 스위트는 없다 (콘텐츠 위주의 정적 사이트). 변경 후 확인해야 할 것:

1. `npm run build`가 에러 없이 끝나고 `out/`에 7개 프로젝트 페이지가 모두 생성되는지 확인
   ```bash
   find out -name "*.html" | sort
   ```
2. `npm run lint` — ESLint(`eslint-config-next`) 검사
3. `npm run dev` 또는 `npm run preview`로 브라우저에서 데스크톱/모바일 반응형 레이아웃과 이미지·영상 로딩 확인
4. `npm run check-images` — 코드가 참조하는 이미지·영상이 실제로 있는지, 원본 없는 잔재가 남았는지 검사

## 배포 (Deploy)

```bash
npm run deploy
```

내부적으로 `npm run build`(정적 export) 후 `firebase deploy --only hosting`을 실행한다. `firebase.json`의 `hosting.public`이 `out`으로 설정되어 있어 export 결과물이 그대로 배포된다. Firebase 프로젝트는 `.firebaserc`에 정의된 `iam-hyounsik`을 사용한다.

배포 전 로그인이 필요하면:
```bash
firebase login
```

## 전체 구조

```
app/
  layout.tsx              # 루트 레이아웃 — 폰트(Inter), 메타데이터, 헤더/푸터 공통 배치
  page.tsx                 # 홈 — 히어로 소개 + 경력 카드 리스트
  icon.tsx                  # 파비콘 (빌드 시 PNG로 생성)
  not-found.tsx             # 404 페이지
  projects/[slug]/page.tsx  # 프로젝트 상세 페이지 (generateStaticParams로 정적 생성)
  globals.css               # Tailwind 진입점

components/
  site-header.tsx   # 상단 네비게이션 (GitHub, Email 링크)
  site-footer.tsx   # 하단 연락처
  career-card.tsx    # 홈 화면의 경력 카드
  job-card.tsx        # 상세 페이지의 직무별 카드

lib/
  careers.ts   # 경력 데이터(CareerEntry[])와 slug 조회 함수 getCareer() — 콘텐츠 소스 오브 트루스

public/images/ # 이미지·영상. datas/에서 자동 동기화된다 (직접 편집하지 말 것)
app/icon.png        # 파비콘 — datas/hyounsik.png에서 자동 생성
app/apple-icon.png  # 애플 터치 아이콘 — 위와 동일

scripts/
  sync-images.mjs  # datas/ → public/images/ 동기화 + 참조 검사
  make-icons.mjs   # hyounsik.png → 파비콘·애플 아이콘 생성
  md2pdf.py        # 마크다운 이력서 → PDF

next.config.mjs      # output: 'export', images.unoptimized: true
tailwind.config.ts    # Tailwind 테마(색상, 폰트)
firebase.json          # hosting.public: 'out'
.firebaserc              # Firebase 프로젝트 id: iam-hyounsik
```

### 콘텐츠 수정하기
경력/프로젝트 내용을 바꿀 때는 `lib/careers.ts`의 `careers` 배열만 수정하면 된다. 새 프로젝트를 추가하면 `app/projects/[slug]/page.tsx`의 `generateStaticParams()`가 자동으로 해당 slug의 정적 페이지를 생성한다.
