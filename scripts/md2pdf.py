#!/usr/bin/env python3
"""마크다운 이력서를 인쇄용 PDF로 변환한다.

사용법:
    python3 scripts/md2pdf.py datas/hyounsik.md [출력.pdf]

- `[jd]` 표식과 HTML 주석은 PDF에서 제거된다 (지원서 추적용 메모이므로).
- 헤드리스 Chrome으로 렌더링하므로 한글 폰트가 그대로 적용된다.
"""

import html
import re
import subprocess
import sys
import tempfile
from pathlib import Path

CHROME = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

CSS = """
@page { size: A4; margin: 14mm 14mm 16mm; }
* { box-sizing: border-box; }
body {
  font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', sans-serif;
  font-size: 9.6pt; line-height: 1.55; color: #1a1c20; margin: 0;
  -webkit-print-color-adjust: exact; print-color-adjust: exact;
}
h1 { font-size: 22pt; letter-spacing: -0.5px; margin: 0 0 2mm; font-weight: 700; }
.contact { color: #6b7280; font-size: 9pt; margin-bottom: 6mm; }
h2 {
  font-size: 12pt; font-weight: 700; margin: 8mm 0 3mm;
  padding-bottom: 1.5mm; border-bottom: 1.2pt solid #1a1c20;
  break-after: avoid; page-break-after: avoid;
}
h3 {
  font-size: 11pt; font-weight: 700; margin: 6mm 0 1mm;
  break-after: avoid; page-break-after: avoid;
}
.meta { color: #4b5563; font-size: 8.8pt; margin: 0 0 3mm; }
.project {
  font-weight: 700; font-size: 9.8pt; margin: 4mm 0 1mm;
  break-after: avoid; page-break-after: avoid;
}
p { margin: 0 0 1.5mm; }
ul { margin: 0 0 2.5mm; padding-left: 4.5mm; }
li { margin: 0 0 0.8mm; }
li::marker { color: #9ca3af; }
a { color: #1a1c20; text-decoration: none; }
strong { font-weight: 700; }
.summary li { margin-bottom: 1.4mm; }
.skills { color: #374151; }
/* 회사 블록이 페이지 경계에서 제목만 남지 않도록 */
.company { break-inside: auto; }
"""

# 프로젝트 제목 줄: **텍스트** (부가정보)
RE_PROJECT = re.compile(r"^\*\*(.+?)\*\*\s*(.*)$")
RE_BOLD = re.compile(r"\*\*(.+?)\*\*")
RE_URL = re.compile(r"(https?://[^\s<]+)")


def clean(text: str) -> str:
    """PDF에 노출되지 않아야 할 표식을 제거한다."""
    text = re.sub(r"<!--.*?-->", "", text, flags=re.DOTALL)
    text = re.sub(r"\[jd\]\s*", "", text)
    return text


def inline(text: str) -> str:
    """인라인 마크업(굵게, 링크)을 HTML로 바꾼다."""
    out = html.escape(text)
    out = RE_BOLD.sub(r"<strong>\1</strong>", out)
    out = RE_URL.sub(r'<a href="\1">\1</a>', out)
    return out


def convert(md: str) -> str:
    lines = clean(md).split("\n")
    body: list[str] = []
    in_list = False

    def close_list() -> None:
        nonlocal in_list
        if in_list:
            body.append("</ul>")
            in_list = False

    # 첫 두 줄(이름 / 연락처)은 헤더로 따로 처리
    idx = 0
    while idx < len(lines) and not lines[idx].startswith("# "):
        idx += 1
    if idx < len(lines):
        body.append(f"<h1>{inline(lines[idx][2:].strip())}</h1>")
        idx += 1
    while idx < len(lines) and not lines[idx].strip():
        idx += 1
    if idx < len(lines) and not lines[idx].startswith(("#", "-")):
        body.append(f'<p class="contact">{inline(lines[idx].strip())}</p>')
        idx += 1

    # 요약 불릿은 별도 클래스로 묶어 간격을 넓힌다
    summary_open = False

    for raw in lines[idx:]:
        line = raw.rstrip()
        stripped = line.strip()

        if not stripped:
            close_list()
            continue

        if stripped.startswith("### "):
            close_list()
            if summary_open:
                summary_open = False
            body.append(f'<div class="company"><h3>{inline(stripped[4:])}</h3>')
            continue

        if stripped.startswith("## "):
            close_list()
            if summary_open:
                summary_open = False
            body.append(f"<h2>{inline(stripped[3:])}</h2>")
            continue

        if stripped.startswith("- "):
            if not in_list:
                cls = ' class="summary"' if not body or "<h2>" not in "".join(body) else ""
                body.append(f"<ul{cls}>")
                in_list = True
            body.append(f"<li>{inline(stripped[2:])}</li>")
            continue

        close_list()

        m = RE_PROJECT.match(stripped)
        if m:
            title, rest = m.group(1), m.group(2)
            # **2025.10 - 재직중** · 정규직 ... 형태는 회사 메타 정보
            if re.match(r"^\d{4}\.\d{2}", title):
                body.append(f'<p class="meta"><strong>{html.escape(title)}</strong>{inline(rest)}</p>')
            else:
                body.append(f'<p class="project">{html.escape(title)} {inline(rest)}</p>')
            continue

        body.append(f"<p>{inline(stripped)}</p>")

    close_list()
    return "\n".join(body)


def main() -> int:
    if len(sys.argv) < 2:
        print(__doc__)
        return 1

    src = Path(sys.argv[1])
    dst = Path(sys.argv[2]) if len(sys.argv) > 2 else src.with_suffix(".pdf")

    if not src.exists():
        print(f"입력 파일이 없습니다: {src}")
        return 1
    if not Path(CHROME).exists():
        print(f"Chrome을 찾을 수 없습니다: {CHROME}")
        return 1

    page = (
        "<!doctype html><html lang='ko'><head><meta charset='utf-8'>"
        f"<title>{html.escape(src.stem)}</title><style>{CSS}</style></head>"
        f"<body>{convert(src.read_text(encoding='utf-8'))}</body></html>"
    )

    with tempfile.TemporaryDirectory() as tmp:
        page_path = Path(tmp) / "resume.html"
        page_path.write_text(page, encoding="utf-8")
        subprocess.run(
            [
                CHROME,
                "--headless",
                "--disable-gpu",
                "--no-pdf-header-footer",
                f"--print-to-pdf={dst.resolve()}",
                page_path.resolve().as_uri(),
            ],
            check=True,
            capture_output=True,
        )

    print(f"생성 완료: {dst}  ({dst.stat().st_size / 1024:.0f}KB)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
