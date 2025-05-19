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
    'Kahvaltı',
    '2025-05-01',
    '780 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-01'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sade Omlet', '1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Poğaça Çeşitleri (Dere Otlu-Sade)', '1 adet'),
    (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 2 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-02',
    '845 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-02'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Karışık Pizza', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 3 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-03',
    '965 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-03'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sucuklu Yumurta', '1 adet L boy yumurta+ 25 g beyaz etli'),
    (menu_id, 'Yan Yemek', 'Sade Açma', '1 adet'),
    (menu_id, 'Peynir', 'Tulum veya Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 4 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-04',
    '830 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-04'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patates Kızartması/Fırın Patates', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 5 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-05',
    '630 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-05'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Menemen', '150 g (1 adet L boy yumurta)'),
    (menu_id, 'Yan Yemek', 'Çikolatalı/Peynirli Milföy Börek', '60 g'),
    (menu_id, 'Peynir', 'Labne Peynir/Krem Peynir', '20 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 6 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-06',
    '610 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-06'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sosis Kokteyl (Salçalı veya Kızartma)', '100 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 7 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-07',
    '785 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-07'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Kaşarlı Omlet', '30 g kaşar p.+ 1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Mozaik Kek', '50 g'),
    (menu_id, 'Peynir', 'Tulum veya Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 8 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-08',
    '765 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-08'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patates Kavurması veya Patates Salatası', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Helva', '40 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 9 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-09',
    '950 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-09'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Peynirli Omlet', '30 g beyaz p.+ 1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Simit', '1 adet'),
    (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 10 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-10',
    '830 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-10'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patates Kızartması/Fırın Patates', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 11 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-11',
    '920 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-11'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sade Omlet', '1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Zeytinli/Peynirli Açma', '1 adet'),
    (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Bal+Tereyağ', '20 g+10 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 12 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-12',
    '660 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-12'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Börek Çeşitleri (Peynirli/Ispanaklı)', '120 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Labne Peynir/Krem Peynir', '20 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 13 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-13',
    '810 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-13'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sucuklu Yumurta', '1 adet L boy yumurta+ 25 g beyaz etli'),
    (menu_id, 'Yan Yemek', 'Peynirli/Çikolatalı Milföy Börek', '60 g'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 14 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-14',
    '935 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-14'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patates Kızartması/Fırın Patates', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 15 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-15',
    '765 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-15'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sade Omlet', '1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Poğaça Çeşitleri (Dere Otlu-Sade)', '1 adet'),
    (menu_id, 'Peynir', 'Tulum veya Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 16 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-16',
    '845 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-16'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Karışık Pizza', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 17 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-17',
    '835 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-17'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Menemen', '150 g (1 adet L boy yumurta)'),
    (menu_id, 'Yan Yemek', 'Simit', '1 adet'),
    (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Meyve', 'Muz', '150-200 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 18 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-18',
    '770 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-18'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Karışık Kızartma', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Tulum veya Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 19 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-19',
    '675 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-19'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sucuklu Yumurta', '1 adet L boy yumurta+ 25 g beyaz etli'),
    (menu_id, 'Yan Yemek', 'Patates Haşlama', '100 g'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 20 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-20',
    '710 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-20'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sosis Kokteyl (Salçalı veya Kızartma)', '100 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 21 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-21',
    '990 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-21'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patatesli Yumurta', '150 g (1 adet L boy yumurta)'),
    (menu_id, 'Yan Yemek', 'Sade Poğaça', '1 adet'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 22 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-22',
    '875 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-22'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Zeytinli/Peynirli Açma', '1 adet'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Bal+Tereyağ', '20 g+10 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 23 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-23',
    '675 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-23'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sade Omlet', '1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Peynirli/Çikolatalı Milföy Börek', '60 g'),
    (menu_id, 'Peynir', 'Tulum veya Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 24 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-24',
    '815 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-24'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patates Kızartması/Fırın Patates', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Labne Peynir/Krem Peynir', '20 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 25 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-25',
    '810 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-25'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Menemen', '150 g (1 adet L boy yumurta)'),
    (menu_id, 'Yan Yemek', 'Poğaça Çeşitleri (Dere Otlu-Sade)', '1 adet'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 26 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-26',
    '875 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-26'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Simit', '1 adet'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Bal+Tereyağ', '20 g+10 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 27 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-27',
    '715 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-27'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Peynirli Omlet', '30 g beyaz p.+ 1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Meyveli Kek', '50 g'),
    (menu_id, 'Peynir', 'Tulum veya Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 28 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-28',
    '915 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-28'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patates Kızartması/Fırın Patates', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Helva', '40 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 29 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-29',
    '855 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-29'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Kaşarlı Omlet', '30 g kaşar p.+ 1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Sade Açma', '1 adet'),
    (menu_id, 'Peynir', 'Labne Peynir/Krem Peynir', '20 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 30 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-30',
    '810 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-30'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Börek Çeşitleri (Patatesli/Ispanaklı)', '120 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 31 Mayıs 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-05-31',
    '860 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-05-31'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sade Omlet', '1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Poğaça Çeşitleri (Dere Otlu-Sade)', '1 adet'),
    (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürülebilir', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');
END $$;

COMMIT;