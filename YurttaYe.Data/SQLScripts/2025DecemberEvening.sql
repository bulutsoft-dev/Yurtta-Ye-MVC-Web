
-- ==========================================
-- BÖLÜM 2: ARALIK 2025 KAHVALTI MENÜSÜ
-- ==========================================
DO $$
DECLARE
menu_id INTEGER;
    city_id INTEGER;
BEGIN
SELECT "Id" INTO city_id FROM public."Cities" WHERE "Name" = 'Manisa';

-- 01 Aralık 2025 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-01', '760 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Kaşarlı Omlet', '30 g kaşar + 1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Kakaolu Kek', '50 g'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Reçel Çeşitleri', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 02 Aralık 2025 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-02', '865 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Zeytinli/Peynirli/Sade Açma', '1 adet'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Tulum veya Kaşar Peyniri', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Bal+Tereyağ', '20 g + 10 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 03 Aralık 2025 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-03', '845 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Sucuklu Yumurta', '1 adet L boy yumurta + 25 g sucuk'),
                                                                          (menu_id, 'Yan Yemek', 'Peynirli/Dereotlu/Sade Poğaça', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Labne Peynir', '20 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Meyve', 'Mandalina', '150-200 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 04 Aralık 2025 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-04', '730 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Patates Kızartması / Fırın Patates', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 05 Aralık 2025 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-05', '823 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Menemen', '150 g (1 adet L boy yumurta)'),
                                                                          (menu_id, 'Yan Yemek', 'Simit', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Tahinli Pekmez', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 06 Aralık 2025 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-06', '705 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Sosis Kokteyl (Salçalı veya Kızartma)', '100 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Sürülebilir Çikolata', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 07 Aralık 2025 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-07', '760 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Peynirli Omlet', '30 g beyaz p. + 1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Çikolatalı/Peynirli Milföy Börek', '60 g'),
                                                                          (menu_id, 'Peynir', 'Tulum veya Kaşar Peyniri', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 08 Aralık 2025 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-08', '773 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Patates Kızartması / Fırın Patates', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Tahinli Pekmez', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 09 Aralık 2025 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-09', '775 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Sade Omlet', '1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Peynirli/Dereotlu/Sade Poğaça', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 10 Aralık 2025 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-10', '832 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Karışık Pizza', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Reçel Çeşitleri', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 11 Aralık 2025 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-11', '875 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Peynirli Yumurta', '30 g beyaz p. + 1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Simit', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Krem Peynir', '20 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Sürülebilir Çikolata', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 12 Aralık 2025 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-12', '797 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Börek Çeşitleri (Peynirli/Ispanaklı)', '120 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Tulum veya Kaşar Peyniri', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Tatlı', 'Helva', '40 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 13 Aralık 2025 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-13', '870 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Sucuklu Yumurta', '1 adet L boy yumurta + 25 g sucuk'),
                                                                          (menu_id, 'Yan Yemek', 'Zeytinli/Peynirli/Sade Açma', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 14 Aralık 2025 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-14', '793 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Patates Kızartması / Fırın Patates', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Tahinli Pekmez', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 15 Aralık 2025 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-15', '985 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Kaşarlı Omlet', '30 g kaşar + 1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Peynirli/Dereotlu/Sade Poğaça', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Bal+Tereyağ', '20 g+10 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 16 Aralık 2025 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-16', '780 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Karışık Kızartma', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Reçel Çeşitleri', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 17 Aralık 2025 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-17', '675 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Sade Omlet', '1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Peynirli/Çikolatalı Milföy Börek', '60 g'),
                                                                          (menu_id, 'Peynir', 'Tulum veya Kaşar Peyniri', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 18 Aralık 2025 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-18', '655 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Sosis Kokteyl (Salçalı veya Kızartma)', '100 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Meyve', 'Portakal', '150-200 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 19 Aralık 2025 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-19', '815 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Peynirli Omlet', '30 g beyaz p. + 1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Sade/Mozaik Kek', '60 g'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Sürülebilir Çikolata', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 20 Aralık 2025 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-20', '710 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Patates Kızartması / Fırın Patates', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 21 Aralık 2025 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-21', '743 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Menemen', '150 g (1 adet L boy yumurta)'),
                                                                          (menu_id, 'Yan Yemek', 'Simit', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Labne Peynir', '20 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Tahinli Pekmez', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 22 Aralık 2025 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-22', '875 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Zeytinli/Peynirli/Sade Açma', '1 adet'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Bal+Tereyağ', '20 g+10 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 23 Aralık 2025 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-23', '870 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Sucuklu Yumurta', '1 adet L boy yumurta + 25 g sucuk'),
                                                                          (menu_id, 'Yan Yemek', 'Peynirli/Dereotlu/Sade Poğaça', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 24 Aralık 2025 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-24', '815 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Patates Kızartması / Fırın Patates', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Tulum veya Kaşar Peyniri', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Sürülebilir Çikolata', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 25 Aralık 2025 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-25', '927 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Kaşarlı Omlet', '30 g kaşar + 1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Sade/Çikolatalı Açma', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Tatlı', 'Helva', '40 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 26 Aralık 2025 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-26', '752 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Karışık Pizza', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Labne Peynir', '20 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Reçel Çeşitleri', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 27 Aralık 2025 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-27', '923 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Peynirli Omlet', '30 g beyaz p. + 1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Simit', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Tahinli Pekmez', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 28 Aralık 2025 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-28', '710 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Patates Kızartması / Fırın Patates', '150 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 29 Aralık 2025 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-29', '730 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Sade Omlet', '1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Çikolatalı/Peynirli Milföy Börek', '60 g'),
                                                                          (menu_id, 'Peynir', 'Tulum veya Kaşar Peyniri', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Meyve', 'Muz', '150-200 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 30 Aralık 2025 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-30', '830 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Börek Çeşitleri (Peynirli/Ispanaklı)', '120 g'),
                                                                          (menu_id, 'Yan Yemek', 'Haşlanmış Yumurta', '1 adet L boy'),
                                                                          (menu_id, 'Peynir', 'Kaşar Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sürülebilir', 'Sürülebilir Çikolata', '20 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

-- 31 Aralık 2025 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Kahvaltı', '2025-12-31', '840 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Ana Yemek', 'Peynirli Yumurta', '30 g beyaz p. + 1 adet L boy yumurta'),
                                                                          (menu_id, 'Yan Yemek', 'Simit', '1 adet'),
                                                                          (menu_id, 'Peynir', 'Beyaz Peynir', '40 g'),
                                                                          (menu_id, 'Zeytin', 'Siyah/Yeşil Zeytin', '30 g'),
                                                                          (menu_id, 'Sebze', 'Mevsim Sebzeleri Söğüş', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml'),
                                                                          (menu_id, 'İçecek', 'Çay/Bitki Çayı', '');

END $$;

COMMIT;