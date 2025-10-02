BEGIN;

-- Idempotent update script for 2025 October evening menus (Manisa)
-- For each date: ensure a 'Akşam Yemeği' menu row exists, delete existing MenuItems for that menu and insert canonical items.
-- Kaynak: Kullanıcı tarafından sağlanan Ekim 2025 akşam menüsü tabloları (görseller). Düşük çözünürlük nedeniyle emin olunamayan kısımlar yorum satırında NOTA: ile işaretlendi.

-- Disable RLS if present (ignore errors if not supported)
ALTER TABLE public."Cities" DISABLE ROW LEVEL SECURITY;
ALTER TABLE public."Menus" DISABLE ROW LEVEL SECURITY;
ALTER TABLE public."MenuItems" DISABLE ROW LEVEL SECURITY;

-- Ensure city exists
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM public."Cities" WHERE "Name" = 'Manisa') THEN
        INSERT INTO public."Cities" ("Name") VALUES ('Manisa');
END IF;
END $$;

-- Helper: create or get menu id
CREATE OR REPLACE FUNCTION get_or_create_menu(p_date date, p_mealtype text) RETURNS integer AS $$
DECLARE
  m_id integer;
BEGIN
  SELECT "Id" INTO m_id FROM public."Menus" WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"=p_mealtype AND "Date"=p_date LIMIT 1;
  IF m_id IS NULL THEN
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    VALUES ((SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), p_mealtype, p_date, NULL)
    RETURNING "Id" INTO m_id;
  END IF;
  RETURN m_id;
END;
$$ LANGUAGE plpgsql;

-- Process each date: delete existing MenuItems and insert canonical ones
DO $$
DECLARE
  menu_id integer;
BEGIN
  -----------------------------------------------------------------------------
  -- 01 Oct 2025 Çarşamba
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-01'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Tarhana Çorbası','250 g'),
    (menu_id,'Çorba','Yayla Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tas Kebabı','90 g/250 g'), -- NOTA: gramaj tahmini (et/porsiyon)
    (menu_id,'Ana Yemek','İmambayıldı','200 g'),
    (menu_id,'Yan Yemek','Bulgur Pilavı','150 g'),
    (menu_id,'Salata','Ege Salata','150 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 02 Oct 2025 Perşembe
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-02'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
    (menu_id,'Çorba','Toyga Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tavuk Külbastı (Domates & Fırın Biber-Soğan ile)','200 g/150 g'), -- NOTA: eşleşme
    (menu_id,'Ana Yemek','Nohut Yemeği','200 g'),
    (menu_id,'Yan Yemek','Makarna (Sos/Yoğurt ile)','150 g'),
    (menu_id,'Tatlı','Supangle','150 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 03 Oct 2025 Cuma
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-03'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Sebze Çorbası','250 g'),
    (menu_id,'Çorba','Domates Çorbası','250 g'),
    (menu_id,'Ana Yemek','Sulu Köfte','60 g/250 g'), -- NOTA: 60g köfte + garnitür tahmini
    (menu_id,'Ana Yemek','Mücver (Yoğurt ile)','200 g'),
    (menu_id,'Yan Yemek','Şehriye Pilavı','150 g'),
    (menu_id,'Salata','Karışık Salata','100 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 04 Oct 2025 Cumartesi
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-04'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Yüksük Çorbası','250 g'),
    (menu_id,'Çorba','Mercimek Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tavuk Şiş (Elma Dilim Patates ile)','200 g/200 g'),
    (menu_id,'Ana Yemek','Bezelye Yemeği','200 g'),
    (menu_id,'Yan Yemek','Makarna (Sos/Yoğurt ile)','150 g'),
    (menu_id,'Tatlı','Yoğurt','120 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 05 Oct 2025 Pazar
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-05'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Tavuksuyu Çorba','250 g'),
    (menu_id,'Çorba','Mahluta Çorbası','250 g'),
    (menu_id,'Ana Yemek','Kuru Fasulye Yemeği','200 g'),
    (menu_id,'Ana Yemek','Karışık Sebze Graten','200 g'),
    (menu_id,'Yan Yemek','Şehriyeli Pirinç Pilavı','150 g'),
    (menu_id,'Tatlı','Cevizli Baklava','100 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 06 Oct 2025 Pazartesi
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-06'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Tarhana Çorbası','250 g'),
    (menu_id,'Çorba','Mercimek Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tavuk Çökertme','100 g/250 g'),
    (menu_id,'Ana Yemek','Taze Fasulye Yemeği','200 g'),
    (menu_id,'Yan Yemek','Bulgur Pilavı','150 g'),
    (menu_id,'Tatlı','Havuç Tarator','100 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 07 Oct 2025 Salı
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-07'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
    (menu_id,'Çorba','Şehriye Çorbası','250 g'),
    (menu_id,'Ana Yemek','Soslu Mitite Köfte','90 g/250 g'),
    (menu_id,'Ana Yemek','Karışık Dolma (Yoğurt ile)','180 g'),
    (menu_id,'Yan Yemek','Makarna (Sos/Yoğurt ile)','150 g'),
    (menu_id,'Tatlı','Meyveli Pasta','120 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 08 Oct 2025 Çarşamba
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-08'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Yayla Çorbası','250 g'),
    (menu_id,'Çorba','Domates Çorbası','250 g'),
    (menu_id,'Ana Yemek','Çoban Kavurma (Patates Kızartması ile)','90 g/250 g'),
    (menu_id,'Ana Yemek','Karışık Kızartma (Yoğurt/Sos ile)','200 g'),
    (menu_id,'Yan Yemek','Pirinç Pilavı','150 g'),
    (menu_id,'Salata','Kaşık Salata','150 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 09 Oct 2025 Perşembe
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-09'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Yüksük Çorbası','250 g'),
    (menu_id,'Çorba','Mercimek Çorbası','250 g'),
    (menu_id,'Ana Yemek','Köri Soslu Tavuk','200 g'),
    (menu_id,'Ana Yemek','Patates Yemeği','200 g'),
    (menu_id,'Yan Yemek','Spagetti (Sos/Yoğurt ile)','150 g'),
    (menu_id,'Salata','Yoğurtlu Kırmızı Koz Biber','100 g'), -- NOTA: metin doğrulanmalı
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 10 Oct 2025 Cuma
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-10'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Domates Çorbası','250 g'),
    (menu_id,'Çorba','Tavuksuyu Çorba','250 g'),
    (menu_id,'Ana Yemek','Nohut Yemeği','200 g'),
    (menu_id,'Ana Yemek','Mücver (Yoğurt ile)','200 g'),
    (menu_id,'Yan Yemek','Şehriye Pilavı','150 g'),
    (menu_id,'Tatlı','Haşhaşlı Revani','100 g'),
    (menu_id,'Ekstra','Karışık Turşu','80 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 11 Oct 2025 Cumartesi
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-11'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Tarhana Çorbası','250 g'),
    (menu_id,'Çorba','Sebze Çorbası','250 g'),
    (menu_id,'Ana Yemek','Adana Köfte (Domates & Fırın Biber-Soğan)','90 g/200 g'),
    (menu_id,'Ana Yemek','Mevsim Türlü (Patates, Patlıcan, Kabak, Biber)','200 g'),
    (menu_id,'Yan Yemek','Şehriye Pilavı','150 g'),
    (menu_id,'Tatlı','Haydari','100 g'),
    (menu_id,'Ekstra','Yoğurt','120 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 12 Oct 2025 Pazar
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-12'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
    (menu_id,'Çorba','Şehriye Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tavuk Kavurma (Patates Kızartması ile)','90 g/250 g'),
    (menu_id,'Ana Yemek','Karışık Dolma','200 g'),
    (menu_id,'Yan Yemek','Erişte','200 g'),
    (menu_id,'Tatlı','Yoğurt','120 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 13 Oct 2025 Pazartesi
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-13'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Mahluta Çorbası','250 g'),
    (menu_id,'Çorba','Yoğurt Çorbası','250 g'),
    (menu_id,'Ana Yemek','Hünkar Beğendi','90 g/250 g'),
    (menu_id,'Ana Yemek','Kuru Fasulye','200 g'),
    (menu_id,'Yan Yemek','Pirinç Pilavı','150 g'),
    (menu_id,'Tatlı','Damla Sakızlı Muhallebi','150 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 14 Oct 2025 Salı
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-14'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Mercimek Çorbası','250 g'),
    (menu_id,'Çorba','Yüksük Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tavuklu Orman Kebabı','90 g/250 g'),
    (menu_id,'Ana Yemek','Karışık Kızartma (Yoğurt/Sos ile)','200 g'),
    (menu_id,'Yan Yemek','Makarna (Sos/Yoğurt ile)','150 g'),
    (menu_id,'Salata','Havuç Aşerse Salata','100 g'), -- NOTA: yazı doğrulanmalı
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 15 Oct 2025 Çarşamba
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-15'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Domates Çorbası','250 g'),
    (menu_id,'Çorba','Sebze Çorbası','250 g'),
    (menu_id,'Ana Yemek','İzmir Köfte','90 g/250 g'),
    (menu_id,'Ana Yemek','Sebze Sote','200 g'),
    (menu_id,'Yan Yemek','Pirinç Pilavı','150 g'),
    (menu_id,'Tatlı','Bisküvili Pasta','120 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 16 Oct 2025 Perşembe
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-16'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
    (menu_id,'Çorba','Toyga Çorbası','250 g'),
    (menu_id,'Ana Yemek','Çıtır Tavuk (Patates Kızartması ile)','90 g/250 g'),
    (menu_id,'Ana Yemek','Bezelye Yemeği','200 g'),
    (menu_id,'Yan Yemek','Şehriye Pilavı','150 g'),
    (menu_id,'Tatlı','Kuru Cacık','100 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 17 Oct 2025 Cuma
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-17'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Sebze Çorbası','250 g'),
    (menu_id,'Çorba','Tarhana Çorbası','250 g'),
    (menu_id,'Ana Yemek','Izgara Köfte (Patates ile)','90 g/200 g'),
    (menu_id,'Ana Yemek','Lahana Sarması (Yoğurt ile)','200 g'),
    (menu_id,'Yan Yemek','Makarna (Sos/Yoğurt ile)','150 g'),
    (menu_id,'İçecek','Ayran','170 ml'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 18 Oct 2025 Cumartesi
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-18'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Mercimek Çorbası','250 g'),
    (menu_id,'Çorba','Domates Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tavuk Sote','200 g'),
    (menu_id,'Ana Yemek','Karışık Sebze Graten','200 g'),
    (menu_id,'Yan Yemek','Bulgur Pilavı','150 g'),
    (menu_id,'Salata','Çoban Salata','150 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 19 Oct 2025 Pazar
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-19'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Tavuksuyu Çorba','250 g'),
    (menu_id,'Çorba','Mahluta Çorbası','250 g'),
    (menu_id,'Ana Yemek','Kuru Fasulye Yemeği','200 g'),
    (menu_id,'Ana Yemek','Mücver (Yoğurt ile)','180 g'),
    (menu_id,'Yan Yemek','Şehriyeli Pirinç Pilavı','150 g'),
    (menu_id,'Tatlı','Cevizli Baklava','100 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 20 Oct 2025 Pazartesi
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-20'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
    (menu_id,'Çorba','Sebze Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tavuk Fajita','60 g/250 g'), -- NOTA: gram / toplam porsiyon tahmini
    (menu_id,'Ana Yemek','Patates Yemeği','200 g'),
    (menu_id,'Yan Yemek','Makarna (Sos/Yoğurt ile)','150 g'),
    (menu_id,'Ekstra','Cacık','100 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 21 Oct 2025 Salı
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-21'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Şehriye Çorbası','250 g'),
    (menu_id,'Çorba','Tarhana Çorbası','250 g'),
    (menu_id,'Ana Yemek','Barbunya Yemeği','200 g'),
    (menu_id,'Ana Yemek','(Alternatif) -- NOTA: Görselde ikinci ana yemek net değil',''),
    (menu_id,'Yan Yemek','Pirinç Pilavı','150 g'),
    (menu_id,'Tatlı','Haydari','100 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 22 Oct 2025 Çarşamba
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-22'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Köri Soslu Tavuk? (NOTA: Görsel belirsiz satır olabilir)',''), -- NOTA: kontrol gerekli
    (menu_id,'Çorba','Mercimek Çorbası','250 g'),
    (menu_id,'Ana Yemek','Karışık Kızartma (Yoğurt/Sos ile)','200 g'),
    (menu_id,'Ana Yemek','(Alternatif)',''),
    (menu_id,'Yan Yemek','Makarna (Sos/Yoğurt ile)','150 g'),
    (menu_id,'Salata','İçim Hindi? (NOTA: belirsiz)','100 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 23 Oct 2025 Perşembe
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-23'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
    (menu_id,'Çorba','Yoğurt Çorbası','250 g'),
    (menu_id,'Ana Yemek','Et Sote','200 g'),
    (menu_id,'Ana Yemek','Taze Fasulye Yemeği','200 g'),
    (menu_id,'Yan Yemek','Şehriyeli Pirinç Pilavı','150 g'),
    (menu_id,'Salata','Karışık Salata','100 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 24 Oct 2025 Cuma
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-24'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Yüksük Çorbası','250 g'),
    (menu_id,'Çorba','Yoğurt Çorbası','250 g'),
    (menu_id,'Ana Yemek','Çıtır Tavuk (Patates Kızartması ile)','90 g/250 g'),
    (menu_id,'Ana Yemek','Ispanak (Yemeği) Yoğurt','200 g'),
    (menu_id,'Yan Yemek','Sebzeli Bulgur Pilavı','200 g'),
    (menu_id,'Tatlı','Tulumba Tatlısı','100 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 25 Oct 2025 Cumartesi
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-25'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Sebze Çorbası','250 g'),
    (menu_id,'Çorba','Tavuksuyu Çorba','250 g'),
    (menu_id,'Ana Yemek','Nohut Yemeği','200 g'),
    (menu_id,'Ana Yemek','Mücver (Yoğurt ile)','200 g'),
    (menu_id,'Yan Yemek','Pirinç Pilavı','150 g'),
    (menu_id,'Salata','Çoban Salata','150 g'),
    (menu_id,'İçecek','Yoğurt','100 g'), -- NOTA: Görselde yoğurt satırı
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 26 Oct 2025 Pazar
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-26'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
    (menu_id,'Çorba','Yoğurt Çorbası','250 g'),
    (menu_id,'Ana Yemek','Ispanak Kebabı? (NOTA: belirsiz satır)','200 g'),
    (menu_id,'Ana Yemek','Sebze Graten','200 g'),
    (menu_id,'Yan Yemek','Makarna (Sos/Yoğurt ile)','150 g'),
    (menu_id,'Tatlı','Yoğurtlu Havuç Tarator','100 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 27 Oct 2025 Pazartesi
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-27'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Mercimek Çorbası','250 g'),
    (menu_id,'Çorba','Tarhana Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tavuk Kavurma (Patates Kızartması ile)','90 g/250 g'),
    (menu_id,'Ana Yemek','Dana Yahni? (NOTA: belirsiz)','200 g'),
    (menu_id,'Yan Yemek','Pirinç Pilavı','150 g'),
    (menu_id,'Tatlı','Islak Kek','120 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 28 Oct 2025 Salı
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-28'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Mahluta Çorbası','250 g'),
    (menu_id,'Çorba','Yoğurt Çorbası','250 g'),
    (menu_id,'Ana Yemek','Sulu Köfte','60 g/250 g'),
    (menu_id,'Ana Yemek','Karışık Dolma','200 g'),
    (menu_id,'Yan Yemek','Makarna (Sos/Yoğurt ile)','150 g'),
    (menu_id,'Tatlı','Kuru Cacık','100 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 29 Oct 2025 Çarşamba
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-29'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Domates Çorbası','250 g'),
    (menu_id,'Çorba','Yoğurt Çorbası','250 g'),
    (menu_id,'Ana Yemek','Öğretmen Kebap (NOTA: isim onayı)','90 g/250 g'),
    (menu_id,'Ana Yemek','Karışık Türlü (Patates, Patlıcan, Biber)','200 g'),
    (menu_id,'Yan Yemek','Pirinç Pilavı','150 g'),
    (menu_id,'Salata','Mevsim Salata','150 g'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 30 Oct 2025 Perşembe
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-30'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
    (menu_id,'Çorba','Yüksük Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tavuk Külbastı (Fırın Domates-Biber-Soğan)','90 g/200 g'),
    (menu_id,'Ana Yemek','Kuru Fasulye','200 g'),
    (menu_id,'Yan Yemek','Pirinç Pilavı','150 g'),
    (menu_id,'Tatlı','Ayran','170-200 ml'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

  -----------------------------------------------------------------------------
  -- 31 Oct 2025 Cuma
  -----------------------------------------------------------------------------
  menu_id := get_or_create_menu('2025-10-31'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" VALUES
    (menu_id,'Çorba','Şehriye Çorbası','250 g'),
    (menu_id,'Çorba','Mercimek Çorbası','250 g'),
    (menu_id,'Ana Yemek','Izgara Köfte (Izgara Köfte/Peynir?)','90 g/200 g'), -- NOTA: belirsiz ifade
    (menu_id,'Ana Yemek','Patates Yemeği','200 g'),
    (menu_id,'Yan Yemek','Makarna (Sos/Yoğurt ile)','150 g'),
    (menu_id,'Tatlı','Ayran','170-200 ml'),
    (menu_id,'İçecek','Su','500 ml'),
    (menu_id,'Ekmek','Çeyrek Ekmek','');

END $$;

-- Cleanup
DROP FUNCTION IF EXISTS get_or_create_menu(date,text);

COMMIT;

