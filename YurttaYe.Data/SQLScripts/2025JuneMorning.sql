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

DO $$
DECLARE
menu_id INTEGER;
BEGIN
    -- 1 Haziran 2025 (Retained from previous request as it wasn't updated)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-01',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-01'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patates Kızartması', '150 g'),
    (menu_id, 'Yan Yemek', 'Fırın Patates', '150 g'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 2 Haziran 2025 (Retained from previous request as it wasn't updated)
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-02',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-02'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Menemen', '150 g (1 adet L boy yumurta)'),
    (menu_id, 'Yan Yemek', 'Çikolatalı Milföy Börek', '60 g'),
    (menu_id, 'Yan Yemek', 'Peynirli Milföy Börek', '60 g'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 3 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-03',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-03'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Karışık Pizza', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 4 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-04',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-04'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Peynirli Omlet', '30 g beyaz peynir + 1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Sade Açma', '1 adet'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 5 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-05',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-05'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Simit', '1 adet'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 6 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-06',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-06'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sucuklu Yumurta', '1 adet L boy yumurta + 25 g sucuk'),
    (menu_id, 'Yan Yemek', 'Kakaolu Kek', '50 g'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 7 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-07',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-07'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patates Kızartması', '150 g'),
    (menu_id, 'Yan Yemek', 'Fırın Patates', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 8 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-08',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-08'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sade Omlet', '1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Poğaça Çeşitleri', '1 adet'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 9 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-09',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-09'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Simit', '1 adet'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 10 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-10',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-10'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Kaşarlı Omlet', '30 g kaşar peyniri + 1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Çikolatalı Milföy Börek', '60 g'),
    (menu_id, 'Yan Yemek', 'Peynirli Milföy Börek', '60 g'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 11 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-11',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-11'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Karışık Kızartma', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 12 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-12',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-12'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sade Omlet', '1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Börek Çeşitleri', '120 g'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 13 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-13',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-13'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sosis Kokteyl', '50 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 14 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-14',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-14'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Menemen', '150 g (1 adet L boy yumurta)'),
    (menu_id, 'Yan Yemek', 'Sade Poğaça', '1 adet'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 15 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-15',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-15'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patates Kızartması', '150 g'),
    (menu_id, 'Yan Yemek', 'Fırın Patates', '150 g'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 16 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-16',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-16'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sucuklu Yumurta', '1 adet L boy yumurta + 25 g sucuk'),
    (menu_id, 'Yan Yemek', 'Poğaça Çeşitleri', '1 adet'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 17 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-17',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-17'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Karışık Kızartma', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 18 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-18',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-18'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patatesli Yumurta', '150 g (1 adet L boy yumurta)'),
    (menu_id, 'Yan Yemek', 'Sade Kek', '50 g'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 19 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-19',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-19'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Zeytinli Peynirli Açma', '1 adet'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 20 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-20',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-20'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sade Omlet', '1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Peynirli Milföy Börek', '60 g'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 21 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-21',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-21'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patates Kızartması', '150 g'),
    (menu_id, 'Yan Yemek', 'Fırın Patates', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 22 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-22',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-22'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Menemen', '150 g (1 adet L boy yumurta)'),
    (menu_id, 'Yan Yemek', 'Simit', '1 adet'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 23 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-23',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-23'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Börek Çeşitleri (Peynirli, Ispanaklı)', '120 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 24 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-24',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-24'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Kaşarlı Omlet', '30 g kaşar peyniri + 1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Sade Açma', '1 adet'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 25 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-25',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-25'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Fırın Patates', '150 g'),
    (menu_id, 'Yan Yemek', 'Patates Kızartması', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 26 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-26',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-26'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sucuklu Yumurta', '1 adet L boy yumurta + 25 g sucuk'),
    (menu_id, 'Yan Yemek', 'Simit', '1 adet'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 27 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-27',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-27'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Karışık Kızartma', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 28 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-28',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-28'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sade Omlet', '1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Poğaça Çeşitleri', '1 adet'),
    (menu_id, 'Sebze', 'Dere Otu', '10 g'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 29 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-29',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-29'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sosis Kokteyl (Salçalı veya Kızartma)', '50 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 30 Haziran 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-06-30',
    '800 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-06-30'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Peynirli Omlet', '30 g beyaz peynir + 1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Zeytinli Peynirli Açma', '1 adet'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');
END $$;

COMMIT;