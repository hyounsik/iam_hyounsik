import Image from 'next/image';
import Link from 'next/link';
import { notFound } from 'next/navigation';
import type { Metadata } from 'next';
import { careers, getCareer } from '@/lib/careers';
import { JobCard } from '@/components/job-card';

export function generateStaticParams() {
  return careers.map((career) => ({ slug: career.slug }));
}

export function generateMetadata({
  params,
}: {
  params: { slug: string };
}): Metadata {
  const career = getCareer(params.slug);
  if (!career) return {};
  return {
    title: career.title,
    description: career.summary.join(' '),
  };
}

export default function CareerPage({ params }: { params: { slug: string } }) {
  const career = getCareer(params.slug);
  if (!career) notFound();

  return (
    <div className="mx-auto max-w-4xl px-6 py-16">
      <Link href="/" className="text-sm text-black/40 hover:text-ink">
        &larr; Home
      </Link>

      <header className="mt-6 flex flex-wrap items-center gap-4">
        <Image
          src={career.titleImage}
          alt={career.title}
          width={56}
          height={56}
          className="h-14 w-14 object-contain"
        />
        <div>
          <h1 className="text-3xl font-bold tracking-tight">{career.title}</h1>
          <p className="mt-1 text-sm font-medium" style={{ color: career.accentColor }}>
            {career.dateString}
          </p>
        </div>
      </header>

      <div className="mt-6 space-y-2 text-black/70">
        {career.summary.map((line) => (
          <p key={line}>{line}</p>
        ))}
      </div>

      <div className="mt-10 space-y-6">
        {career.jobs.map((job) => (
          <JobCard key={job.title} job={job} accentColor={career.accentColor} />
        ))}
      </div>
    </div>
  );
}
