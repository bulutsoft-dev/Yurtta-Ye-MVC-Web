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
    'Kahvaltı',
    '2025-09-15',
    '720 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-15'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patates Kızartması', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy yumurta'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

    -- 16 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-09-16',
    '720 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-16'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Peynirli Omlet', '30 g kaşar + 1 adet L boy yumurta'),
    (menu_id, 'Ana Yemek', 'Simit', '1 adet'),
    (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

    -- 17 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-09-17',
    '780 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-17'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Karışık Pizza', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy yumurta'),
    (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

    -- 18 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-09-18',
    '780 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-18'
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

    -- 19 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-09-19',
    '760 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-19'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Zeytinli/Peynirli Açma', '1 adet'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy yumurta'),
    (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürlebilir', 'Reçel Çeşitleri', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

    -- 20 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-09-20',
    '820 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-20'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sucuklu Yumurta', '1 adet L boy yumurta + 25 g sucuk'),
    (menu_id, 'Yan Yemek', 'Çikolatalı Milföy Börek', '60 g'),
    (menu_id, 'Peynir', 'Labne Peynir', '20 g'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '30 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml');

    -- 21 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-09-21',
    '720 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-21'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patates Kızartması', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy yumurta'),
    (menu_id, 'Peynir', 'Labne Peynir', '20 g'),
    (menu_id, 'Sürlebilir', 'Reçel Çeşitleri', '20 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

    -- 22 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-09-22',
    '720 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-22'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Menemen', '150 g'),
    (menu_id, 'Yan Yemek', 'Dere Otlu Poğaça', '1 adet'),
    (menu_id, 'Peynir', 'Labne Peynir', '20 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

    -- 23 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-09-23',
    '730 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-23'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sosis Kokteyl (Salçalı veya Kızartma)', '100 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy yumurta'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

    -- 24 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-09-24',
    '760 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-24'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Kaşarlı Omlet', '30 g kaşar + 1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Mozaik Kek', '50 g'),
    (menu_id, 'Peynir', 'Tulum veya Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürlebilir', 'Tahinli Pekmez', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

    -- 25 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-09-25',
    '760 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-25'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Karışık Pizza', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy yumurta'),
    (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

    -- 26 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-09-26',
    '720 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-26'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sade Omlet', '1 adet L boy yumurta'),
    (menu_id, 'Ana Yemek', 'Simit', '1 adet'),
    (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürlebilir', 'Reçel Çeşitleri', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

    -- 27 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-09-27',
    '720 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-27'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patates Kızartması', '150 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy yumurta'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

    -- 28 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-09-28',
    '730 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-28'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Peynirli Omlet', '30 g beyaz peynir + 1 adet L boy yumurta'),
    (menu_id, 'Yan Yemek', 'Zeytinli/Peynirli Açma', '1 adet'),
    (menu_id, 'Peynir', 'Labne Peynir', '20 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürlebilir', 'Reçel Çeşitleri', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

    -- 29 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-09-29',
    '750 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-29'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Patatesli Börek', '120 g'),
    (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy yumurta'),
    (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

    -- 30 Eylül 2025
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
SELECT
    (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa'),
    'Kahvaltı',
    '2025-09-30',
    '820 kkal'
    WHERE NOT EXISTS (
        SELECT 1 FROM public."Menus" 
        WHERE "CityId" = (SELECT "Id" FROM public."Cities" WHERE "Name" = 'Manisa')
        AND "MealType" = 'Kahvaltı'
        AND "Date" = '2025-09-30'
    )
    RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram")
VALUES
    (menu_id, 'Ana Yemek', 'Sucuklu Yumurta', '1 adet L boy yumurta + 25 g sucuk'),
    (menu_id, 'Yan Yemek', 'Sade Açma', '1 adet'),
    (menu_id, 'Peynir', 'Tulum veya Beyaz Peynir', '40 g'),
    (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
    (menu_id, 'Sürlebilir', 'Reçel Çeşitleri', '20 g'),
    (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
    (menu_id, 'İçecek', 'Su', '500 ml'),
    (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

END $$;

COMMIT;
