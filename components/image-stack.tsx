import Image from 'next/image';

export type StackItem = {
  src: string;
  alt: string;
};

export type StackSize = 'sm' | 'md' | 'lg';

/**
 * 카드 한 장의 기본 폭. flex 안에서 축소는 허용하므로(shrink 기본값),
 * 장수가 많아지면 자연스럽게 좁아진다.
 */
const CARD_WIDTH: Record<StackSize, string> = {
  sm: 'basis-20 sm:basis-24',
  md: 'basis-28 sm:basis-36',
  lg: 'basis-36 sm:basis-48',
};

/** 카드끼리 겹치는 정도 */
const OVERLAP: Record<StackSize, string> = {
  sm: '-ml-4',
  md: '-ml-6',
  lg: '-ml-8',
};

const RADIUS: Record<StackSize, string> = {
  sm: 'rounded-xl',
  md: 'rounded-2xl',
  lg: 'rounded-2xl',
};

/**
 * 기울기 패턴. Tailwind가 빌드 시점에 수집할 수 있도록 리터럴 클래스로 둔다
 * (문자열을 조합해 만들면 purge 대상이 되어 스타일이 사라진다).
 */
const TILTS = ['-rotate-6', 'rotate-3', '-rotate-3', 'rotate-6', '-rotate-2', 'rotate-5'];

type ImageStackProps = {
  /** `as const`로 선언된 배열도 받을 수 있도록 readonly로 둔다 */
  items: readonly StackItem[];
  /** 카드 크기. 저해상도 이미지는 sm/md로 작게 노출하면 열화가 덜 보인다 */
  size?: StackSize;
  /** 각 카드를 정사각형으로 자를지 여부. false면 원본 비율 유지 */
  square?: boolean;
  className?: string;
};

/**
 * 기울어진 카드가 서로 겹쳐 쌓인 이미지 스택.
 * 장수는 가변이며, 홈 히어로와 프로젝트 상세 양쪽에서 사용한다.
 */
export function ImageStack({ items, size = 'lg', square = true, className = '' }: ImageStackProps) {
  if (items.length === 0) return null;

  return (
    <div className={`flex items-center justify-center ${className}`}>
      {items.map((item, index) => (
        <div
          key={`${item.src}-${index}`}
          className={[
            TILTS[index % TILTS.length],
            index > 0 ? OVERLAP[size] : '',
            CARD_WIDTH[size],
            RADIUS[size],
            'min-w-0 overflow-hidden bg-shell shadow-xl shadow-black/10',
          ]
            .filter(Boolean)
            .join(' ')}
        >
          <Image
            src={item.src}
            alt={item.alt}
            width={800}
            height={600}
            className={`w-full object-cover ${square ? 'aspect-square' : ''}`}
          />
        </div>
      ))}
    </div>
  );
}
