import Image from 'next/image';
import { careers } from '@/lib/careers';
import { CareerCard } from '@/components/career-card';

export default function HomePage() {
  return (
    <div className="mx-auto max-w-4xl px-6 py-16">
      <section className="flex flex-col-reverse items-center gap-10 sm:flex-row sm:items-start sm:justify-between">
        <div>
          <p className="text-sm font-medium text-black/50">Software Engineer</p>
          <h1 className="mt-2 text-4xl font-bold tracking-tight sm:text-5xl">
            이현식
            <span className="block text-2xl font-medium text-black/60 sm:text-3xl">
              Lee Hyoun Sik
            </span>
          </h1>
          <p className="mt-6 max-w-md text-black/60">
            2010년부터 iOS, Flutter, 백엔드를 넘나들며 서비스를 처음부터
            끝까지 만들어왔습니다. 아는 기술보다 요구에 맞는 기술을 찾아
            적용하는 것을 선호합니다.
          </p>
        </div>
        <Image
          src="https://image.hyounsik.info/hyounsik/hyounsik.png"
          alt="Lee Hyoun Sik"
          width={160}
          height={160}
          className="h-40 w-40 shrink-0 rounded-2xl object-cover shadow-lg shadow-black/10"
        />
      </section>

      <section className="mt-16">
        <h2 className="text-sm font-semibold uppercase tracking-wide text-black/40">
          Career
        </h2>
        <div className="mt-4 grid gap-4">
          {careers.map((career) => (
            <CareerCard key={career.slug} career={career} />
          ))}
        </div>
      </section>
    </div>
  );
}
