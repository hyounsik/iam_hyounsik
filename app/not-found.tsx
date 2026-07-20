import Link from 'next/link';

export default function NotFound() {
  return (
    <div className="mx-auto flex max-w-4xl flex-col items-center px-6 py-32 text-center">
      <h1 className="text-4xl font-bold">404</h1>
      <p className="mt-3 text-black/60">페이지를 찾을 수 없습니다.</p>
      <Link href="/" className="mt-6 text-sm font-medium underline underline-offset-4">
        홈으로 돌아가기
      </Link>
    </div>
  );
}
