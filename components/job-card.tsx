import Image from 'next/image';
import type { Job } from '@/lib/careers';

export function JobCard({ job, accentColor }: { job: Job; accentColor: string }) {
  return (
    <article className="rounded-2xl border border-black/5 p-6 sm:p-8">
      <div className="flex flex-wrap items-baseline justify-between gap-2">
        <h3 className="text-xl font-semibold">{job.title}</h3>
        {job.dateString && (
          <span
            className="rounded-full px-3 py-1 text-xs font-medium"
            style={{ backgroundColor: `${accentColor}1a`, color: accentColor }}
          >
            {job.dateString}
          </span>
        )}
      </div>
      <ul className="mt-4 space-y-2 text-sm text-black/70">
        {job.details.map((detail) => (
          <li key={detail} className="flex gap-2">
            <span className="text-black/30">&bull;</span>
            <span>{detail}</span>
          </li>
        ))}
      </ul>
      {job.image && (
        <Image
          src={job.image}
          alt={job.title}
          width={800}
          height={500}
          className="mt-6 w-full rounded-xl object-contain"
        />
      )}
    </article>
  );
}
