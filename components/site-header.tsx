import Link from 'next/link';

export function SiteHeader() {
  return (
    <header className="sticky top-0 z-10 border-b border-black/5 bg-white/80 backdrop-blur">
      <div className="mx-auto flex max-w-4xl items-center justify-between px-6 py-4">
        <Link href="/" className="text-sm font-semibold tracking-tight">
          Lee Hyoun Sik
        </Link>
        <nav className="flex gap-5 text-sm text-black/60">
          <a
            href="https://github.com/hyounsik/iam_hyounsik"
            target="_blank"
            rel="noreferrer"
            className="hover:text-ink"
          >
            GitHub
          </a>
          <a href="mailto:h.sik3768@gmail.com" className="hover:text-ink">
            Email
          </a>
        </nav>
      </div>
    </header>
  );
}
