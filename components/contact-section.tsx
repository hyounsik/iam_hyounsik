import { site } from '@/lib/site';

export function ContactSection() {
  return (
    <section id="contact" className="mt-32 bg-mute pt-40 pb-12">
      <p className="display-hero w-full px-2 text-center text-white [font-size:22vw]">
        CONTACT
      </p>
      <div className="mt-6 space-y-2 text-center text-xs uppercase tracking-[0.2em]">
        <a href={`mailto:${site.contact.email}`} className="block font-semibold hover:underline">
          {site.contact.email}
        </a>
        <a
          href={site.contact.github}
          target="_blank"
          rel="noreferrer"
          className="block font-semibold hover:underline"
        >
          GitHub
        </a>
        <a
          href={site.contact.medium}
          target="_blank"
          rel="noreferrer"
          className="block font-semibold hover:underline"
        >
          Medium
        </a>
        <p className="pt-6 text-[10px] tracking-[0.2em] text-white">
          ALL RIGHTS RESERVED {new Date().getFullYear()} {site.nameEn.toUpperCase()}
        </p>
      </div>
    </section>
  );
}
