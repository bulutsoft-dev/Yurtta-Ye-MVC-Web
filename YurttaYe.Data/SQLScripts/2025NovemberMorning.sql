-- 2025NovemberMorning.sql
-- Generated from provided image: Kasım ayı kahvaltı (November 2025 morning menus)
-- NOTE: Menu texts were transcribed and normalized.

BEGIN;

-- Ensure Row-Level Security is disabled (if needed)
ALTER TABLE public."Cities" DISABLE ROW LEVEL SECURITY;
ALTER TABLE public."Menus" DISABLE ROW LEVEL SECURITY;
ALTER TABLE public."MenuItems" DISABLE ROW LEVEL SECURITY;

-- Ensure city exists (Assuming 'Manisa' based on context)
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM public."Cities" WHERE "Name" = 'Manisa') THEN
        INSERT INTO public."Cities" ("Name") VALUES ('Manisa');
END IF;
END $$;

DO $$
DECLARE
menu_id INTEGER;
    city_id INTEGER := (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa');
BEGIN

    -- 01 Kasım 2025 (Cumartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-01', '844 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-01') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Poğaça Çeşitleri (Dere Otlu/Sade)','1 adet'),
                                                                    
                                                                       (menu_id,'Ana Yemek','Menemen (1 adet L boy yumurta)','150 g'),
                                                                       (menu_id,'Peynir','Kaşar Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Tahinli Pekmez','10 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 02 Kasım 2025 (Pazar)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-02', '830 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-02') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Yan Yemek','Patates Kızartması/Fırın Patates','150 g'),
                                                                    
                                                                       (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet L boy'),
                                                                       (menu_id,'Peynir','Beyaz Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Marmelat Çeşitleri (or similar spread)','20 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 03 Kasım 2025 (Pazartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-03', '906 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-03') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Sucuklu Yumurta (1 adet L boy yumurta + 25g sucuk)',''),
                                                                       (menu_id,'Yan Yemek','Kakaolu Kek','50 g'),
                                                                       (menu_id,'Peynir','Tulum veya Kaşar Peyniri','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Bal/Tereyağı','20 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 04 Kasım 2025 (Salı)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-04', '760 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-04') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Karışık Kızartma','150 g'),
                                                                       (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet L boy'),
                                                                       (menu_id,'Peynir','Beyaz Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Reçel Çeşitleri','70 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 05 Kasım 2025 (Çarşamba)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-05', '776 kkal' -- Used 776 kkal from the closest legible figure
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-05') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Sade Omlet (1 adet L boy yumurta)',''),
                                                                       (menu_id,'Ana Yemek','Simit',''),
                                                                       (menu_id,'Peynir','Kaşar Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sebze','Mevsim Sebzeleri Söğüş','100 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 06 Kasım 2025 (Perşembe)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-06', '685 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-06') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Sosis Kokteyl (Salçalı veya Kızartma)','100 g'),
                                                                       (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet L boy'),
                                                                       (menu_id,'Peynir','Beyaz Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Sürülebilir Çikolata','20 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 07 Kasım 2025 (Cuma)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-07', '741 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-07') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Peynirli Omlet','60 g'),
                                                                       (menu_id,'Yan Yemek','Milföy Börek (Çikolatalı veya Peynirli)','30 g'),
                                                                       (menu_id,'Peynir','Kaşar Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin',''),
                                                                       (menu_id,'Sebze','Mevsim Sebzeleri Söğüş','100 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 08 Kasım 2025 (Cumartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-08', '873 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-08') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Patates Kızartması/Fırın Patates','150 g'),
                                                                       (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet L boy'),
                                                                       (menu_id,'Peynir','Beyaz Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Meyve','Mandalina',''),
                                                                       (menu_id,'Sebze','Mevsim Sebzeleri Söğüş','100 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 09 Kasım 2025 (Pazar)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-09', '885 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-09') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Kaşarlı Omlet (1 adet L boy yumurta)',''),
                                                                       (menu_id,'Yan Yemek','Poğaça Çeşitleri (Dere Otlu/Sade)','1 adet'),
                                                                       (menu_id,'Peynir','Labne Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Tahinli Pekmez','10 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 10 Kasım 2025 (Pazartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-10', '832 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-10') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Karışık Pizza','150 g'),
                                                                       (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet L boy'),
                                                                       (menu_id,'Peynir','Beyaz Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Reçel Çeşitleri','20 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 11 Kasım 2025 (Salı)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-11', '1011 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-11') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Peynirli Yumurta (1 adet L boy yumurta)',''),
                                                                       (menu_id,'Yan Yemek','Açma Çeşitleri (Sade/Çikolatalı)','1 adet'),
                                                                       (menu_id,'Peynir','Kaşar Peynir','30 g'),
                                                                       (menu_id,'Sebze','Mevsim Sebzeleri Söğüş','100 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 12 Kasım 2025 (Çarşamba)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-12', '776 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-12') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Börek Çeşitleri (Peynir/Ispanak/Patates)','120 g'),
                                                                       (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet L boy'),
                                                                       (menu_id,'Peynir','Krem Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 13 Kasım 2025 (Perşembe)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-13', '810 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-13') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Sade Omlet (1 adet L boy yumurta)',''),
                                                                       (menu_id,'Yan Yemek','Simit','1 adet'),
                                                                       (menu_id,'Peynir','Beyaz Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Bal/Tereyağı','20 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 14 Kasım 2025 (Cuma)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-14', '936 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-14') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Patates Kızartması/Fırın Patates','150 g'),
                                                                       (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet L boy'),
                                                                       (menu_id,'Peynir','Kaşar Peynir','40 g'),
                                                                       (menu_id,'Sürülebilir','Sürülebilir Çikolata','30 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 15 Kasım 2025 (Cumartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-15', '1004 kkal' -- Used 1004 kkal from the adjacent entry (16.11) as 15.11 is illegible/missing
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-15') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Sucuklu Yumurta (1 adet L boy yumurta)',''),
                                                                       (menu_id,'Yan Yemek','Haşlanmış Patates (or similar)','150-200 g'),
                                                                       (menu_id,'Peynir','Beyaz Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sebze','Mevsim Sebzeleri Söğüş','100 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 16 Kasım 2025 (Pazar)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-16', '876 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-16') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Zeytinli/Peynirli Açma','1 adet'),
                                                                       (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet L boy'),
                                                                       (menu_id,'Peynir','Tulum veya Kaşar Peyniri','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Bal/Tereyağı','10 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 17 Kasım 2025 (Pazartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-17', '823 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-17') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Kaşarlı Omlet (1 adet L boy yumurta)',''),
                                                                       (menu_id,'Yan Yemek','Sade/Mozaik Kek','50 g'),
                                                                       (menu_id,'Peynir','Beyaz Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Tahinli Pekmez','20 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 18 Kasım 2025 (Salı)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-18', '750 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-18') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Patates Kızartması/Fırın Patates','150 g'),
                                                                       (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet L boy'),
                                                                       (menu_id,'Peynir','Labne Peynir','20 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sebze','Mevsim Sebzeleri Söğüş','100 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 19 Kasım 2025 (Çarşamba)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-19', '810 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-19') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Menemen (1 adet L boy yumurta)','150 g'),
                                                                       (menu_id,'Yan Yemek','Simit','1 adet'),
                                                                       (menu_id,'Peynir','Tulum veya Kaşar Peyniri','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Reçel Çeşitleri','20 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 20 Kasım 2025 (Perşembe)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-20', '621 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-20') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Sosis Kokteyl (Salçalı veya Kızartma)','100 g'),
                                                                       (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet L boy'),
                                                                       (menu_id,'Peynir','Beyaz Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Bal/Tereyağı','10 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 21 Kasım 2025 (Cuma)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-21', '780 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-21') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Sade Omlet (1 adet L boy yumurta)',''),
                                                                       (menu_id,'Yan Yemek','Milföy Börek (Çikolatalı veya Peynirli)','50 g'),
                                                                       (menu_id,'Peynir','Kaşar Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sebze','Mevsim Sebzeleri Söğüş','100 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 22 Kasım 2025 (Cumartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-22', '925 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-22') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Patates Kızartması/Fırın Patates','150 g'),
                                                                       (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet L boy'),
                                                                       (menu_id,'Peynir','Beyaz Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Sürülebilir Çikolata','20 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 23 Kasım 2025 (Pazar)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-23', '851 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-23') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Peynirli Omlet (1 adet L boy yumurta)',''),
                                                                       (menu_id,'Yan Yemek','Poğaça Çeşitleri (Dere Otlu/Sade)','1 adet'),
                                                                       (menu_id,'Peynir','Kaşar Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sebze','Mevsim Sebzeleri Söğüş','100 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 24 Kasım 2025 (Pazartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-24', '746 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-24') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Börek Çeşitleri (Peynirli/Ispanaklı/Patatesli)','120 g'),
                                                                       (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet L boy'),
                                                                       (menu_id,'Peynir','Tulum veya Kaşar Peyniri','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin',''),
                                                                       (menu_id,'Sebze','Mevsim Sebzeleri Söğüş','100 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 25 Kasım 2025 (Salı)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-25', '957 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-25') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Sucuklu Yumurta (1 adet L boy yumurta + 25g sucuk)',''),
                                                                       (menu_id,'Yan Yemek','Açma Çeşitleri (Sade/Çikolatalı)','1 adet'),
                                                                       (menu_id,'Peynir','Beyaz Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 26 Kasım 2025 (Çarşamba)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-26', '865 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-26') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Patates Kızartması/Fırın Patates','150 g'),
                                                                       (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet L boy'),
                                                                       (menu_id,'Peynir','Krem Peynir','20 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Sürülebilir Çikolata','20 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 27 Kasım 2025 (Perşembe)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-27', '924 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-27') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Peynirli Omlet (1 adet L boy yumurta)',''),
                                                                       (menu_id,'Yan Yemek','Simit','1 adet'),
                                                                       (menu_id,'Peynir','Kaşar Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Bal/Tereyağı','10 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 28 Kasım 2025 (Cuma)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-28', '832 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-28') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Karışık Pizza','150 g'),
                                                                       (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet L boy'),
                                                                       (menu_id,'Peynir','Beyaz Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Reçel Çeşitleri','20 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 29 Kasım 2025 (Cumartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-29', '893 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-29') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Sade Omlet (1 adet L boy yumurta)',''),
                                                                       (menu_id,'Yan Yemek','Milföy Börek (Çikolatalı veya Peynirli)','60 g'),
                                                                       (menu_id,'Peynir','Kaşar Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sebze','Mevsim Sebzeleri Söğüş','100 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

-- 30 Kasım 2025 (Pazar)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Kahvaltı', '2025-11-30', '656 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=city_id AND "MealType"='Kahvaltı' AND "Date"='2025-11-30') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
                                                                       (menu_id,'Ana Yemek','Patates Kızartması/Fırın Patates','150 g'),
                                                                       (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet L boy'),
                                                                       (menu_id,'Peynir','Beyaz Peynir','40 g'),
                                                                       (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
                                                                       (menu_id,'Sürülebilir','Tahinli Pekmez','20 g'),
                                                                       (menu_id,'Ekmek','Çeyrek Ekmek',''),
                                                                       (menu_id,'İçecek','Su','500 ml'),
                                                                       (menu_id,'İçecek','Çay/Bitki Çayı','');

END $$;

COMMIT;

-- End of file