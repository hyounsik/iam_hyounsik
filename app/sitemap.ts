import type { MetadataRoute } from 'next';
import { projects } from '@/lib/projects';
import { site } from '@/lib/site';

// 정적 export에서는 빌드 시점에 생성해야 한다
export const dynamic = 'force-static';

/** 빌드 시점을 갱신일로 삼는다 (프로젝트별 수정일을 따로 관리하지 않음) */
export default function sitemap(): MetadataRoute.Sitemap {
  const lastModified = new Date();

  return [
    {
      url: site.url,
      lastModified,
      changeFrequency: 'monthly',
      priority: 1,
    },
    ...projects.map((project) => ({
      url: `${site.url}/projects/${project.slug}`,
      lastModified,
      changeFrequency: 'monthly' as const,
      priority: 0.8,
    })),
  ];
}
