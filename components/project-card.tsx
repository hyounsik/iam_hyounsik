import Image from 'next/image';
import Link from 'next/link';
import type { Project } from '@/lib/projects';

const tilts = ['-rotate-2', 'rotate-1', '-rotate-1', 'rotate-2'];

export function ProjectCard({
  project,
  index = 0,
  size = 'lg',
}: {
  project: Project;
  index?: number;
  size?: 'lg' | 'sm';
}) {
  const cover = project.media.find((item) => item.kind === 'image') ?? project.media[0];

  return (
    <Link href={`/projects/${project.slug}`} className="group block">
      <div
        className={`overflow-hidden rounded-3xl bg-shell shadow-xl shadow-black/5 transition-transform duration-300 group-hover:rotate-0 group-hover:scale-[1.02] ${tilts[index % tilts.length]}`}
      >
        <Image
          src={cover.src}
          alt={cover.alt}
          width={800}
          height={600}
          className={`w-full object-cover ${size === 'lg' ? 'aspect-[4/3]' : 'aspect-square'}`}
        />
      </div>
      <div className="mt-4 text-center">
        <p className="display-hero text-2xl">{project.title}</p>
        <p className="mt-1 text-xs uppercase tracking-[0.2em] text-black/40">
          {project.company} · {project.period}
        </p>
      </div>
    </Link>
  );
}
