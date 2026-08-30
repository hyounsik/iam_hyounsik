#!/usr/bin/env node
/**
 * datas/<회사>/ 의 이미지를 public/images/<회사>/ 로 동기화한다.
 *
 *   node scripts/sync-images.mjs          동기화 + 참조 검사
 *   node scripts/sync-images.mjs --check  복사 없이 검사만
 *
 * - 영상(.mp4/.mov 등)은 옮기지 않는다. 웹에는 YouTube 임베드를 쓴다.
 * - datas/examples 는 디자인 레퍼런스라 제외한다.
 * - 폭이 MAX_WIDTH를 넘으면 sips로 줄인다 (원본은 datas/에 그대로 남는다).
 * - 마지막에 lib/*.ts 가 참조하는 경로가 실제로 존재하는지 검사한다.
 */

import { execFileSync } from 'node:child_process';
import { copyFileSync, existsSync, mkdirSync, readdirSync, readFileSync, statSync } from 'node:fs';
import { dirname, extname, join, relative } from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = join(dirname(fileURLToPath(import.meta.url)), '..');
const SRC = join(ROOT, 'datas');
const DEST = join(ROOT, 'public/images');
const EXCLUDE_DIRS = new Set(['examples']);
const IMAGE_EXT = new Set(['.png', '.jpg', '.jpeg', '.webp', '.gif', '.avif']);
/**
 * 영상은 기본적으로 옮기지 않는다(대부분 원본 화면녹화라 수십~수백 MB).
 * lib/*.ts 가 실제로 참조하는 파일만 골라서 복사한다.
 */
const VIDEO_EXT = new Set(['.mp4', '.mov', '.webm']);
const MAX_WIDTH = 1200;
/** 이 크기를 넘는 영상은 배포 용량 경고를 띄운다 */
const VIDEO_WARN_MB = 20;

const checkOnly = process.argv.includes('--check');

/** sips로 이미지 폭을 읽는다. 실패하면 null. */
function widthOf(file) {
  try {
    const out = execFileSync('sips', ['-g', 'pixelWidth', file], { encoding: 'utf8' });
    const m = out.match(/pixelWidth:\s*(\d+)/);
    return m ? Number(m[1]) : null;
  } catch {
    return null;
  }
}

function collectImages(dir, base = '', exts = IMAGE_EXT) {
  const found = [];
  for (const entry of readdirSync(dir, { withFileTypes: true })) {
    if (entry.name.startsWith('.')) continue;
    const abs = join(dir, entry.name);
    const rel = base ? `${base}/${entry.name}` : entry.name;
    if (entry.isDirectory()) {
      if (!base && EXCLUDE_DIRS.has(entry.name)) continue;
      found.push(...collectImages(abs, rel, exts));
    } else if (exts.has(extname(entry.name).toLowerCase())) {
      found.push(rel);
    }
  }
  return found;
}

/** lib/*.ts 가 참조하는 경로를 모은다 (영상 선별 복사와 참조 검사에 함께 쓴다) */
function collectReferences() {
  const refs = new Set();
  for (const file of ['lib/projects.ts', 'lib/site.ts']) {
    const abs = join(ROOT, file);
    if (!existsSync(abs)) continue;
    const text = readFileSync(abs, 'utf8');
    for (const m of text.matchAll(/(?:shot|clip)\(\s*'([^']+)'/g)) refs.add(m[1]);
    for (const m of text.matchAll(/'\/images\/([^']+)'/g)) refs.add(m[1]);
  }
  return refs;
}

const referenced = collectReferences();

const allExt = new Set([...IMAGE_EXT, ...VIDEO_EXT]);
const images = existsSync(SRC)
  ? collectImages(SRC, '', allExt).filter(
      // 이미지는 전부, 영상은 코드가 참조하는 것만 옮긴다
      (rel) => !VIDEO_EXT.has(extname(rel).toLowerCase()) || referenced.has(rel),
    )
  : [];
let copied = 0;
let resized = 0;
let skipped = 0;

for (const rel of images) {
  const from = join(SRC, rel);
  const to = join(DEST, rel);

  // 대상이 최신이면 건너뛴다
  if (existsSync(to) && statSync(to).mtimeMs >= statSync(from).mtimeMs) {
    skipped += 1;
    continue;
  }

  if (checkOnly) {
    console.log(`  [미동기화] ${rel}`);
    copied += 1;
    continue;
  }

  mkdirSync(dirname(to), { recursive: true });
  copyFileSync(from, to);
  copied += 1;

  if (VIDEO_EXT.has(extname(rel).toLowerCase())) {
    const mb = statSync(to).size / 1048576;
    const warn = mb > VIDEO_WARN_MB ? `  ⚠ 배포 용량 주의` : '';
    console.log(`  복사 ${rel}  (${mb.toFixed(1)}MB)${warn}`);
    continue;
  }

  const w = widthOf(to);
  if (w && w > MAX_WIDTH) {
    try {
      execFileSync('sips', ['--resampleWidth', String(MAX_WIDTH), to], { stdio: 'ignore' });
      resized += 1;
      console.log(`  복사+리사이즈 ${rel}  (${w} → ${MAX_WIDTH})`);
    } catch {
      console.log(`  복사 ${rel}  (리사이즈 실패, 폭 ${w})`);
    }
  } else {
    console.log(`  복사 ${rel}`);
  }
}

console.log(
  checkOnly
    ? `\n검사: 미동기화 ${copied}개 / 최신 ${skipped}개`
    : `\n동기화 완료: 복사 ${copied}개 (리사이즈 ${resized}개), 최신 ${skipped}개`,
);

// --- 잔재 검사: datas에서 지웠는데 public에 남은 파일 ----------------------
// 원본이 사라진 뒤에도 public에 남으면, 이름만 다른 같은 이미지가 중복 노출된다.
const source = new Set(images);
const orphans = existsSync(DEST)
  ? collectImages(DEST, '', allExt).filter((rel) => !source.has(rel))
  : [];

if (orphans.length > 0) {
  console.warn(`\ndatas에 원본이 없는 public 자산 ${orphans.length}개:`);
  for (const rel of orphans) console.warn(`  - public/images/${rel}`);
  console.warn('  (datas에서 지웠거나 이름이 바뀐 파일입니다. 참조를 고친 뒤 삭제하세요.)');
}

// --- 참조 검사: 코드가 가리키는 자산이 실제로 있는지 ----------------------
const missing = [...referenced].filter((rel) => !existsSync(join(DEST, rel))).sort();

if (missing.length > 0) {
  console.error(`\n참조되지만 존재하지 않는 이미지 ${missing.length}개:`);
  for (const rel of missing) {
    const hint = existsSync(join(SRC, rel)) ? ' (datas에는 있음)' : '';
    console.error(`  - ${relative(ROOT, join(DEST, rel))}${hint}`);
  }
  process.exit(1);
}

console.log(`참조 검사: ${referenced.size}개 경로 모두 정상`);
