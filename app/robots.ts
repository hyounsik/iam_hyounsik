import type { MetadataRoute } from 'next';
import { site } from '@/lib/site';

// 정적 export에서는 빌드 시점에 생성해야 한다
export const dynamic = 'force-static';

export default function robots(): MetadataRoute.Robots {
  return {
    rules: {
      userAgent: '*',
      allow: '/',
    },
    sitemap: `${site.url}/sitemap.xml`,
    host: site.url,
  };
}
