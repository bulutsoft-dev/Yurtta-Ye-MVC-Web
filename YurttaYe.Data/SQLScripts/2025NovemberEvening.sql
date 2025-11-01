-- 2025NovemberDinner.sql
-- Generated from provided PDF: Kasım ayı akşam yemeği (November 2025 dinner menus)
-- NOTE: Menu texts were transcribed and normalized to project standards, assuming 'Manisa'.

BEGIN;

-- Ensure Row-Level Security is disabled (if needed)
ALTER TABLE public."Cities" DISABLE ROW LEVEL SECURITY;
ALTER TABLE public."Menus" DISABLE ROW LEVEL SECURITY;
ALTER TABLE public."MenuItems" DISABLE ROW LEVEL SECURITY;

-- Insert City (Manisa) if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM public."Cities" WHERE "Name" = 'Manisa') THEN
        INSERT INTO public."Cities" ("Name") VALUES ('Manisa');
END IF;
END $$;

-- Declare a variable to hold the Menu Id
DO $$
DECLARE
menu_id INTEGER;
    city_id INTEGER := (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa');
BEGIN

    -- 01 Kasım 2025 (Cumartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-01', '979-1232 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-01')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'YAYLA ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'ÇITIR TAVUK (PATATES KIZARTMASI İLE)', '100 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'İMAMBAYILDI', '200 g'),
    (menu_id, 'Yan Yemek', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (menu_id, 'Ekstra', 'KARIŞIK SALATA', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 02 Kasım 2025 (Pazar)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-02', '1225-1339 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-02')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'DOMATES ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'NOHUT YEMEĞİ', '200 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARNABAHAR KIZARTMASI (YOĞURT İLE)', '200 g + 20g Yoğurt'),
    (menu_id, 'Yan Yemek', 'ŞEHRİYELİ PİRİNÇ PILAVI', '150 g'),
    (menu_id, 'Ekstra', 'CEVİZLİ KADAYIF', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 03 Kasım 2025 (Pazartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-03', '1004-1148 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-03')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'SEBZE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK TANTUNİ (LAVAŞ, SOĞAN, DOMATES İLE)', '100 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK DOLMA (YOĞURT İLE)', '200 g + 20 g Yoğurt'),
    (menu_id, 'Yan Yemek', 'MAKARNA (SOS İLE)', '200 g'),
    (menu_id, 'Ekstra', 'HAVUÇ TARATOR', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 04 Kasım 2025 (Salı)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-04', '1133-1247 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-04')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'EZOGELİN ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'ŞEHRİYE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'İZMİR KÖFTE', '60 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'BARBUNYA YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'KARIŞIK SALATA', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 05 Kasım 2025 (Çarşamba)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-05', '899-1167 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-05')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'YÜKSÜK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'MAHLUTA ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'KÖRİ SOSLU TAVUK', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'MÜCVER (YOĞURT İLE)', '200 g + 20 g Yoğurt'),
    (menu_id, 'Yan Yemek', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (menu_id, 'Ekstra', 'AYSBERG SALATA', '50 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 06 Kasım 2025 (Perşembe)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-06', '863-958 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-06')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'IZGARA KÖFTE (PİYAZ/DOMATES, BİBER, SOĞAN İLE)', '90 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'BEZELYE YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA (SOS/YOĞURT İLE)', '200 g'),
    (menu_id, 'Ekstra', 'HAYDARİ', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 07 Kasım 2025 (Cuma)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-07', '1031-1236 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-07')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'DOMATES ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'KURU FASULYE', '200 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK KIZARTMA (SOS/YOĞURT İLE)', '200 g + 20 g Yoğurt'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'KEMALPAŞA TATLISI', '100 g'),
    (menu_id, 'Ekstra', 'KARIŞIK TURŞU', '80 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 08 Kasım 2025 (Cumartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-08', '889-973 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-08')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MAHLUTA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'YAYLA ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'KUŞBAŞILI PATLICAN KEBABI', '90 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'KABAK KALYE', '200 g'),
    (menu_id, 'Yan Yemek', 'BULGUR PİLAVI', '200 g'),
    (menu_id, 'Ekstra', 'ÇOBAN SALATA', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 09 Kasım 2025 (Pazar)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-09', '1117-1325 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-09')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'SALÇALI ŞEHRİYE ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK FAJITA', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'ISPANAK YEMEĞİ / ISPANAK GRATEN (YOĞURT İLE)', '200 g + 20 g Yoğurt'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'CEVİZLİ BAKLAVA', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 10 Kasım 2025 (Pazartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-10', '905-1219 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-10')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'PATATES OTURTMA', '60 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'TAZE FASULYE YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (menu_id, 'Ekstra', 'HAVUÇ TARATOR', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 11 Kasım 2025 (Salı)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-11', '953-1229 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-11')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'DOMATES ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'SEBZE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'KÜP PİLİÇ LOKUM (KÜP PATATES İLE)', '100 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'NOHUT YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'SUPANGLE', '150 g'),
    (menu_id, 'Ekstra', 'KARIŞIK SALATA', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 12 Kasım 2025 (Çarşamba)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-12', '985-1040 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-12')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'ŞEHRİYE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'MANİSA KEBABI (PİDE-DOMATES SOS+BİBER İLE)', '90 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'LAHANA SARMASI (YOĞURT İLE)', '200 g + 20 g Yoğurt'),
    (menu_id, 'Yan Yemek', 'MAKARNA (SOS İLE)', '200 g'),
    (menu_id, 'Ekstra', 'AYRAN', '170-200 ml'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 13 Kasım 2025 (Perşembe)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-13', '1152-1216 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-13')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'YOĞURT ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'EZOGELİN ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK SOTE', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'MEVSİM TÜRLÜ (PATATES, PATLICAN, KABAK, BİBER İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'ŞEHRİYELİ PİRİNÇ PILAVI', '150 g'),
    (menu_id, 'Ekstra', 'HAŞHAŞLI REVANİ', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 14 Kasım 2025 (Cuma)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-14', '1024-1215 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-14')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'YAYLA ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'ÇOBAN KAVURMA', '90 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'MÜCVER (YOĞURT İLE)', '200 g + 20 g Yoğurt'),
    (menu_id, 'Yan Yemek', 'SEBZELİ BULGUR PILAVI', '200 g'),
    (menu_id, 'Ekstra', 'YOĞURTLU RUS SALATASI', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 15 Kasım 2025 (Cumartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-15', '912-1080 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-15')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'SALÇALI ŞEHRİYE ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'TOYGA ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK TANTUNİ (LAVAŞ, DOMATES, SOĞAN İLE)', '100 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'İMAMBAYILDI', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA (SOS/YOĞURT İLE)', '200 g'),
    (menu_id, 'Ekstra', 'YOĞURT', '120 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');


-- 16 Kasım 2025 (Pazar) - NOTE: Data is missing in this image, using data from previous PDF source.
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT city_id, 'Akşam Yemeği', '2025-11-16', '1117-1325 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-16')
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'SEBZE ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'EZOGELİN ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'KURU FASULYE YEMEĞİ', '200 g'),
    (menu_id, 'Ana Yemek (%20)', 'ÇITIR KARNABAHAR (YOĞURT İLE)', '200 g + 20 g Yoğurt'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'CEVİZLİ BAKLAVA', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');


-- ** VERİLER BU KISIMDAN SONRA GÖRSELİN ÜST SIRASINDAN ALINMIŞTIR **

-- 17 Kasım 2025 (Pazartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT city_id, 'Akşam Yemeği', '2025-11-17', '1010-1171 kkal' 
                WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-17')
                    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g') ,
        (menu_id, 'Çorba', 'DOMATES ÇORBASI', '250 g') ,
        (menu_id, 'Ana Yemek (%80)', 'TAVUK KÜLBASTI (FIRIN BİBER, DOMATES, SOĞAN İLE)', '100 g/200 g'),
        (menu_id, 'Ana Yemek (%20)', 'KARIŞIK DOLMA (YOĞURT İLE)', '200 g + 20 g Yoğurt'),
        (menu_id, 'Yan Yemek', 'MAKARNA (SOS İLE)', '200 g'),
        (menu_id, 'Ekstra', 'YOĞURTLU MOR LAHANA SALATASI', '100 g') ,
        (menu_id, 'Ekstra', 'Su', '500 ml') ,
        (menu_id, 'Ekmek', 'Çeyrek Ekmek', '') ;

-- 18 Kasım 2025 (Salı)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT city_id, 'Akşam Yemeği', '2025-11-18', '1069-1320 kkal' 
                WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-18')
                    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'YAYLA ÇORBASI', '250 g') ,
        (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g') ,
        (menu_id, 'Ana Yemek (%80)', 'HÜNKAR BEĞENDİ', '90 g/250 g'),
        (menu_id, 'Ana Yemek (%20)', 'KURU FASULYE YEMEĞİ', '200 g'),
        (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g') ,
        (menu_id, 'Ekstra', 'TRİLİÇE', '150 g') ,
        (menu_id, 'Ekstra', 'Su', '500 ml') ,
        (menu_id, 'Ekmek', 'Çeyrek Ekmek', '') ;

-- 19 Kasım 2025 (Çarşamba)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT city_id, 'Akşam Yemeği', '2025-11-19', '1013-1267 kkal' 
                WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-19')
                    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'EZOGELİN ÇORBASI', '250 g') ,
        (menu_id, 'Çorba', 'TOYGA ÇORBASI', '250 g') ,
        (menu_id, 'Ana Yemek (%80)', 'TAVUKLU SULTAN KEBABI', '100 g/250 g'),
        (menu_id, 'Ana Yemek (%20)', 'KARIŞIK SEBZE GRATEN', '200 g'),
        (menu_id, 'Yan Yemek', 'ŞEHRİYE PİLAVI', '150 g') ,
        (menu_id, 'Ekstra', 'AKDENİZ SALATA', '100 g') ,
        (menu_id, 'Ekstra', 'Su', '500 ml') ,
        (menu_id, 'Ekmek', 'Çeyrek Ekmek', '') ;

-- 20 Kasım 2025 (Perşembe)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT city_id, 'Akşam Yemeği', '2025-11-20', '996-1317 kkal' 
                WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-20')
                    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'ŞEHRİYE ÇORBASI', '250 g') ,
        (menu_id, 'Çorba', 'YÜKSÜK ÇORBASI', '250 g') ,
        (menu_id, 'Ana Yemek (%80)', 'SULU KÖFTE', '60 g/250 g'),
        (menu_id, 'Ana Yemek (%20)', 'SEBZE KIZARTMASI (SOS İLE)', '200 g'),
        (menu_id, 'Yan Yemek', 'BULGUR PILAVI', '200 g') ,
        (menu_id, 'Ekstra', 'KURU CACIK', '100 g') ,
        (menu_id, 'Ekstra', 'Su', '500 ml') ,
        (menu_id, 'Ekmek', 'Çeyrek Ekmek', '') ;

-- 21 Kasım 2025 (Cuma)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT city_id, 'Akşam Yemeği', '2025-11-21', '1025-1240 kkal' 
                WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-21')
                    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'SEBZE ÇORBASI', '250 g') ,
        (menu_id, 'Çorba', 'DOMATES ÇORBASI', '250 g') ,
        (menu_id, 'Ana Yemek (%80)', 'TAVUK FAJITA', '100 g/250 g'),
        (menu_id, 'Ana Yemek (%20)', 'ISPANAK YEMEĞİ / ISPANAK GRATEN (YOĞURT İLE)', '200 g + 20 g Yoğurt'),
        (menu_id, 'Yan Yemek', 'MAKARNA (SOS/YOĞURT İLE)', '200 g'),
        (menu_id, 'Ekstra', 'TULUMBA TATLISI', '100 g') ,
        (menu_id, 'Ekstra', 'Su', '500 ml') ,
        (menu_id, 'Ekmek', 'Çeyrek Ekmek', '') ;

-- 22 Kasım 2025 (Cumartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT city_id, 'Akşam Yemeği', '2025-11-22', '956-1189 kkal' 
                WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-22')
                    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBASI', '250 g') ,
        (menu_id, 'Çorba', 'MAHLUTA ÇORBASI', '250 g') ,
        (menu_id, 'Ana Yemek (%80)', 'NOHUT YEMEĞİ', '200 g'),
        (menu_id, 'Ana Yemek (%20)', 'MÜCVER (YOĞURT İLE)', '200 g + 20 g Yoğurt'),
        (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g') ,
        (menu_id, 'Ekstra', 'EGE SALATA', '150 g') ,
        (menu_id, 'Ekstra', 'YOĞURT', '120 g') ,
        (menu_id, 'Ekstra', 'Su', '500 ml') ,
        (menu_id, 'Ekmek', 'Çeyrek Ekmek', '') ;

-- 23 Kasım 2025 (Pazar)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT city_id, 'Akşam Yemeği', '2025-11-23', '960-1078 kkal' 
                WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-23')
                    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g') ,
        (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g') ,
        (menu_id, 'Ana Yemek (%80)', 'TİRE KÖFTE (PİDE, FIRIN BİBER, SOĞAN İLE)', '90 g/200 g'),
        (menu_id, 'Ana Yemek (%20)', 'LAHANA SARMASI (YOĞURT İLE)', '200 g + 20 g Yoğurt'),
        (menu_id, 'Yan Yemek', 'MAKARNA (SOS/YOĞURT İLE)', '200 g'),
        (menu_id, 'Ekstra', 'BİBER TARATOR', '100 g') ,
        (menu_id, 'Ekstra', 'Su', '500 ml') ,
        (menu_id, 'Ekmek', 'Çeyrek Ekmek', '') ;

-- ** VERİLER BU KISIMDAN SONRA GÖRSELİN ALT SIRASINDAN ALINMIŞTIR **

-- 24 Kasım 2025 (Pazartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT city_id, 'Akşam Yemeği', '2025-11-24', '1249-1558 kkal' 
                WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-24')
                    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'YAYLA ÇORBASI', '250 g') ,
        (menu_id, 'Çorba', 'YÜKSÜK ÇORBASI', '250 g') ,
        (menu_id, 'Ana Yemek (%80)', 'TAVUK ÇÖKERTME', '100 g/250 g'),
        (menu_id, 'Ana Yemek (%20)', 'TAZE FASULYE YEMEĞİ', '200 g'),
        (menu_id, 'Yan Yemek', 'SEBZELİ BULGUR PILAVI', '200 g') ,
        (menu_id, 'Ekstra', 'ÇİKOLATALI PASTA', '120 g') ,
        (menu_id, 'Ekstra', 'Su', '500 ml') ,
        (menu_id, 'Ekmek', 'Çeyrek Ekmek', '') ;

-- 25 Kasım 2025 (Salı)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT city_id, 'Akşam Yemeği', '2025-11-25', '896-1106 kkal' 
                WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-25')
                    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'EZOGELİN ÇORBASI', '250 g') ,
        (menu_id, 'Çorba', 'SEBZE ÇORBASI', '250 g') ,
        (menu_id, 'Ana Yemek (%80)', 'KARNIYARIK', '60 g/200 g'),
        (menu_id, 'Ana Yemek (%20)', 'PATATES YEMEĞİ', '200 g'),
        (menu_id, 'Yan Yemek', 'MAKARNA (SOS İLE)', '200 g'),
        (menu_id, 'Ekstra', 'CACIK', '150 g') ,
        (menu_id, 'Ekstra', 'Su', '500 ml') ,
        (menu_id, 'Ekmek', 'Çeyrek Ekmek', '') ;

-- 26 Kasım 2025 (Çarşamba)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT city_id, 'Akşam Yemeği', '2025-11-26', '1004-1206 kkal' 
                WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-26')
                    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TOYGA ÇORBASI', '250 g') ,
        (menu_id, 'Çorba', 'DOMATES ÇORBASI', '250 g') ,
        (menu_id, 'Ana Yemek (%80)', 'TAS KEBABI', '90 g/250 g'),
        (menu_id, 'Ana Yemek (%20)', 'BEZELYE YEMEĞİ', '200 g'),
        (menu_id, 'Yan Yemek', 'ŞEHRİYE PİLAVI', '150 g') ,
        (menu_id, 'Ekstra', 'PEMBE SULTAN', '100 g') ,
        (menu_id, 'Ekstra', 'Su', '500 ml') ,
        (menu_id, 'Ekmek', 'Çeyrek Ekmek', '') ;

-- 27 Kasım 2025 (Perşembe)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT city_id, 'Akşam Yemeği', '2025-11-27', '863-1050 kkal' 
                WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-27')
                    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g') ,
        (menu_id, 'Çorba', 'YÜKSÜK ÇORBASI', '250 g') ,
        (menu_id, 'Ana Yemek (%80)', 'BEŞAMEL SOSLU TAVUK', '100 g/250 g'),
        (menu_id, 'Ana Yemek (%20)', 'KURU FASULYE YEMEĞİ', '200 g'),
        (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g') ,
        (menu_id, 'Ekstra', 'KIVIRCIK SALATA', '50 g') ,
        (menu_id, 'Ekstra', 'Su', '500 ml') ,
        (menu_id, 'Ekmek', 'Çeyrek Ekmek', '') ;

-- 28 Kasım 2025 (Cuma)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT city_id, 'Akşam Yemeği', '2025-11-28', '959-1046 kkal' 
                WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-28')
                    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g') ,
        (menu_id, 'Çorba', 'ŞEHRİYE ÇORBASI', '250 g') ,
        (menu_id, 'Ana Yemek (%80)', 'BEĞENDİLİ IZGARA KÖFTE', '90 g/200 g'),
        (menu_id, 'Ana Yemek (%20)', 'KARNABAHAR KIZARTMASI (YOĞURT İLE)', '200 g + 20 g Yoğurt'),
        (menu_id, 'Yan Yemek', 'MANTI (SOS/YOĞURT İLE)', '200 g'),
        (menu_id, 'Ekstra', 'ELMA', '150 g-200 g') ,
        (menu_id, 'Ekstra', 'Su', '500 ml') ,
        (menu_id, 'Ekmek', 'Çeyrek Ekmek', '') ;

-- 29 Kasım 2025 (Cumartesi)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT city_id, 'Akşam Yemeği', '2025-11-29', '981-1277 kkal' 
                WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-29')
                    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'EZOGELİN ÇORBASI', '250 g') ,
        (menu_id, 'Çorba', 'TOYGA ÇORBASI', '250 g') ,
        (menu_id, 'Ana Yemek (%80)', 'ÇITIR TAVUK (FIRIN PATATES İLE)', '100 g/200 g'),
        (menu_id, 'Ana Yemek (%20)', 'MEVSİM TÜRLÜ (PATATES, PATLICAN, KABAK, BİBER İLE)', '200 g'),
        (menu_id, 'Yan Yemek', 'BULGUR PILAVI', '200 g') ,
        (menu_id, 'Ekstra', 'KARIŞIK SALATA', '100 g') ,
        (menu_id, 'Ekstra', 'Su', '500 ml') ,
        (menu_id, 'Ekmek', 'Çeyrek Ekmek', '') ;

-- 30 Kasım 2025 (Pazar)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT city_id, 'Akşam Yemeği', '2025-11-30', '1238-1346 kkal' 
                WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId" = city_id AND "MealType" = 'Akşam Yemeği' AND "Date" = '2025-11-30')
                    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBASI', '250 g') ,
        (menu_id, 'Çorba', 'YÜKSÜK ÇORBASI', '250 g') ,
        (menu_id, 'Ana Yemek (%80)', 'NOHUT YEMEĞİ', '200 g'),
        (menu_id, 'Ana Yemek (%20)', 'MÜCVER (YOĞURT İLE)', '200 g + 20 g Yoğurt'),
        (menu_id, 'Yan Yemek', 'ŞEHRİYELİ PİRİNÇ PILAVI', '150 g') ,
        (menu_id, 'Ekstra', 'ŞEKERPARE', '100 g') ,
        (menu_id, 'Ekstra', 'KARIŞIK TURŞU', '80 g') ,
        (menu_id, 'Ekstra', 'Su', '500 ml') ,
        (menu_id, 'Ekmek', 'Çeyrek Ekmek', '') ;

END $$;

COMMIT;

-- End of file