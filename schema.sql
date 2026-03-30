-- Supabase SQL Schema for NearEats

-- 가게 테이블
CREATE TABLE stores (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 메뉴 테이블
CREATE TABLE menus (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  store_id UUID REFERENCES stores(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  price INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 별점 기록 테이블
CREATE TABLE ratings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  menu_id UUID REFERENCES menus(id) ON DELETE CASCADE,
  rating DECIMAL(2,1) NOT NULL,
  rated_at DATE DEFAULT CURRENT_DATE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 가게 별점 기록 테이블
CREATE TABLE store_ratings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  store_id UUID REFERENCES stores(id) ON DELETE CASCADE,
  rating DECIMAL(2,1) NOT NULL,
  rated_at DATE DEFAULT CURRENT_DATE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- RLS policies (모두 공개)
ALTER TABLE stores ENABLE ROW LEVEL SECURITY;
ALTER TABLE menus ENABLE ROW LEVEL SECURITY;
ALTER TABLE ratings ENABLE ROW LEVEL SECURITY;
ALTER TABLE store_ratings ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public access for stores" ON stores FOR SELECT USING (true);
CREATE POLICY "Public access for menus" ON menus FOR SELECT USING (true);
CREATE POLICY "Public access for ratings" ON ratings FOR SELECT USING (true);
CREATE POLICY "Public access for store_ratings" ON store_ratings FOR SELECT USING (true);

CREATE POLICY "Anyone can insert stores" ON stores FOR INSERT WITH CHECK (true);
CREATE POLICY "Anyone can update stores" ON stores FOR UPDATE USING (true);
CREATE POLICY "Anyone can delete stores" ON stores FOR DELETE USING (true);

CREATE POLICY "Anyone can insert menus" ON menus FOR INSERT WITH CHECK (true);
CREATE POLICY "Anyone can update menus" ON menus FOR UPDATE USING (true);
CREATE POLICY "Anyone can delete menus" ON menus FOR DELETE USING (true);

CREATE POLICY "Anyone can insert ratings" ON ratings FOR INSERT WITH CHECK (true);
CREATE POLICY "Anyone can delete ratings" ON ratings FOR DELETE USING (true);
CREATE POLICY "Anyone can insert store_ratings" ON store_ratings FOR INSERT WITH CHECK (true);
CREATE POLICY "Anyone can delete store_ratings" ON store_ratings FOR DELETE USING (true);
