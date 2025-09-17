BEGIN;

-- Idempotent update script for 2025 September evening menus (Manisa)
-- For each date: ensure a 'Akşam Yemeği' menu row exists, delete existing MenuItems for that menu and insert canonical items.

-- Disable RLS if present
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
  -- 15-30 September 2025 entries

  -- 15 Sep
  menu_id := get_or_create_menu('2025-09-15'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
    (menu_id,'Çorba','Domates Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tavuk Külbastı (Fırın Patates ile)','200 g/150 g'),
    (menu_id,'Ana Yemek','Köfte (alternatif)','180 g'),
    (menu_id,'Yan Yemek','Mevsim Türlü','200 g'),
    (menu_id,'Pirinç','Pirinç Pilavı','150 g'),
    (menu_id,'Tatlı','Haydari','100 g'),
    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

  -- 16 Sep
  menu_id := get_or_create_menu('2025-09-16'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Domates Çorbası','250 g'),
    (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tire Köfte (Pide+Dilim Domates Soslu)','200 g'),
    (menu_id,'Ana Yemek','Tavuk Izgara (alternatif)','180 g'),
    (menu_id,'Yan Yemek','Makarna (sos ile)','200 g'),
    (menu_id,'Pirinç','Pilav','150 g'),
    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

  -- 17 Sep
  menu_id := get_or_create_menu('2025-09-17'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Tavuksuyu Çorba','250 g'),
    (menu_id,'Çorba','Mercimek Çorbası','250 g'),
    (menu_id,'Ana Yemek','Mercimek Köfte','250 g'),
    (menu_id,'Ana Yemek','Etli Fasulye (alternatif)','180 g'),
    (menu_id,'Yan Yemek','Bulgur Pilavı','150 g'),
    (menu_id,'Salata','Karışık Salata','100 g'),
    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

  -- 18 Sep
  menu_id := get_or_create_menu('2025-09-18'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Tarhana Çorbası','250 g'),
    (menu_id,'Çorba','Sebze Çorba','250 g'),
    (menu_id,'Ana Yemek','Kuzu/Çitır Tavuk (Patates ile)','200 g/150 g'),
    (menu_id,'Yan Yemek','Sebze Sote','200 g'),
    (menu_id,'Pilav','Makarna','150 g'),
    (menu_id,'Tatlı','Damla Sakızlı Muhallebi','150 g'),
    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

  -- 19 Sep
  menu_id := get_or_create_menu('2025-09-19'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Salçalı Mercimek Çorba','250 g'),
    (menu_id,'Çorba','Şehriye Çorbası','250 g'),
    (menu_id,'Ana Yemek','İzmir Köfte','200 g'),
    (menu_id,'Ana Yemek','Taze Fasulye Yemeği','180 g'),
    (menu_id,'Yan Yemek','Pirinç Pilavı','150 g'),
    (menu_id,'Salata','Ege Salata','150 g'),
    (menu_id,'Tatlı','Kuru Cacık','100 g'),
    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

  -- 20 Sep
  menu_id := get_or_create_menu('2025-09-20'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Domates Çorbası','250 g'),
    (menu_id,'Çorba','Tarhana Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tavuk Kavurma (Pilav ile)','200 g/150 g'),
    (menu_id,'Ana Yemek','Karışık Kızartma','180 g'),
    (menu_id,'Yan Yemek','Spagetti ( SOS ile )','200 g'),
    (menu_id,'Tatlı','Yoğurt','200 g'),
    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

  -- 21 Sep
  menu_id := get_or_create_menu('2025-09-21'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Yüksük Çorba','250 g'),
    (menu_id,'Çorba','Mercimek Çorbası','250 g'),
    (menu_id,'Ana Yemek','Kurufasulye Yemeği','200 g'),
    (menu_id,'Ana Yemek','İmambayıldı','180 g'),
    (menu_id,'Yan Yemek','Pirinç Pilavı','150 g'),
    (menu_id,'Tatlı','Cevizli Baklava','100 g'),
    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

  -- 22 Sep
  menu_id := get_or_create_menu('2025-09-22'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
    (menu_id,'Çorba','Sebze Çorbası','250 g'),
    (menu_id,'Ana Yemek','Et Sote','200 g'),
    (menu_id,'Yan Yemek','Karışık Sebze Graten','200 g'),
    (menu_id,'Pilav','Sebzeli Bulgur Pilavı','200 g'),
    (menu_id,'Salata','Kaşık Salata','150 g'),
    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

  -- 23 Sep
  menu_id := get_or_create_menu('2025-09-23'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Salçalı Mercimek Çorbası','250 g'),
    (menu_id,'Çorba','Toyga Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tavuk Fajita','200 g'),
    (menu_id,'Yan Yemek','Garnitürlü Kabak Sandal','200 g'),
    (menu_id,'Pilav','Pirinç Pilavı','150 g'),
    (menu_id,'Salata','Piyaz','100 g'),
    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

  -- 24 Sep
  menu_id := get_or_create_menu('2025-09-24'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Şehriye Çorbası','250 g'),
    (menu_id,'Çorba','Yayla Çorbası','250 g'),
    (menu_id,'Ana Yemek','Izgara Köfte (Fırın Patates ile)','90 g/200 g'),
    (menu_id,'Yan Yemek','Patates Yemeği','200 g'),
    (menu_id,'Pilav','Makarna','150 g'),
    (menu_id,'Tatlı','Islak Kek','120 g'),
    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

  -- 25 Sep
  menu_id := get_or_create_menu('2025-09-25'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Mahluta Çorbası','250 g'),
    (menu_id,'Çorba','Tarhana Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tavuk Şiş','200 g'),
    (menu_id,'Ana Yemek','Sebze Sote','180 g'),
    (menu_id,'Yan Yemek','Bulgur Pilavı','150 g'),
    (menu_id,'Yan Yemek','Havuç Tarator','100 g'),
    (menu_id,'Ekstra','Yoğurt','120 g'),
    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

  -- 26 Sep
  menu_id := get_or_create_menu('2025-09-26'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Domates Çorbası','250 g'),
    (menu_id,'Çorba','Tavuksuyu Çorbası','250 g'),
    (menu_id,'Ana Yemek','Karışık Kızartma','180 g'),
    (menu_id,'Ana Yemek','Nohut Yemeği','200 g'),
    (menu_id,'Yan Yemek','Pirinç Pilavı','80 g'),
      (menu_id,'Tatlı','Revani','120 g'),
        (menu_id,'Ekstra','Turşu','120 g'),
    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

  -- 27 Sep
  menu_id := get_or_create_menu('2025-09-27'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
    (menu_id,'Çorba','Yayla Çorbası','250 g'),
    (menu_id,'Ana Yemek','Tavuk Çökertme','200 g'),
    (menu_id,'Ana Yemek','Mücver','150 g'),
    (menu_id,'Yan Yemek','Makarna','150 g'),
    (menu_id,'Ekstra','Cacık','80 g'),
    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

  -- 28 Sep
  menu_id := get_or_create_menu('2025-09-28'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Mercimek Çorbası','250 g'),
    (menu_id,'Çorba','Tarhana Çorbası','250 g'),
    (menu_id,'Ana Yemek','Soslu Mitite Köfte','200 g'),
    (menu_id,'Ana Yemek','Taze Fasulye Yemeği','200 g'),
    (menu_id,'Yan Yemek','Pirinç Pilavı','150 g'),
    (menu_id,'Tatlı','Üzüm','100 g'),
    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

  -- 29 Sep
  menu_id := get_or_create_menu('2025-09-29'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Domates Çorbası','250 g'),
    (menu_id,'Çorba','Eriştei Yeşil Mercimek Çorbası','250 g'),
    (menu_id,'Ana Yemek','Köri Soslu Tavuk','200 g'),
    (menu_id,'Ana Yemek','Kuru Fasulye Yemeği','200 g'),
    (menu_id,'Yan Yemek','Pirinç Pilavı','150 g'),
    (menu_id,'Tatlı','Haydari','100 g'),
    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

  -- 30 Sep
  menu_id := get_or_create_menu('2025-09-30'::date, 'Akşam Yemeği');
  DELETE FROM public."MenuItems" WHERE "MenuId" = menu_id;
  INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
    (menu_id,'Çorba','Salçalı Mercimek Çorbası','250 g'),
        (menu_id,'Çorba','Tavuk suyu Çorbası','250 g'),
    (menu_id,'Ana Yemek','Akçabat Köftesi','150 g'),
        (menu_id,'Ana Yemek','Karışık Dolma ( Yoğurt ile )','150 g'),
            (menu_id,'Yan Yemek','Makarna','150 g'),
                (menu_id,'İçecek','Ayran','200 ml'),

    (menu_id,'Ekmek','Çeyrek Ekmek',''),
    (menu_id,'İçecek','Su','500 ml');

END $$;

-- Cleanup
DROP FUNCTION IF EXISTS get_or_create_menu(date,text);

COMMIT;
