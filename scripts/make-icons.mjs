#!/usr/bin/env node
/**
 * public/hyounsik.png 하나로 파비콘과 애플 터치 아이콘을 만든다.
 *
 *   node scripts/make-icons.mjs
 *
 * Next.js App Router의 파일 컨벤션을 이용한다.
 *   app/icon.png        → <link rel="icon">        (파비콘)
 *   app/apple-icon.png  → <link rel="apple-touch-icon">
 *
 * 원본이 없으면 경고만 남기고 넘어간다 (빌드를 막지 않는다).
 */

import { execFileSync } from 'node:child_process';
import { copyFileSync, existsSync, statSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = join(dirname(fileURLToPath(import.meta.url)), '..');
// datas/hyounsik.png 가 sync-images를 거쳐 이 위치로 복사된다
const SOURCE = join(ROOT, 'public/images/hyounsik.png');

/** [출력 경로, 한 변 크기] */
const TARGETS = [
  ['app/icon.png', 512],
  ['app/apple-icon.png', 180],
];

if (!existsSync(SOURCE)) {
  console.warn('아이콘 원본이 없어 건너뜁니다: public/images/hyounsik.png');
  console.warn('  이 파일을 두면 파비콘·애플 아이콘·OG 이미지가 자동으로 적용됩니다.');
  process.exit(0);
}

const srcTime = statSync(SOURCE).mtimeMs;
let made = 0;

for (const [rel, size] of TARGETS) {
  const out = join(ROOT, rel);

  // 원본이 바뀌지 않았으면 다시 만들지 않는다
  if (existsSync(out) && statSync(out).mtimeMs >= srcTime) continue;

  copyFileSync(SOURCE, out);
  try {
    // 정사각형이 아니어도 잘리지 않도록 긴 변 기준으로 맞춘다
    execFileSync('sips', ['-Z', String(size), out], { stdio: 'ignore' });
    console.log(`  생성 ${rel} (${size}x${size})`);
    made += 1;
  } catch {
    console.warn(`  ${rel} 리사이즈 실패 — 원본 크기로 둡니다`);
  }
}

console.log(made > 0 ? `아이콘 ${made}개 생성` : '아이콘 최신 상태');
