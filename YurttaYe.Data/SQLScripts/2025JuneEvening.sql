BEGIN;

-- Disable Row-Level Security (if needed)
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
    -- 1 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-01',
    '1025-1030 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-01'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'YAYLA ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'IZGARA KÖFTE (PİDE İLE)', '90 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK KIZARTMA (SOS İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'ERİŞTE/MAKARNA', '200 g'),
    (menu_id, 'Ekstra', 'EGE SALATA', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 2 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-02',
    '940-1056 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-02'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'YÜKSÜK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK SOTE', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'İMAMBAYILDI', '200 g'),
    (menu_id, 'Yan Yemek', 'MISIR/PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'YOĞURTLU SEMİZOTU', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 3 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-03',
    '1190-1305 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-03'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'EZOGELİN ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'SEBZE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'İZMİR KÖFTE', '60 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'NOHUT YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA (SOS İLE)', '200 g'),
    (menu_id, 'Ekstra', 'SUPANGLE', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 4 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-04',
    '885-1110 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-04'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TOYGA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'SALÇALI MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'ÇOBAN KAVURMA', '90 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'TAZE FASULYE YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'ŞEHRİYELİ PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'KARIŞIK SALATA', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 5 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-05',
    '1040-1125 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-05'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'YAYLA ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK KAVURMA (KÜP PATATES İLE)', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK DOLMA (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA (SOS İLE)', '200 g'),
    (menu_id, 'Ekstra', 'CACIK', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 6 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-06',
    '900-1150 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-06'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MAHLUTA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'SEBZE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'ET KAVURMA, BİBER-SOĞAN-DOMATES İLE', '100 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'SEBZE SOTE', '200 g'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'AYRAN', '170-200 ml'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 7 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-07',
    '1213-1400 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-07'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'EZOGELİN ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'BİBER-SOĞAN-DOMATES İLE', '100permissions g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'BEZELYE YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA (SOS İLE)', '200 g'),
    (menu_id, 'Ekstra', 'HAYDARİ', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 8 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-08',
    '855-945 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-08'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'DOMATES ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'KURU FASULYE YEMEĞİ', '200 g'),
    (menu_id, 'Ana Yemek (%20)', 'MÜCVER (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (menu_id, 'Ekstra', 'EGE SALATA', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 9 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-09',
    '1150-1200 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-09'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MAHLUTA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'SOSLU MİTTE KÖFTE (KÜP PATATES İLE)', '60 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK KIZARTMA (SOS İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'PEYNİR TABAĞI', '150 g'),
    (menu_id, 'Ekstra', 'TATLISU/KEMALPAŞA TATLISI', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 10 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-10',
    '1143-1455 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-10'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'DOMATES ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'KÖRİ SOSLU TAVUK', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'BİBER DOLMA (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'ERİŞTE/MAKARNA', '200 g'),
    (menu_id, 'Ekstra', 'ÇEVİZLİ BAKLAVA', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 11 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-11',
    '985-1125 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-11'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'YÜKSÜK ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'NOHUT YEMEĞİ', '200 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK KIZARTMA (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'ŞEHRİYELİ PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 12 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-12',
    '885-975 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-12'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'YAYLA ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK ÇÖKERTME', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'GARNİTÜRLÜ KABAK SANDAL', '200 g'),
    (menu_id, 'Yan Yemek', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (menu_id, 'Ekstra', 'KURU CACIK', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 13 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-13',
    '911-975 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-13'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MAHLUTA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'SEBZE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TİRE KÖFTE (PİDE-DOMATES İLE)', '90 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'İMAMBAYILDI', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA', '200 g'),
    (menu_id, 'Ekstra', 'KARIŞIK SALATA', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 14 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-14',
    '995-1230 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-14'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'EZOGELİN ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'SEBZE ÇORBASI (KÜP PATATES İLE)', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK ŞİŞ (KÜP PATATES İLE)', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'BARBUNYA/KURU FASULYE', '200 g'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'KADAYIF MUHALLEBİLİ', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 15 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-15',
    '950-1170 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-15'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'ERİŞTELİ YEŞİL MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'ET SOTE', '90 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'ISPANAK YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (menu_id, 'Ekstra', 'HAVUÇ TARATOR', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 16 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-16',
    '829-976 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-16'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'ÇITIR KIZARTMASI', '100 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'TAZE FASULYE YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA (SOS İLE)', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 17 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-17',
    '1150-1300 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-17'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'YÜKSÜK ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'ÇİFTLİK KÖFTE', '60 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'MÜCVER (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'ŞEHRİYELİ TARATOR', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 18 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-18',
    '970-1310 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-18'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'EZOGELİN ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'YAYLA ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK ORMAN KEBABI', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK DOLMA (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA (SOS İLE)', '200 g'),
    (menu_id, 'Ekstra', 'UN VEYA İRMİK HELVASI', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 19 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-19',
    '795-1150 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-19'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'DOMATES ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'SEBZE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'ETLİ SULTAN KEBABI', '90 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'KURU FASULYE YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'HAVUÇ AYŞBERG SALATA', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 20 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-20',
    '1015-1025 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-20'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MAHLUTA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'SEBZE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'ŞÖLEN KÖFTE (FIRIN BİBER-DOMATES İLE)', '90 g/200 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK KIZARTMA (SOS İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 21 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-21',
    '1010-1135 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-21'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'EZOGELİN ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK ÇÖKERTME', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'İMAMBAYILDI', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA', '150 g'),
    (menu_id, 'Ekstra', 'KARIŞIK SALATA', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 22 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-22',
    '1305-1600 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-22'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'DOMATES ÇORBASI-BİBER-SOĞAN', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%80)', 'DOMATES', '200 g'),
    (menu_id, 'Ana Yemek (%20)', 'PATATES YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'ERİŞTE/MAKARNA', '200 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 23 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-23',
    '905-1075 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-23'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'YAYLA ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'NOHUT YEMEĞİ', '200 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK KIZARTMA', '200 g'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ P PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'ÇEVİZLİ KADAYIF', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 24 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-24',
    '829-1010 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-24'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'EZOGELİN ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'SEBZE ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK ŞİŞ (ELMA DİLİM PATATES İLE)', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'TAZE FASULYE YEMEĞİ', '200 g'),
    (menu_id, 'Yan Yemek', 'DAMLA SAKIZLI MUHALLEBİ', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 25 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-25',
    '885-1080 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-25'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAS KEBABI', '90 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'MÜCVER (YOĞURT İLE)', '200 g'),
    (menu_id, 'Yan Yemek', 'HAVUÇ AYŞBERG SALATA', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 26 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-26',
    '1020-1080 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-26'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TARHANA ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'EZOGELİN ÇORBASI', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'TAVUK KAVURMA (KÜP PATATES İLE)', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'SEBZELİ PİLAVI', '150 g'),
    (menu_id, 'Yan Yemek', 'KARIŞIK SALATA', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 27 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-27',
    '1213-1360 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-27'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'YÜKSÜK ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'DOMATES', '200 g'),
    (menu_id, 'Ana Yemek (%20)', 'İMAMBAYILDI', '200 g'),
    (menu_id, 'Yan Yemek', 'MAKARNA', '150 g'),
    (menu_id, 'Ekstra', 'ÇEVİZLİ KADAYIF', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 28 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-28',
    '925-1095 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-28'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'YÜKSÜK ÇORBA', '250 g'),
    (menu_id, 'Çorba', 'TAVUK SUYU ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'NOHUT YEMEĞİ', '200 g'),
    (menu_id, 'Ana Yemek (%20)', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Yan Yemek', 'CACIK', '100 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 29 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-29',
    '925-1095 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-29'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'MERCİMEK ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'DOMATES FAJİTA', '100 g/250 g'),
    (menu_id, 'Ana Yemek (%80)', 'KARIŞIK KIZARTMA', '200 g'),
    (menu_id, 'Ana Yemek (%20)', 'GARNİTÜRLÜ KABAK SANDAL', '200 g'),
    (menu_id, 'Yan Yemek', 'ERİŞTE/MAKARNA', '150 g'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');

-- 30 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-06-30',
    '905-1075 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-06-30'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'EZOGELİN ÇORBASI', '250 g'),
    (menu_id, 'Çorba', 'YAYLA ÇORBA', '250 g'),
    (menu_id, 'Ana Yemek (%80)', 'KURU KÖFTE', '90 g/250 g'),
    (menu_id, 'Ana Yemek (%20)', 'KARIŞIK KIZARTMA', '200 g'),
    (menu_id, 'Yan Yemek', 'PİRİNÇ PİLAVI', '150 g'),
    (menu_id, 'Ekstra', 'AYRAN', '170-200 ml'),
    (menu_id, 'Ekstra', 'Su', '500 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', '');
END $$;

COMMIT;