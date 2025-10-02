-- 2025OctoberMorning.sql
-- Generated from provided images: Ekim ayı kahvaltı (October 2025 morning menus)
-- NOTE: Menu texts were transcribed and normalized to the project's existing script style.

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

DO $$
DECLARE
    menu_id INTEGER;
BEGIN

    -- 01 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-01', '900 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-01') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Menemen','150 g'),
        (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet'),
        (menu_id,'Peynir','Beyaz Peynir','40 g'),
        (menu_id,'Peynir','Kaşar Peynir','30 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Tahinli Pekmez/Bal/Reçel','20 g'),
        (menu_id,'Sebze','Domates/Salatalık','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 02 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-02', '820 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-02') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Omlet (Kaşarlı)','1 adet L boy'),
        (menu_id,'Yan Yemek','Poğaça Çeşitleri','1 adet'),
        (menu_id,'Peynir','Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Reçel/Bal','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 03 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-03', '860 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-03') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Karışık Pizza','1 porsiyon'),
        (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet'),
        (menu_id,'Peynir','Peynir','30 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Tahinli Pekmez','20 g'),
        (menu_id,'Sebze','Salatalık/Domates','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 04 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-04', '780 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-04') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Sucuklu Yumurta','150 g'),
        (menu_id,'Yan Yemek','Açma Çeşitleri','1 adet'),
        (menu_id,'Peynir','Kaşar Peynir','30 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Bal/Reçel','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 05 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-05', '820 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-05') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Patates Kızarmta','1 porsiyon'),
        (menu_id,'Yan Yemek','Haslanmış Yumurta','1 adet'),
        (menu_id,'Peynir','Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Tahinli Pekmez/Reçel','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 06 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-06', '760 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-06') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Menemen','1 porsiyon'),
        (menu_id,'Yan Yemek','Milföy Börek','1 adet'),
        (menu_id,'Peynir','Labne','30 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Bal/Reçel','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 07 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-07', '890 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-07') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Sosis Koktely','1 porsiyon'),
        (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 dilim'),
        (menu_id,'Peynir','Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Tahinli Pekmez','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 08 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-08', '780 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-08') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Kaşarlı Omlet','150 g'),
        (menu_id,'Yan Yemek','Mozaik Kek','1 adet'),
        (menu_id,'Peynir','Kaşar/Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Helva/Reçel','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 09 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-09', '840 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-09') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Halanmış Yumurta','1 porsiyon'),
        (menu_id,'Yan Yemek','Patates Kızartması','1 adet'),
        (menu_id,'Peynir','Kaşar Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Tahinli Pekmez','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 10 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-10', '800 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-10') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Peynirli Omlet','150 g'),
        (menu_id,'Yan Yemek','Simit','1 adet'),
        (menu_id,'Peynir','Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Reçel/Bal','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 11 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-11', '860 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-11') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Patates Kızartması','120 g'),
        (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet'),
        (menu_id,'Peynir','Tulum/Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Bal/Reçel','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 12 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-12', '820 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-12') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Sade Omlet','150 g'),
        (menu_id,'Yan Yemek','Açma/Poğaça','1 adet'),
        (menu_id,'Peynir','Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Tahinli Pekmez','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 13 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-13', '840 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-13') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Börek Çeşitleri','120 g'),
        (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet'),
        (menu_id,'Peynir','Kaşar/Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Reçel/Bal','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 14 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-14', '820 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-14') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Peynirli veya Çikolatlı Milföy Börek','150 g'),
        (menu_id,'Yan Yemek','Sucuklu yumurta','1 adet'),
        (menu_id,'Peynir','Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Tahinli Pekmez','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 15 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-15', '900 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-15') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','PAtates Kızarması','1 porsiyon'),
        (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet'),
        (menu_id,'Peynir','Kaşar Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Helva/Reçel','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 16 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-16', '810 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-16') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Sade Omlet','150 g'),
        (menu_id,'Yan Yemek','Poğaca Çeşitli','1 adet'),
        (menu_id,'Peynir','Labne/Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Tahinli Pekmez','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 17 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-17', '830 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-17') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Karışık Kızartma','1 porsiyon'),
        (menu_id,'Yan Yemek','Haşlanmıs Yumurta','1 adet'),
        (menu_id,'Peynir','Kaşar/Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Bal/Reçel','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 18 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-18', '800 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-18') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Menemen','150 g'),
        (menu_id,'Yan Yemek','Simit','1 adet'),
        (menu_id,'Peynir','Tulum/Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Tahinli Pekmez/Reçel','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 19 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-19', '790 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-19') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Karışık Pizza','1 adet + 30 g'),
        (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet'),
        (menu_id,'Peynir','Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Bal/Reçel','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 20 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-20', '820 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-20') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Sade Omlet','150 g'),
        (menu_id,'Yan Yemek','Haşlanmış Patates','1 adet'),
        (menu_id,'Peynir','Kaşar/Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Tahinli Pekmez','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 21 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-21', '800 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-21') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Sosşis Koktely','120 g'),
        (menu_id,'Yan Yemek','Haşlanmış YHumurta','1 adet'),
        (menu_id,'Peynir','Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Bal/Reçel','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 22 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-22', '830 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-22') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Patatesli Yumurta','150 g'),
        (menu_id,'Yan Yemek','sade Poğaça','1 adet'),
        (menu_id,'Peynir','Kaşar/Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Tahinli Pekmez','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 23 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-23', '810 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-23') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Sucuklu Yumurta','1 porsiyon'),
        (menu_id,'Yan Yemek','Milföy Börek','1 adet'),
        (menu_id,'Peynir','Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Reçel/Bal','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 24 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-24', '800 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-24') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Zeytin/Peynirli Açma','150 g'),
        (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet'),
        (menu_id,'Peynir','Kaşar/Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Tahinli Pekmez','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 25 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-25', '820 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-25') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Patates Kızartması','1 porsiyon'),
        (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet'),
        (menu_id,'Peynir','Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Reçel/Bal','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 26 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-26', '820 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-26') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Menemen','150 g'),
        (menu_id,'Yan Yemek','Poğaca Çeşitleri','1 adet'),
        (menu_id,'Peynir','Kaşar/Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Tahinli Pekmez','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 27 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-27', '800 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-27') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Simit','1 adet'),
        (menu_id,'Yan Yemek','Haşlanmış yumurta','1 adet'),
        (menu_id,'Peynir','Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Bal/Reçel','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 28 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-28', '820 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-28') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Peynirli Omlet','150 g'),
        (menu_id,'Yan Yemek','Meyveli Kek','1 adet'),
        (menu_id,'Peynir','Kaşar/Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Tahinli Pekmez','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 29 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-29', '880 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-29') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Patates Kızartması','150 g'),
        (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet'),
        (menu_id,'Peynir','Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Reçel/Bal','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 30 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-30', '820 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-30') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Kaşarlı Omlet','1 porsiyon'),
        (menu_id,'Yan Yemek','Simit','1 adet'),
        (menu_id,'Peynir','Kaşar/Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Tahinli Pekmez','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

    -- 31 Ekim 2025
    INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
    SELECT (SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa'), 'Kahvaltı', '2025-10-31', '840 kkal'
    WHERE NOT EXISTS (SELECT 1 FROM public."Menus" WHERE "CityId"=(SELECT "Id" FROM public."Cities" WHERE "Name"='Manisa') AND "MealType"='Kahvaltı' AND "Date"='2025-10-31') RETURNING "Id" INTO menu_id;

    INSERT INTO public."MenuItems" ("MenuId","Category","Name","Gram") VALUES
        (menu_id,'Ana Yemek','Börek Çeşitleri','150 g'),
        (menu_id,'Yan Yemek','Haşlanmış Yumurta','1 adet'),
        (menu_id,'Peynir','Beyaz Peynir','40 g'),
        (menu_id,'Zeytin','Siyah/Yeşil Zeytin','30 g'),
        (menu_id,'Sürülebilir','Reçel/Bal','20 g'),
        (menu_id,'Sebze','Mevsim Sebzeleri','100 g'),
        (menu_id,'Ekmek','Çeyrek Ekmek',''),
        (menu_id,'İçecek','Su','500 ml'),
        (menu_id,'İçecek','Çay/Bitki Çayı','');

END $$;

COMMIT;

-- End of file

