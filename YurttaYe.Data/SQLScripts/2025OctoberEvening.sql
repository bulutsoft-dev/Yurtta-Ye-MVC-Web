-- 2025OctoberEvening.sql
-- Generated from provided images: "Ekim Ayı Akşam Yemeği Menüsü" (October 2025 evening menus)
-- NOTE: Menu texts and gram values were transcribed from the images and normalized to simple text fields.
-- Please verify meal names/gram values against the original images before running in production.

BEGIN;

-- Ensure Row-Level Security is disabled (if needed)
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

-- Insert menus and menu items for October 2025 (Akşam Yemeği)
DO $$
DECLARE
    menu_id INTEGER;
BEGIN

    -- 01 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'), 'Akşam Yemeği', '2025-10-01', '980-1105 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-01'
    ) RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Tarhana Çorbası','250 g'),
        (menu_id,'Çorba','Yayla Çorbası','250 g'),
        (menu_id,'Ana Yemek','İmambayıldı','200 g'),
        (menu_id,'Ana Yemek','Tas Kebabı','200 g'),
        (menu_id,'Pilav','Bulgur Pilavı','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 02 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-02','1145-1285 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-02') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
        (menu_id,'Ana Yemek','Tavuk Köfteli Domates (Fırın/Biber)','200 g'),
        (menu_id,'Ana Yemek','Tavuk Külbastı (alternatif)','200 g'),
        (menu_id,'Yan Yemek','Makarna (sos/yoğurt ile)','200 g'),
        (menu_id,'Salata','Ege Salata','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 03 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-03','875-1145 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-03') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Sebze Çorbası','250 g'),
        (menu_id,'Çorba','Domates Çorbası','250 g'),
        (menu_id,'Ana Yemek','Sulu Köfte','200 g'),
        (menu_id,'Ana Yemek','Mücver (alternatif)','150 g'),
        (menu_id,'Pilav','Şehriyeli Pilav','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 04 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-04','955-1285 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-04') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Mercimek Çorbası','250 g'),
        (menu_id,'Ana Yemek','Tavuk Şiş (elma dilim patates ile)','200 g'),
        (menu_id,'Ana Yemek','Izgara Köfte (alternatif)','200 g'),
        (menu_id,'Yan Yemek','Bezelye Yemeği','200 g'),
        (menu_id,'Pilav','Makarna','120 g'),
        (menu_id,'Tatlı','Yoğurt','100 g'),
        (menu_id,'İçecek','Su','500 ml');

    -- 05 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-05','1165-1365 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-05') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Tavuksuyu Çorbası','250 g'),
        (menu_id,'Çorba','Mahlepli Çorba','200 g'),
        (menu_id,'Ana Yemek','Kuru Fasulye','200 g'),
        (menu_id,'Ana Yemek','Tavuk Kavurma (alternatif)','200 g'),
        (menu_id,'Pilav','Şehriyeli Pilav','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 06 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-06','905-1210 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-06') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Tarhana Çorbası','250 g'),
        (menu_id,'Çorba','Mercimek Çorbası','250 g'),
        (menu_id,'Ana Yemek','Tavuk Çökertme','200 g'),
        (menu_id,'Ana Yemek','Köfte (alternatif)','200 g'),
        (menu_id,'Pilav','Bulgur Pilavı','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 07 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-07','1155-1230 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-07') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
        (menu_id,'Çorba','Şehriye Çorbası','250 g'),
        (menu_id,'Ana Yemek','Soslu Mıtte Köfte','200 g'),
        (menu_id,'Ana Yemek','Sulu Köfte (alternatif)','200 g'),
        (menu_id,'Yan Yemek','Havuç Tarator','100 g'),
        (menu_id,'Tatlı','Meyveli Pasta','120 g'),
        (menu_id,'İçecek','Su','500 ml');

    -- 08 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-08','970-1140 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-08') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Yayla Çorbası','250 g'),
        (menu_id,'Çorba','Domates Çorbası','250 g'),
        (menu_id,'Ana Yemek','Çoban Kavurma (patates kızartması ile)','200 g'),
        (menu_id,'Ana Yemek','Kuzu/Et (alternatif)','200 g'),
        (menu_id,'Pilav','Pirinç Pilavı','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 09 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-09','1115-1285 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-09') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Mercimek Çorbası','250 g'),
        (menu_id,'Ana Yemek','Köri Soslu Tavuk','200 g'),
        (menu_id,'Ana Yemek','Nohut Yemeği (alternatif)','200 g'),
        (menu_id,'Yan Yemek','Pirinç (ya da makarna)','150 g'),
        (menu_id,'Yan Yemek','Yoğurtlu Kabak','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 10 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-10','1115-1280 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-10') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Domates Çorbası','250 g'),
        (menu_id,'Ana Yemek','Tavuk Sote','200 g'),
        (menu_id,'Ana Yemek','Mücver (alternatif)','150 g'),
        (menu_id,'Pilav','Şehriyeli Pilav','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 11 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-11','870-990 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-11') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Tarhana Çorbası','250 g'),
        (menu_id,'Ana Yemek','Akçabat Köfte','200 g'),
        (menu_id,'Ana Yemek','Mevsim Türlü (ikincil)','200 g'),
        (menu_id,'Yan Yemek','Mevsim Türlü','200 g'),
        (menu_id,'Pilav','Pirinç Pilavı','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 12 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-12','995-1065 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-12') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
        (menu_id,'Ana Yemek','Tavuk Kavurma (patates kızartması ile)','200 g'),
        (menu_id,'Ana Yemek','Akçabat Köfte (alternatif)','200 g'),
        (menu_id,'Yan Yemek','Karışık Sebze Graten','200 g'),
        (menu_id,'Pilav','Şehriyeli Pilav','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 13 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-13','940-1220 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-13') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Mahlepli Çorba','250 g'),
        (menu_id,'Çorba','Yoğurt Çorbası','250 g'),
        (menu_id,'Ana Yemek','Hünkar Beğendi','200 g'),
        (menu_id,'Ana Yemek','Kuru Fasulye (alternatif)','200 g'),
        (menu_id,'Pilav','Pirinç Pilavı','200 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 14 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-14','1035-1190 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-14') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Mercimek Çorbası','250 g'),
        (menu_id,'Ana Yemek','Tavuklu Orman Kebabı','200 g'),
        (menu_id,'Ana Yemek','Kuru Fasulye (alternatif)','200 g'),
        (menu_id,'Yan Yemek','Kuru Fasulye','200 g'),
        (menu_id,'Pilav','Pirinç Pilavı','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 15 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-15','1015-1335 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-15') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Sebze Çorbası','250 g'),
        (menu_id,'Ana Yemek','İzmir Köfte','200 g'),
        (menu_id,'Ana Yemek','Sebze Sote (ikincil)','150 g'),
        (menu_id,'Yan Yemek','Sebze Sote','150 g'),
        (menu_id,'Pilav','Pirinç Pilavı','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 16 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-16','920-1245 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-16') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
        (menu_id,'Çorba','Yoğurt Çorbası','250 g'),
        (menu_id,'Ana Yemek','Izgara Köfte','200 g'),
        (menu_id,'Ana Yemek','Bezeleyemegi (alternatif)','200 g'),
        (menu_id,'Pilav','Sebzeli Bulgur Pilavı','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 17 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-17','915-1280 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-17') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Sebze Çorbası','250 g'),
        (menu_id,'Ana Yemek','Izgara Köfte / Patates','200 g'),
        (menu_id,'Ana Yemek','Spagetti (ana alternatif)','150 g'),
        (menu_id,'Yan Yemek','Spagetti (sos/yoğurt ile)','150 g'),
        (menu_id,'Tatlı','Cevizli Baklava','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 18 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-18','1025-1065 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-18') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Domates Çorbası','250 g'),
        (menu_id,'Ana Yemek','Tavuk Sote','200 g'),
        (menu_id,'Ana Yemek','Karışık Sebze Graten (ikincil)','200 g'),
        (menu_id,'Yan Yemek','Karışık Sebze Graten','200 g'),
        (menu_id,'Pilav','Bulgur Pilavı','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 19 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-19','1060-1245 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-19') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Yayla Çorbası','250 g'),
        (menu_id,'Çorba','Tavuksuyu Çorbası','250 g'),
        (menu_id,'Ana Yemek','Kuru Fasulye','200 g'),
        (menu_id,'Ana Yemek','Mücver (alternatif)','150 g'),
        (menu_id,'Yan Yemek','Mücver (yoğurt ile)','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 20 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-20','1020-1143 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-20') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
        (menu_id,'Çorba','Sebze Çorbası','250 g'),
        (menu_id,'Ana Yemek','Tavuk Fajita','200 g'),
        (menu_id,'Ana Yemek','Patates Yemeği (ikincil)','150 g'),
        (menu_id,'Yan Yemek','Patates Yemeği','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 21 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-21','908-930 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-21') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Şehriye Çorbası','250 g'),
        (menu_id,'Çorba','Tarhana Çorbası','250 g'),
        (menu_id,'Ana Yemek','Karnıyarık','200 g'),
        (menu_id,'Ana Yemek','Pirinç Pilavı (ikincil)','150 g'),
        (menu_id,'Pilav','Pirinç Pilavı','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 22 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-22','1226-1307 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-22') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Mahlepli Çorba','250 g'),
        (menu_id,'Çorba','Mercimek Çorbası','250 g'),
        (menu_id,'Ana Yemek','Köri Soslu Tavuk','200 g'),
        (menu_id,'Ana Yemek','Tas Kebabı (ikincil)','200 g'),
        (menu_id,'Pilav','Şehriyeli Pilav','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 23 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-23','860-1030 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-23') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Domates Çorbası','250 g'),
        (menu_id,'Çorba','Yoğurt Çorbası','250 g'),
        (menu_id,'Ana Yemek','Tas Kebabı','200 g'),
        (menu_id,'Ana Yemek','Sebzeli Bulgur Pilavı (ikincil)','150 g'),
        (menu_id,'Pilav','Sebzeli Bulgur Pilavı','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 24 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-24','1006-1565 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-24') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Yayla Çorbası','250 g'),
        (menu_id,'Çorba','Yüksük Çorbası','250 g'),
        (menu_id,'Ana Yemek','Izgara Köfte/Patates','200 g'),
        (menu_id,'Ana Yemek','Sebzeli Bulgur Pilavı (ikincil)','150 g'),
        (menu_id,'Pilav','Şehriyeli Pilav','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 25 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-25','935-1214 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-25') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Sebze Çorbası','250 g'),
        (menu_id,'Çorba','Tavuksuyu Çorbası','250 g'),
        (menu_id,'Ana Yemek','Tavuksuyu (et/alternatif)','250 g'),
        (menu_id,'Ana Yemek','Tavuklu Makarna (ikincil)','200 g'),
        (menu_id,'Yan Yemek','Çoban Salata','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 26 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-26','1005-1245 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-26') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
        (menu_id,'Çorba','Yoğurt Çorbası','250 g'),
        (menu_id,'Ana Yemek','Manisa Kebabı','200 g'),
        (menu_id,'Ana Yemek','Sebze Graten (ikincil)','200 g'),
        (menu_id,'Yan Yemek','Sebze Graten','200 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 27 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-27','1157-1134 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-27') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Mercimek Çorbası','250 g'),
        (menu_id,'Ana Yemek','Tavuk Kavurma','200 g'),
        (menu_id,'Ana Yemek','Pirinç Pilavı (ikincil)','150 g'),
        (menu_id,'Yan Yemek','Pirinç Pilavı','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 28 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-28','1062-1142 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-28') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Mahlepli Çorba','250 g'),
        (menu_id,'Ana Yemek','Toğa Çorbası / Tavuklu alternatif','250 g'),
        (menu_id,'Ana Yemek','Sulu Köfte (ikincil)','200 g'),
        (menu_id,'Yan Yemek','Sulu Köfte','200 g'),
        (menu_id,'Yan Yemek','Kuru Fasulye','200 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 29 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-29','1080-1297 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-29') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Domates Çorbası','250 g'),
        (menu_id,'Ana Yemek','Çökertme Kebap','250 g'),
        (menu_id,'Ana Yemek','Kuru Fasulye (ikincil)','200 g'),
        (menu_id,'Yan Yemek','Sebzeli Bulgur Pilavı','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 30 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-30','880-1090 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-30') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Ezogelin Çorbası','250 g'),
        (menu_id,'Ana Yemek','Tavuk Külbastı (Fırın Patates ile)','200 g'),
        (menu_id,'Ana Yemek','Patates Yemeği (ikincil)','150 g'),
        (menu_id,'Yan Yemek','Patates Yemeği','150 g'),
        (menu_id,'Pilav','Pirinç Pilavı','150 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

    -- 31 Ekim 2025
    INSERT INTO public."Menus" ("CityId","MealType","Date","Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'),'Akşam Yemeği','2025-10-31','880-1180 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Akşam Yemeği' AND "Date"='2025-10-31') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Çorba','Şehriye Çorbası','250 g'),
        (menu_id,'Ana Yemek','Izgara Köfte / Patates','200 g'),
        (menu_id,'Ana Yemek','Makarna (ikincil)','150 g'),
        (menu_id,'Yan Yemek','Makarna (sos/yoğurt ile)','150 g'),
        (menu_id,'Tatlı','Haydari','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml');

END $$;

COMMIT;

-- End of file
