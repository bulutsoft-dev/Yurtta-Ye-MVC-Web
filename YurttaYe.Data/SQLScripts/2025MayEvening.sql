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
BEGIN
    -- 1 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-01',
    '870-1205 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-01'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'DOMATES ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'ŞEHRİYE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'ÇITIR TAVUK (FIRIN PATATES İLE)', '100 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'KURUFASULYE YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (menu_id, 'Ekstra', 'YOĞURT', '120 g'),
    (menu_id, 'Ekstra', 'MEYVE SUYU', '200 ml'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 2 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-02',
    '1160-1290 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-02'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TARHANA ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'İZMİR KÖFTE', '60 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK KIZARTMA (SOS İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'PEYNİRLİ MAKARNA', '200 g'),
    (menu_id, 'Ekstra', 'KARIŞIK SALATA', '100 g'),
    (menu_id, 'Ekstra', 'BROWNİ', '120 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 3 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-03',
    '1125-1180 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-03'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TOYGA ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'EZOGELİN ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK KÜLBASTI (FIRIN SEBZE İLE)', '100 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'TAZE FASULYE YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'AYRAN', '170-200 ml'),
    (menu_id, 'Ekstra', 'MEYVE SUYU', '170-200 ml'),
    (menu_id, 'Ekstra', 'KURU CACIK', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 4 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-04',
    '860-1060 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-04'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'SALÇALI MERCİMEK ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'YAYLA ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'IZGARA KÖFTE (SOS VE PİYAZ İLE)', '90 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'ISPANAK YEMEĞİ (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'SPAGETTİ (SOS İLE)', '200 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 5 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-05',
    '850-1135 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-05'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'SEBZE ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'DOMATES ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK ÇÖKERTME', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'MÜCVER (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'ŞEHRİYELİ PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'MEVSİM SALATA', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 6 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-06',
    '1085-1345 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-06'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MAHLUTA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'YOĞURT ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'SOSLU MİTİTE KÖFTE', '60 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'SEBZE SOTE', '200 g'),
    (menu_id, 'Yan Yemek', 'PEYNİRLİ MAKARNA', '200 g'),
    (menu_id, 'Ekstra', 'TRİLİÇE', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 7 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-07',
    '840-1190 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-07'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'ARPA ŞEHRİYE ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'YÜKSÜK ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAS KEBABI', '90 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'BEZELYE YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'KURU CACIK', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 8 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-08',
    '1110-1170 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-08'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TOYGA ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'EZOGELİN ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'KÖRİ SOSLU TAVUK (PATATES KIZARTMASI İLE)', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK DOLMA (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA (SOS İLE)', '150 g'),
    (menu_id, 'Ekstra', 'HAVUÇ TARATOR', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 9 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-09',
    '1170-1330 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-09'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'NOHUT YEMEĞİ', '200 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK KIZARTMA (SOS İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (menu_id, 'Ekstra', 'PEYNİR TATLISI', '100 g'),
    (menu_id, 'Ekstra', 'KARIŞIK TURŞU', '80 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 10 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-10',
    '865-1010 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-10'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'DOMATES ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'IZGARA KÖFTE (FIRIN PATATES İLE)', '90 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'GARNİTÜRLÜ KABAK SANDAL', '200 g'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'HAYDARİ', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 11 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-11',
    '1010-1080 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-11'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'YAYLA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'TEL ŞEHRİYE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK FAJİTA', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'PATATES YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA (SOS İLE)', '200 g'),
    (menu_id, 'Ekstra', 'YOĞURT', '120 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 12 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-12',
    '990-1155 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-12'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'YOĞURT ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'KARNIYARIK', '60 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'SEBZE KIZARTMASI (KABAK-HAVUÇ-PATATES) (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'BULGUR PİLAVI (SOS İLE)', '200 g'),
    (menu_id, 'Ekstra', 'MEYVELİ PASTA', '120 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 13 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-13',
    '1085-1235 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-13'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'EZOGELİN ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'TOYGA ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUKLU SULTAN KEBABI', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK DOLMA (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA (SOS İLE)', '200 g'),
    (menu_id, 'Ekstra', 'KARIŞIK SALATA', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 14 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-14',
    '1045-1220 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-14'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'YÜKSÜK ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'KURU FASULYE', '200 g'),
    (menu_id, 'Ana Yemek (%20)', 'ISPANAK YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'CEVİZLİ KADAYIF', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 15 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-15',
    '915-1145 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-15'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'YAYLA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK TANTUNİ (LAVAŞ-SOĞAN-DOMATES İLE)', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'MÜCVER (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'ŞEHRİYE PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'KURU CACIK', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 16 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-16',
    '975-1095 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-16'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'DOMATES ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'ARPA ŞEHRİYE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TİRE KÖFTE (PİDE+DOMATES SOS İLE)', '90 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'İMAMBAYILDI', '200 g'),
    (menu_id, 'Yan Yemek', 'PEYNİRLİ MAKARNA', '200 g'),
    (menu_id, 'Ekstra', 'EGE SALATA', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 17 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-17',
    '1070-1190 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-17'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'EZOGELİN ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'SEBZE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK SOTE (AZ SULU)', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK SEBZE GRATEN', '200 g'),
    (menu_id, 'Yan Yemek', 'ŞEHRİYELİ PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'UN VEYA İRMİK HELVASI', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 18 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-18',
    '1085-1290 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-18'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'YÜKSÜK ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'HÜNKAR BEĞENDİ', '90 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'NOHUT/BARBUNYA YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (menu_id, 'Ekstra', 'HAYDARİ', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 19 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-19',
    '860-1045 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-19'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'TOYGA ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK KAVURMA (KÜP PATATES İLE)', '100 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'TAZE FASÜLYE YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'FIRIN MAKARNA', '150 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA (SOS İLE)', '200 g'),
    (menu_id, 'Ekstra', 'CACIK', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 20 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-20',
    '905-1160 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-20'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'MAHLUTA ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'SEBZELİ KÖFTE', '60 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'MÜCVER (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'HAVUÇ TARATOR', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 21 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-21',
    '890-1400 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-21'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'YAYLA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'KIRMIZI MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'EL YAPIMI TAVUK ŞİNİTZEL (ELMA DİLİMİ PATATES)', '100 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'SEBZE SOTE', '200 g'),
    (menu_id, 'Yan Yemek', 'ERİŞTE', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA', '200 g'),
    (menu_id, 'Ekstra', 'PORTAKALLI REVANİ', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 22 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-22',
    '800-1145 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-22'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'ŞEHRİYE ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'EZOGELİN ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'ETLİ SULTAN KEBABI', '90 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'KURU FASÜLYE YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'HAVUÇ AYSBERG SALATA', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 23 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-23',
    '1220-1420 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-23'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'YÜKSÜK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'SEBZE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'MANİSA KEBABI', '90 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK DOLMA (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA (SOS İLE)', '200 g'),
    (menu_id, 'Ekstra', 'SUPANGLE', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 24 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-24',
    '975-1185 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-24'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'TOYGA ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK ŞİŞ (KÜP PATATES İLE)', '100 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK SEBZE GRATEN', '200 g'),
    (menu_id, 'Yan Yemek', 'YEŞİL MERCİMEKLİ BULGUR PİLAVI', '200 g'),
    (menu_id, 'Ekstra', 'BİBER TARATOR', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 25 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-25',
    '910-1165 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-25'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'MAHLUTA ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'KURUFASULYE YEMEĞİ', '200 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK KIZARTMA', '200 g'),
    (menu_id, 'Yan Yemek', 'ŞEHRİYELİ PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'EGE SALATA', '150 g'),
    (menu_id, 'Ekstra', 'YOĞURT', '120 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 26 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-26',
    '1115-1360 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-26'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'YAYLA ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'İZMİR KÖFTE', '60 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'GARNİTÜRLÜ KABAK SANDAL', '200 g'),
    (menu_id, 'Yan Yemek', 'SPAGETTİ (SOS İLE)', '200 g'),
    (menu_id, 'Ekstra', 'BARBUNYA PİLAKİ', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 27 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-27',
    '1220-1435 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-27'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'EZOGELİN ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'ARPA ŞEHRİYE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'KÖRİ SOSLU TAVUK', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'MÜCVER (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (menu_id, 'Ekstra', 'BİSKÜVİLİ PASTA', '120 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 28 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-28',
    '845-985 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-28'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'SEBZE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'ET SOTE', '90 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'ISPANAK GRATEN', '200 g'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'CACIK', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 29 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-29',
    '865-1255 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-29'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'YÜKSÜK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'YAYLA ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'AKÇAABAT KÖFTE (ELMA DİLİM PATATES İLE)', '90 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'TAZE FASÜLYE YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA (SOS İLE)', '200 g'),
    (menu_id, 'Ekstra', 'AYRAN', '170-200 ml'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 30 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-30',
    '765-1065 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-30'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TOYGA ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'MAHLUTA ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK TANTUNİ (LAVAŞ-SOĞAN-DOMATES İLE)', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'SEBZE SOTE', '200 g'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'HAYDARİ', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 31 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-05-31',
    '1255-1510 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-05-31'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'DOMATES ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'KURU FASÜLYE YEMEĞİ', '200 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK DOLMA', '200 g'),
    (menu_id, 'Yan Yemek', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (menu_id, 'Ekstra', 'HAŞHAŞLI REVANİ', '100 g'),
    (menu_id, 'Ekstra', 'YOĞURT', '120 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');
END $$;

COMMIT;