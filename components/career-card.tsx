import Image from 'next/image';
import Link from 'next/link';
import type { CareerEntry } from '@/lib/careers';

export function CareerCard({ career }: { career: CareerEntry }) {
  return (
    <Link
      href={`/projects/${career.slug}`}
      className="group flex items-center gap-5 rounded-2xl border border-black/5 p-5 transition hover:border-black/10 hover:shadow-lg hover:shadow-black/5"
    >
      <div
        className="flex h-16 w-16 shrink-0 items-center justify-center rounded-xl"
        style={{ backgroundColor: `${career.accentColor}1a` }}
      >
        <Image
          src={career.cardImages[0]}
          alt={career.title}
          width={40}
          height={40}
          className="h-10 w-10 object-contain"
        />
      </div>
      <div className="min-w-0 flex-1">
        <div className="flex items-baseline justify-between gap-3">
          <h3 className="truncate font-semibold">{career.title}</h3>
          <span className="shrink-0 text-xs text-black/40">{career.dateString}</span>
        </div>
        <p className="mt-1 truncate text-sm text-black/60">{career.summary[0]}</p>
      </div>
      <span className="shrink-0 text-black/20 transition group-hover:translate-x-1 group-hover:text-black/40">
        &rarr;
      </span>
    </Link>
  );
}
