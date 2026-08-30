import { ImageResponse } from 'next/og';

// 정적 export(output: 'export')에서는 아이콘 라우트를 빌드 시점에 생성해야 한다
export const dynamic = 'force-static';

export const size = { width: 32, height: 32 };
export const contentType = 'image/png';

export default function Icon() {
  return new ImageResponse(
    (
      <div
        style={{
          width: '100%',
          height: '100%',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          background: '#111318',
          color: '#fff',
          fontSize: 20,
          fontWeight: 700,
          borderRadius: 8,
        }}
      >
        H
      </div>
    ),
    size,
  );
}
