import type { Metadata } from 'next';
import { Inter, Oswald } from 'next/font/google';
import { site } from '@/lib/site';
import './globals.css';

const inter = Inter({ subsets: ['latin'], variable: '--font-inter' });
const oswald = Oswald({ subsets: ['latin'], variable: '--font-oswald' });

export const metadata: Metadata = {
  metadataBase: new URL(site.url),
  title: {
    default: `${site.name} · ${site.role}`,
    template: `%s · ${site.name}`,
  },
  description: site.intro[0],
  openGraph: {
    title: `${site.name} · ${site.role}`,
    description: site.intro[0],
    url: site.url,
    type: 'website',
  },
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
