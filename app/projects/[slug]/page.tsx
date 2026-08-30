import Image from 'next/image';
import Link from 'next/link';
import { notFound } from 'next/navigation';
import type { Metadata } from 'next';
import { projects, getProject } from '@/lib/projects';
import { ImageStack } from '@/components/image-stack';
import { ContactSection } from '@/components/contact-section';

export function generateStaticParams() {
  return projects.map((project) => ({ slug: project.slug }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const project = getProject(slug);
  if (!project) return {};
  return {
    title: `${project.title} · ${project.company}`,
    description: project.summary,
  };
}

export default async function ProjectPage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const project = getProject(slug);
  if (!project) notFound();

  // 영상(YouTube 임베드 + 로컬 파일)을 먼저, 이미지를 뒤에 배치한다
  const videos = project.media.filter(
    (item) => item.kind === 'youtube' || item.kind === 'video',
  );
  const images = project.media.filter((item) => item.kind === 'image');

  return (
    <>
      <div className="mx-auto max-w-4xl px-6 pt-10">
        <Link href="/" className="text-xs uppercase tracking-[0.2em] text-black/40 hover:text-ink">
          &larr; Back
        </Link>

        <header className="mt-16">
          <p className="text-xs font-bold uppercase tracking-[0.2em]" style={{ color: project.accentColor }}>
            {project.company} · {project.period} · {project.role}
          </p>
          <h1 className="display-hero mt-3 text-6xl sm:text-8xl">{project.title}</h1>
          <p className="mt-6 max-w-2xl text-lg text-black/70">{project.summary}</p>
        </header>

        <div className="mt-8 flex flex-wrap gap-2">
          {project.stack.map((tech) => (
            <span
              key={tech}
              className="rounded-full bg-shell px-3 py-1 text-xs font-medium text-black/60"
            >
              {tech}
            </span>
          ))}
        </div>

        <ul className="mt-12 space-y-3">
          {project.highlights.map((highlight) => (
            <li key={highlight} className="flex gap-3 text-black/70">
              <span aria-hidden style={{ color: project.accentColor }}>
                —
              </span>
              <span>{highlight}</span>
            </li>
          ))}
        </ul>

        {project.links && project.links.length > 0 && (
          <div className="mt-10 flex flex-wrap gap-4">
            {project.links.map((link) => (
              <a
                key={link.url}
                href={link.url}
                target="_blank"
                rel="noreferrer"
                className="text-sm font-semibold underline decoration-2 underline-offset-4"
              >
                {link.label} &rarr;
              </a>
            ))}
          </div>
        )}

        <div className="mt-16 space-y-10">
          {videos.map((item) =>
            item.kind === 'youtube' ? (
              <div key={item.src} className="overflow-hidden rounded-3xl bg-shell">
                <iframe
                  src={item.src}
                  title={item.alt}
                  allow="accelerometer; clipboard-write; encrypted-media; picture-in-picture"
                  allowFullScreen
                  className="aspect-video w-full"
                />
              </div>
            ) : (
              // 세로 영상이 많아 aspect 고정 없이 원본 비율을 유지한다.
              // 브라우저는 소리 있는 자동재생을 막으므로 muted가 필수다.
              <div key={item.src} className="overflow-hidden rounded-3xl bg-shell">
                <video
                  src={item.src}
                  poster={item.poster}
                  controls
                  autoPlay
                  muted
                  loop
                  playsInline
                  preload="auto"
                  aria-label={item.alt}
                  className="mx-auto max-h-[80vh] w-full object-contain"
                />
              </div>
            ),
          )}

          {images.length > 0 &&
            (project.mediaLayout === 'stack' ? (
              <ImageStack
                items={images}
                size={project.mediaStackSize ?? 'md'}
                square={false}
                className="py-6"
              />
            ) : (
              images.map((item) => (
                <Image
                  key={item.src}
                  src={item.src}
                  alt={item.alt}
                  width={1200}
                  height={900}
                  className="w-full rounded-3xl bg-shell object-cover"
                />
              ))
            ))}
        </div>
      </div>

      <ContactSection />
    </>
  );
}
