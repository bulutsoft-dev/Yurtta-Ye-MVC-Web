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
    -- 15 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-15',
    '880-920 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-15'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Ezogelin Çorbası', '250 g'),
    (menu_id, 'Ana Yemek', 'Tavuk Külbastı (Fırın Patates ile)', '200 g/150 g'),
    (menu_id, 'Yan Yemek', 'Mevsim Türlü', '200 g'),
    (menu_id, 'Pirinç', 'Pirinç Pilavı', '150 g'),
    (menu_id, 'Tatlı', 'Haydari', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 16 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-16',
    '855-1055 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-16'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Domates Çorbası', '250 g'),
    (menu_id, 'Ana Yemek', 'Tire Köfte (Pide+Dilim Domates Soslu)', '200 g'),
    (menu_id, 'Yan Yemek', 'Makarna (sos ile)', '200 g'),
    (menu_id, 'Pirinç', 'Pilav', '150 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 17 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-17',
    '1100-1340 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-17'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Tavuksuyu Çorba', '250 g'),
    (menu_id, 'Ana Yemek', 'Mencimek Köfte / Mercimek Köfte', '250 g'),
    (menu_id, 'Yan Yemek', 'Bulgur Pilavı', '150 g'),
    (menu_id, 'Salata', 'Karışık Salata', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 18 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-18',
    '885-1135 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-18'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Tarhana Çorbası', '250 g'),
    (menu_id, 'Ana Yemek', 'Kuzu/Çitır Tavuk (Patates kızartması ile)', '200 g/150 g'),
    (menu_id, 'Yan Yemek', 'Sebze Sote', '200 g'),
    (menu_id, 'Pilav', 'Makarna', '150 g'),
    (menu_id, 'Tatlı', 'Damla Sakızlı Muhallebi', '150 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 19 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-19',
    '900-1155 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-19'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Salçalı Mercimek Çorba', '250 g'),
    (menu_id, 'Ana Yemek', 'Şehriye Çorba/İzmir Köfte (alternatif)', '250 g/200 g'),
    (menu_id, 'Yan Yemek', 'Pirinç Pilavı', '150 g'),
    (menu_id, 'Salata', 'Ege Salata', '150 g'),
    (menu_id, 'Tatlı', 'Kuru Cacık', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 20 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-20',
    '900-1090 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-20'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Domates Çorbası', '250 g'),
    (menu_id, 'Ana Yemek', 'Yağlı Çorba / Yayla Çorba (seçenek)', '250 g'),
    (menu_id, 'Ana Yemek', 'Tavuk Kavurma (Pilav ile)', '200 g/150 g'),
    (menu_id, 'Yan Yemek', 'Kuru Fasulye Yemeği', '200 g'),
    (menu_id, 'Tatlı', 'Yoğurt', '200 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 21 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-21',
    '1255-1395 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-21'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Yüksük Çorba / Mercimek Çorbası', '250 g'),
    (menu_id, 'Ana Yemek', 'Köfte (Patates ile)', '200 g'),
    (menu_id, 'Yan Yemek', 'Spagetti (sos ile)', '150 g'),
    (menu_id, 'Tatlı', 'Cevizli Baklava', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 22 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-22',
    '945-1125 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-22'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Ezogelin Çorbası', '250 g'),
    (menu_id, 'Ana Yemek', 'Et Sote', '200 g'),
    (menu_id, 'Yan Yemek', 'Karışık Sebze Graten', '200 g'),
    (menu_id, 'Pilav', 'Sebzeli Bulgur Pilavı', '200 g'),
    (menu_id, 'Salata', 'Kaşık Salata', '150 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 23 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-23',
    '855-1055 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-23'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Salçalı Mercimek Çorbası', '250 g'),
    (menu_id, 'Ana Yemek', 'Toyga Çorba / Tavuk Fırın (seçenek)', '250 g/200 g'),
    (menu_id, 'Yan Yemek', 'Garnitürlü Kabak Sandal', '200 g'),
    (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
    (menu_id, 'Salata', 'Piyaz', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 24 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-24',
    '1275-1435 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-24'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Şehriye Çorbası', '250 g'),
    (menu_id, 'Ana Yemek', 'Izgara Köfte (Fırın Patates ile)', '90 g/200 g'),
    (menu_id, 'Yan Yemek', 'Patates Yemeği', '200 g'),
    (menu_id, 'Pilav', 'Makarna', '150 g'),
    (menu_id, 'Tatlı', 'Islak Kek', '120 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 25 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-25',
    '915-1125 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-25'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Mahluta Çorbası', '250 g'),
    (menu_id, 'Ana Yemek', 'Kolay Patates Yemeği / Kuru Patates (seçenek)', '200 g'),
    (menu_id, 'Yan Yemek', 'Bulgur Pilavı', '150 g'),
    (menu_id, 'Yan Yemek', 'Havuç Tarator', '100 g'),
    (menu_id, 'Ekstra', 'Yoğurt', '120 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 26 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-26',
    '1120-1335 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-26'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Domates Çorbası', '250 g'),
    (menu_id, 'Ana Yemek', 'Tavuksuyu Çorba / Tavuk Sote', '250 g/200 g'),
    (menu_id, 'Yan Yemek', 'Nohut Yemeği', '200 g'),
    (menu_id, 'Yan Yemek', 'Revani', '80 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 27 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-27',
    '985-1240 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-27'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Ezogelin Çorbası', '250 g'),
    (menu_id, 'Ana Yemek', 'Tavuk Çökertme', '200 g'),
    (menu_id, 'Yan Yemek', 'Mücver', '150 g'),
    (menu_id, 'Pilav', 'Makarna', '150 g'),
    (menu_id, 'Ekstra', 'Cacık', '80 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 28 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-28',
    '945-1065 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-28'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Mercimek Çorbası', '250 g'),
    (menu_id, 'Ana Yemek', 'Yüksük Köfte / Soslu Mıltıke Köfte (seçenek)', '200 g'),
    (menu_id, 'Yan Yemek', 'Taze Fasulye Yemeği', '200 g'),
    (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
    (menu_id, 'Tatlı', 'Cevizli Baklava', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 29 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-29',
    '840-1055 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-29'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Domates Çorbası', '250 g'),
    (menu_id, 'Ana Yemek', 'Erişteli Yeşil Mercimek Çorba / Köri Soslu Tavuk', '250 g/200 g'),
    (menu_id, 'Yan Yemek', 'Kurufasulye Yemeği', '200 g'),
    (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
    (menu_id, 'Tatlı', 'Haydari', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 30 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Akşam Yemeği',
    '2025-09-30',
    '1060-1180 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus"
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Akşam Yemeği'
        AND "Date" = '2025-09-30'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Çorba', 'Salçalı Mercimek Çorbası', '250 g'),
    (menu_id, 'Ana Yemek', 'Tavuk Suyu Çorba / Akçaabat Köfte (Elma Dilim Patates ile)', '250 g/200 g'),
    (menu_id, 'Yan Yemek', 'Karnıyarık Dolma', '200 g'),
    (menu_id, 'Pilav', 'Makarna', '200 g'),
    (menu_id, 'Tatlı', 'Ayran', '170-200 ml'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

END $$;

COMMIT;
