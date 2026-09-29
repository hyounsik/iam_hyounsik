import type { Metadata } from 'next';
import { Inter, Oswald } from 'next/font/google';
import { site } from '@/lib/site';
import './globals.css';

const inter = Inter({ subsets: ['latin'], variable: '--font-inter' });
const oswald = Oswald({ subsets: ['latin'], variable: '--font-oswald' });

/**
 * 링크 공유(카카오톡·슬랙·트위터 등)에 쓰이는 대표 이미지.
 * 지정하지 않으면 스크래퍼가 페이지의 첫 이미지를 임의로 골라 간다.
 */
const ogImage = {
  url: '/images/hyounsik.png',
  width: 1200,
  height: 1200,
  alt: `${site.name} · ${site.role}`,
};

export const metadata: Metadata = {
  metadataBase: new URL(site.url),
  title: {
    default: `${site.name} · ${site.role}`,
    template: `%s · ${site.name}`,
  },
  description: site.intro[0],
  alternates: { canonical: '/' },
  openGraph: {
    title: `${site.name} · ${site.role}`,
    description: site.intro[0],
    url: site.url,
    siteName: `${site.name} · Portfolio`,
    locale: 'ko_KR',
    type: 'website',
    images: [ogImage],
  },
  twitter: {
    card: 'summary_large_image',
    title: `${site.name} · ${site.role}`,
    description: site.intro[0],
    images: [ogImage.url],
  },
  /**
   * 색인 여부는 lib/site.ts의 searchIndexing 하나로 제어한다.
   * 레이아웃에 있으므로 모든 페이지에 적용된다.
   *
   * 차단할 때도 robots.txt의 크롤링은 계속 허용해야 한다 — 크롤링을 막으면
   * 크롤러가 이 태그를 읽지 못해, 이미 색인된 URL이 오히려 그대로 남는다.
   */
  robots: site.searchIndexing
    ? {
        index: true,
        follow: true,
        googleBot: { index: true, follow: true, 'max-image-preview': 'large' },
      }
    : {
        index: false,
        follow: false,
        googleBot: { index: false, follow: false },
      },
  // Search Console 소유권 확인용. 값이 있을 때만 meta 태그가 나간다
  ...(site.googleSiteVerification
    ? { verification: { google: site.googleSiteVerification } }
    : {}),
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="ko" className={`${inter.variable} ${oswald.variable}`}>
      <body className="min-h-screen font-sans">{children}</body>
    </html>
  );
}
