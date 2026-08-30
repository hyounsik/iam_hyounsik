import { site } from '@/lib/site';
import { featuredProjects, moreProjects } from '@/lib/projects';
import { ProjectCard } from '@/components/project-card';
import { ImageStack } from '@/components/image-stack';
import { ContactSection } from '@/components/contact-section';

export default function HomePage() {
  return (
    <>
      <section className="px-6 pt-10 text-center">
        <p className="text-xs font-bold uppercase tracking-[0.2em]">{site.location}</p>
        <a
          href={`mailto:${site.contact.email}`}
          className="mt-1 block text-xs uppercase tracking-[0.2em] text-black/40 hover:text-ink"
        >
          {site.contact.email}
        </a>

        <h1 className="display-hero mt-24 [font-size:13vw]">{site.nameEn}</h1>

        <ImageStack items={site.heroImages} size="lg" className="mx-auto mt-[5vw] max-w-3xl" />

        <p className="display-hero mt-10 text-mute [font-size:8vw]">
          Flutter, iOS
          <br />& Server Developer
        </p>

        <div className="mt-24">
          <p className="text-xs font-bold uppercase tracking-[0.2em]">Companies include</p>
          <p className="mt-1 text-xs uppercase tracking-[0.2em] text-black/40">
            {site.companies.join(', ')}
          </p>
        </div>
      </section>

      <section className="mt-40 px-6">
        <h2 className="display-hero text-center [font-size:7vw]">Featured Work</h2>
        <p className="mt-2 text-center text-black/60">최근의 주요 프로젝트</p>

        <div className="mx-auto mt-16 grid max-w-6xl gap-20 sm:grid-cols-2">
          {featuredProjects.map((project, index) => (
            <ProjectCard key={project.slug} project={project} index={index} />
          ))}
        </div>
      </section>

      <section className="mt-40 px-6">
        <h2 className="display-hero text-center [font-size:7vw]">More Work</h2>
        <p className="mt-2 text-center text-black/60">그 외의 작업들</p>

        <div className="mx-auto mt-16 grid max-w-6xl gap-14 sm:grid-cols-3">
          {moreProjects.map((project, index) => (
            <ProjectCard key={project.slug} project={project} index={index} size="sm" />
          ))}
        </div>
      </section>

      <ContactSection />
    </>
  );
}
