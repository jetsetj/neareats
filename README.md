# 근처맛집

텍스트 기반 집 근처 맛집 평점 관리 사이트

## 시작하기

### 1. Supabase 설정

1. [Supabase](https://supabase.com)에서 프로젝트 생성
2. SQL Editor에서 `schema.sql` 실행
3. Settings → API에서 URL과 anon key 확인

### 2. env.js 설정 (1회)

`env.js.example`를 복사해서 `env.js`를 만들고, 값을 입력하세요.

```bash
cp env.js.example env.js
```

`env.js` 예시:

```js
window.env = {
  SUPABASE_URL: "https://YOUR_PROJECT.supabase.co",
  SUPABASE_ANON_KEY: "YOUR_ANON_KEY"
};
```

### 3. 로컬 실행

```bash
# 브라우저에서 열기
open index.html
# 또는
npx serve .
```

### 4. Vercel 배포

1. GitHub에 푸시
2. Vercel에서 Import
3. Environment Variables 추가:
   - `SUPABASE_URL`: Supabase URL
   - `SUPABASE_ANON_KEY`: Supabase anon key

## 기능

- 가게별 메뉴 관리
- 방문 시 별점 기록 (가중 평균)
- 가격 기록
- 검색 & 정렬 (가나다/별점순/방문순)
- 모바일 지원
