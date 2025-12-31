

-- ==========================================
-- BÖLÜM 2: OCAK 2026 AKŞAM YEMEĞİ MENÜSÜ
-- ==========================================
DO $$
DECLARE
menu_id INTEGER;
    city_id INTEGER;
BEGIN
SELECT "Id" INTO city_id FROM public."Cities" WHERE "Name" = 'Manisa';

-- 01 Ocak 2026 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-01', '1051-1146 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Salçalı Şehriye Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Manisa Kebabı (Pide-Domates-Fırın Biber)', '90 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Nohut Yemeği', '200 g'),
                                                                          (menu_id, 'Pilav', 'Bulgur Pilavı', '200 g'),
                                                                          (menu_id, 'Salata', 'Haydari', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 02 Ocak 2026 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-02', '1027-1202 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Ezogelin Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuk Çökertme', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'İmambayıldı', '200 g'),
                                                                          (menu_id, 'Makarna', 'Makarna (Yoğurt veya Sos ile)', '200 g'),
                                                                          (menu_id, 'Salata', 'Karışık Turşu', '150 g/80 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 03 Ocak 2026 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-04', '1157-1267 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Domates Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Çıtır Tavuk Burger (90 g Tavuk+Patates)', '150 g + 50 g'),
                                                                          (menu_id, 'Yan Yemek', 'Kış Kızartması (Karnabahar, Havuç, Patates)', '200 g + 20 g yoğurt'),
                                                                          (menu_id, 'Makarna', 'Makarna', '200 g'),
                                                                          (menu_id, 'İçecek', 'Ayran', '170/200 ml'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 04 Ocak 2026 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-03', '988-1257 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Salçalı Mercimek Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Kuru Fasulye', '200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Fellah Köfte (Yoğurt veya Sos ile)', '250 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Tatlı', 'Cevizli Baklava', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 05 Ocak 2026 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-05', '843-1106 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Tarhana Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tas Kebabı', '90 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Taze Fasulye Yemeği', '200 g'),
                                                                          (menu_id, 'Pilav', 'Bulgur Pilavı', '200 g'),
                                                                          (menu_id, 'Salata', 'Marul Salata veya Karışık Turşu', '50 g/80 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 06 Ocak 2026 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-06', '916-1067 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Mahluta Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuk Tantuni (Lavaş/Ekmek + Domates + Soğan)', '100 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Barbunya Yemeği', '200 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Salata', 'Havuç Tarator', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 07 Ocak 2026 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-07', '1175-1333 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Ezogelin Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Ekşili Köfte (Yoğurt ile)', '60 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Dolma', '200 g + 20 g yoğurt'),
                                                                          (menu_id, 'Makarna', 'Spagetti (Yoğurt-Sos ile)', '200 g'),
                                                                          (menu_id, 'Tatlı', 'Meyveli Pasta', '120 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 08 Ocak 2026 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-08', '928-1175 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Domates Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Nohut Yemeği', '200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Mücver', '200 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Salata', 'Karışık Salata veya Turşu', '100 g/80 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 09 Ocak 2026 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-09', '983-1289 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Salçalı Mercimek Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Çıtır Tavuk (Patates Kızartması ile)', '100 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Mevsim Türlü', '200 g'),
                                                                          (menu_id, 'Makarna', 'Makarna (Yoğurt/Sos ile)', '200 g'),
                                                                          (menu_id, 'Meyve', 'Muz', '150-200 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 10 Ocak 2026 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-10', '1096-1130 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Tarhana Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Izgara Köfte (Piyaz/Domates-Fırın Biber)', '90 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Kızartma (Yoğurt/Sos ile)', '200 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Tatlı', 'Sütlü İrmik Tatlısı', '150 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 11 Ocak 2026 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-11', '954-1144 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Yayla Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Fırın Sebzeli Tavuk', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Fellah Köfte (Yoğurt veya Sos ile)', '200 g'),
                                                                          (menu_id, 'Makarna', 'Makarna', '200 g'),
                                                                          (menu_id, 'Salata', 'Yoğurtlu Mor Lahana Salatası', '150 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 12 Ocak 2026 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-12', '815-1190 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Salçalı Arpa Şehriye Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Çoban Kavurma', '90 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Kuru Fasulye', '200 g'),
                                                                          (menu_id, 'Pilav', 'Şehriyeli Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'İçecek', 'Ayran', '170/200 ml'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 13 Ocak 2026 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-13', '865-1155 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Salçalı Mercimek Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuk Şiş (Elma Dilim Patates ile)', '100 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Sebze Graten', '200 g'),
                                                                          (menu_id, 'Pilav', 'Bulgur Pilavı', '200 g'),
                                                                          (menu_id, 'Salata', 'Marul Salatası veya Karışık Turşu', '50 g/80 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 14 Ocak 2026 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-14', '825-1030 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Domates Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Kuru Köfte (Domates-Biber-Soğan)', '90 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Taze Fasulye Yemeği', '200 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Salata', 'Piyaz veya Haydari', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 15 Ocak 2026 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-15', '1225-1460 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Ezogelin Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Etli Sultan Kebabı', '90 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Sarma (Yoğurt ile)', '200 g + 20 g'),
                                                                          (menu_id, 'Makarna', 'Makarna (Yoğurt/Sos ile)', '200 g'),
                                                                          (menu_id, 'Tatlı', 'Cevizli Kadayıf', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 16 Ocak 2026 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-16', '935-1045 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Mercimek Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuk Sote', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Mücver', '200 g'),
                                                                          (menu_id, 'Ana Yemek', 'Mantı (Yoğurt ve Sos ile)', '200 g'),
                                                                          (menu_id, 'Salata', 'Ege Salata veya Karışık Turşu', '150 g/80 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 17 Ocak 2026 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-17', '1155-1365 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Tavuk Suyu Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Kuru Fasulye Yemeği', '200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Kızartma (Yoğurt veya Sos ile)', '200 g + 20 g'),
                                                                          (menu_id, 'Pilav', 'Şehriyeli Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Tatlı', 'Haşhaşlı Revani', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 18 Ocak 2026 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-18', '1050-1125 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Yayla Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Beşamel Soslu Tavuk', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'İmambayıldı', '200 g'),
                                                                          (menu_id, 'Pilav', 'Bulgur Pilavı', '200 g'),
                                                                          (menu_id, 'Salata', 'Yoğurtlu Rus Salatası', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 19 Ocak 2026 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-19', '995-1195 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Yüksük Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'İzmir Köfte', '250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Ispanak Yemeği (Yoğurtlu) / Ispanak Graten', '200 g + 50 g'),
                                                                          (menu_id, 'Pilav', 'Şehriye Pilavı', '150 g'),
                                                                          (menu_id, 'Salata', 'Cacık', '150 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 20 Ocak 2026 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-20', '1330-1385 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Toyga Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuk Tantuni (Ekmek veya Lavaş, Domates+Soğan)', '100 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Dolma (Yoğurt ile)', '200 g + 20 g'),
                                                                          (menu_id, 'Makarna', 'Makarna (Sos ile)', '200 g'),
                                                                          (menu_id, 'Tatlı', 'Triliçe', '150 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 21 Ocak 2026 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-21', '945-1175 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Tavuk Suyu Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Nohut Yemeği', '200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Kızartma (Yoğurt ile)', '200 g + 20 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Salata', 'Karışık Salata veya Karışık Turşu', '100 g/80 g'),
                                                                          (menu_id, 'Meyve', 'Mandalina', '150-200 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 22 Ocak 2026 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-22', '925-1195 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Salçalı Mercimek Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuk Kavurma', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Taze Fasulye Yemeği', '200 g'),
                                                                          (menu_id, 'Makarna', 'Makarna (Yoğurt veya Sos ile)', '200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Şakşuka', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 23 Ocak 2026 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-23', '1445-1480 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Domates Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Et Sote', '90 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karnabahar Kızartma (Yoğurt ile)', '200 g + 20 g'),
                                                                          (menu_id, 'Pilav', 'Bulgur Pilavı', '200 g'),
                                                                          (menu_id, 'Tatlı', 'Çikolatalı Yaş Pasta', '120 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 24 Ocak 2026 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-24', '830-965 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Ezogelin Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Mantarlı Tavuk Sote', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Kuru Fasulye Yemeği', '200 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Salata', 'Aysberg Salata veya Karışık Turşu', '50 g/80 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 25 Ocak 2026 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-25', '960-1185 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Mercimek Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Beğendili Köfte', '90 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Sarma (Yoğurt ile)', '200 g + 20 g'),
                                                                          (menu_id, 'Makarna', 'Makarna (Sos ile)', '200 g'),
                                                                          (menu_id, 'İçecek', 'Ayran', '170-200 ml'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 26 Ocak 2026 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-26', '1250-1425 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Tavuksuyu Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Nohut Yemeği', '200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Mücver (Yoğurt ile)', '200 g + 20 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Tatlı', 'Tulumba Tatlısı', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 27 Ocak 2026 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-27', '920-1200 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Yayla Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuk Çökertme', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Bezelye Yemeği', '200 g'),
                                                                          (menu_id, 'Ana Yemek', 'Mantı (Yoğurt/Sos ile)', '200 g'),
                                                                          (menu_id, 'Salata', 'Biber Tarator', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 28 Ocak 2026 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-28', '845-1070 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Ezogelin Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tas Kebabı', '250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Sebze Graten', '200 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Salata', 'Çoban Salata veya Karışık Turşu', '150 g/80 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 29 Ocak 2026 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-29', '1070-1390 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Mercimek Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuk Şiş (Domates+Fırın Biber+Soğan)', '100 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Taze Fasulye Yemeği', '200 g'),
                                                                          (menu_id, 'Makarna', 'Makarna (Yoğurt veya Sos ile)', '200 g'),
                                                                          (menu_id, 'Tatlı', 'Sütlaç', '150 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 30 Ocak 2026 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-30', '950-1000 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Toyga Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Akçaabat Köfte (Piyaz/Soğan Salatası ile)', '90 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Kızartma (Yoğurt/Sos ile)', '200 g + 20 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Salata', 'Kuru Cacık', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 31 Ocak 2026 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2026-01-31', '925-1255 kkal') RETURNING "Id" INTO menu_id;
INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Ezogelin Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Izgara Tavuk (Domates-Fırın Biber-Soğan)', '100 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Kuru Fasulye Yemeği', '200 g'),
                                                                          (menu_id, 'Pilav', 'Bulgur Pilavı', '200 g'),
                                                                          (menu_id, 'Salata', 'Akdeniz Salata veya Karışık Turşu', '100 g/80 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

END $$;