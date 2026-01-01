-- ==========================================
-- BÖLÜM 1: OCAK 2026 KAHVALTI MENÜSÜ
-- ==========================================
DO $$
DECLARE
menu_id INTEGER;
    city_id INTEGER;
BEGIN
    -- Şehir ID'sini al (Manisa)
SELECT "Id" INTO city_id FROM public."Cities" WHERE "Name" = 'Manisa';

-- Eğer Şehir yoksa oluştur (Güvenlik önlemi)
IF city_id IS NULL THEN
        INSERT INTO public."Cities" ("Name") VALUES ('Manisa') RETURNING "Id" INTO city_id;
END IF;

    -- 01 Ocak 2026 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-01', '760 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Yan Yemek', 'Sosis Kokteyl', '150 g'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Reçel Çeşitleri', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 02 Ocak 2026 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-02', '823 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Peynirli Yumurta', '30 g beyaz p. + 1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Peynirli/Dereotlu/sade Poğaca', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Krem Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Tahinli Pekmez', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 03 Ocak 2026 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-03', '705 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Patates Kızartması', '100 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Sürülebilir Çikolata', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 04 Ocak 2026 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-04', '760 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Sucuklu Yumurta', '150 g (1 adet L boy yumurta)'),
                                                                          (menu_id, 'Yan Yemek', 'Kakaolu Kek', '60 g'),
                                                                          (menu_id, 'Peynir', 'Tulum veya Kaşar Peyniri', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 05 Ocak 2026 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-05', '773 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Pizza', '50 g'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Bal+Tereyağ', '20 g + 10 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 06 Ocak 2026 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-06', '865 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Zeytinli/Peynirli/Sade Açma', '1 adet'),
                                                                          (menu_id, 'Yan Yemek', 'Sade Omlet', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Reçel Çeşitleri', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 07 Ocak 2026 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-07', '845 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Karışık Kızartma', '1 adet L boy yumurta + 25 g sucuk'),
                                                                          (menu_id, 'Yan Yemek', 'Haslanmış Yumurta', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Labne Peynir', '20 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Meyve', 'Mandalina', '150-200 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 08 Ocak 2026 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-08', '730 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Kaşarlı Omlet', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Simit', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 09 Ocak 2026 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-09', '823 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Çikolatalı/Peynirli Milföy Börek', '1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Tahinli Pekmez', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 10 Ocak 2026 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-10', '710 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Peynirli Omlet', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Zeytinli/Peynirli Açma', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Reçel Çeşitleri', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 11 Ocak 2026 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-11', '760 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Patates Kızartması', '30 g kaşar + 1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Haslanmış Yumurta', '3 Adet'),
                                                                          (menu_id, 'Peynir', 'Tulum veya Kaşar Peyniri', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 12 Ocak 2026 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-12', '773 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Sucuklu Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Yan Yemek', 'Dereotlu/Peynirli Poğaça', '150 g'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Bal+Tereyağ', '20 g + 10 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 13 Ocak 2026 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-13', '780 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Haslanmış Yumurta', '1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Peynirli/Ispanaklı Börek', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 14 Ocak 2026 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-14', '832 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Sade Omlet', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Simit', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Reçel Çeşitleri', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 15 Ocak 2026 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-15', '875 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Patates Kızartması', '30 g beyaz p. + 1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Haslanmış Yumurta', '50 g'),
                                                                          (menu_id, 'Peynir', 'Krem Peynir', '20 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Sürülebilir Çikolata', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 16 Ocak 2026 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-16', '797 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Kaşarlı Omlet', '120 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Patates', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Tulum veya Kaşar Peyniri', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Meyve', 'Portakal', '150-200 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 17 Ocak 2026 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-17', '870 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Haşlanmış Yumurta', '1 adet L boy yumurta + 25 g sucuk'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Pizza', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 18 Ocak 2026 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-18', '793 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Sade Çikolatalı Açma', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Peynirli Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Tahinli Pekmez', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 19 Ocak 2026 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-19', '985 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Haşlanmış Yumurta', '30 g kaşar + 1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Sosis Koktely', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Bal+Tereyağ', '20 g+10 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 20 Ocak 2026 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-20', '780 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Zeytinli/Peynirli/Sade Poğaca', '1 adet'),
                                                                          (menu_id, 'Yan Yemek', 'Peynirli Omlet', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Reçel Çeşitleri', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 21 Ocak 2026 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-21', '675 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Patates Kızartması', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haslanmış Yumurta', '60 g'),
                                                                          (menu_id, 'Peynir', 'Tulum veya Kaşar Peyniri', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 22 Ocak 2026 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-22', '655 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Simit', '100 g'),
                                                                          (menu_id, 'Yan Yemek', 'Sucuklu Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Meyve', 'Mandalina', '150-200 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 23 Ocak 2026 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-23', '815 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Peynirli Ispanaklı Börek', '30 g beyaz p. + 1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Haslanmış yumurta', '60 g'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Sürülebilir Çikolata', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 24 Ocak 2026 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-24', '710 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Kaşarlı Omlet', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Mozaik Kek', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 25 Ocak 2026 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-25', '743 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Patates Kızartması', '150 g (1 adet L boy yumurta)'),
                                                                          (menu_id, 'Yan Yemek', 'Haslanmış Yumurta', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Labne Peynir', '20 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Tahinli Pekmez', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 26 Ocak 2026 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-26', '875 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Çikolata/Peynirli Milföy Börek' ,'1 adet'),
                                                                          (menu_id, 'Yan Yemek', 'Sade Omlet', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Bal+Tereyağ', '20 g+10 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 27 Ocak 2026 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-27', '870 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Haslanmış Yumurta', '1 adet L boy yumurta + 25 g sucuk'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Pizza', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 28 Ocak 2026 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-28', '815 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Simit', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Peynirli Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Tulum veya Kaşar Peyniri', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Sürülebilir Çikolata', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 29 Ocak 2026 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-29', '927 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Haslanmış Yumurta', '30 g kaşar + 1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Sade/Zeyntinli Açma', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Tatlı', 'Helva', '40 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 30 Ocak 2026 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-30', '752 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Sucuklu Yumurta', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Peynirli/Dereotlu/Sade Poğaça', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Labne Peynir', '20 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Reçel Çeşitleri', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 31 Ocak 2026 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2026-01-31', '923 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Patates Kızartması', '30 g beyaz p. + 1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Tahinli Pekmez', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

END $$;
