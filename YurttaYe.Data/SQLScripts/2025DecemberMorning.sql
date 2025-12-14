BEGIN;

-- Güvenlik ve Ayarlar
ALTER TABLE public."Cities" DISABLE ROW LEVEL SECURITY;
ALTER TABLE public."Menus" DISABLE ROW LEVEL SECURITY;
ALTER TABLE public."MenuItems" DISABLE ROW LEVEL SECURITY;

-- Şehir Kontrolü (Manisa)
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM public."Cities" WHERE "Name" = 'Manisa') THEN
        INSERT INTO public."Cities" ("Name") VALUES ('Manisa');
END IF;
END $$;

-- ==========================================
-- BÖLÜM 1: ARALIK 2025 AKŞAM YEMEĞİ MENÜSÜ
-- ==========================================
DO $$
DECLARE
menu_id INTEGER;
    city_id INTEGER;
BEGIN
SELECT "Id" INTO city_id FROM public."Cities" WHERE "Name" = 'Manisa';

-- 01 Aralık 2025 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-01', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Salçalı Mercimek Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuk Külbastı (Domates, Fırın Biber-Soğan ile)', '100 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Kızartma (Sos ile)', '200 g'),
                                                                          (menu_id, 'Pilav', 'Sebzeli Bulgur Pilavı', '200 g'),
                                                                          (menu_id, 'Salata', 'Cacık', '150 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 02 Aralık 2025 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-02', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Tarhana Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Izgara Köfte (Fırın Patates)', '90 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Barbunya Yemeği', '200 g'),
                                                                          (menu_id, 'Makarna', 'Makarna (Sos/Yoğurt ile)', '200 g'),
                                                                          (menu_id, 'Tatlı', 'Supangle', '150 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 03 Aralık 2025 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-03', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Yüksük Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Köri Soslu Tavuk', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'İmambayıldı', '200 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Salata', 'Aysberg Salata', '50 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 04 Aralık 2025 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-04', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Tavuksuyu Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Et Sote', '90 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Ispanak Yemeği / Ispanak Graten', '200 g + 20 g yoğurt'),
                                                                          (menu_id, 'Pilav', 'Bulgur Pilavı', '200 g'),
                                                                          (menu_id, 'Salata', 'Kuru Cacık', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 05 Aralık 2025 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-05', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Domates Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuk Fajita', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Dolma', '200 g + 20 g yoğurt'),
                                                                          (menu_id, 'Makarna', 'Makarna (Yoğurt/Sos ile)', '200 g'),
                                                                          (menu_id, 'Salata', 'Ege Salata', '150 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 06 Aralık 2025 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-06', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Salçalı Şehriye Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Kuru Fasulye', '200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Patates Yemeği', '200 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Tatlı', 'Cevizli Kadayıf', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 07 Aralık 2025 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-07', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Erişteli Yeşil Mercimek Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuklu Sultan Kebabı', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karnabahar Kızartması', '200 g + 20 g yoğurt'),
                                                                          (menu_id, 'Pilav', 'Bulgur Pilavı', '200 g'),
                                                                          (menu_id, 'Salata', 'Yoğurtlu Mor Lahana Salatası', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 08 Aralık 2025 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-08', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Ezogelin Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Hünkar Beğendi', '90 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Mücver (Yoğurt ile)', '200 g + 20 g yoğurt'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Tatlı', 'Kemalpaşa (Hindistan Cevizi ile)', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 09 Aralık 2025 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-09', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Yayla Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Küp Piliç Lokum (Küp Patates ile)', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Sebze Sote', '200 g'),
                                                                          (menu_id, 'Makarna', 'Makarna (Sos/Yoğurt ile)', '200 g'),
                                                                          (menu_id, 'Salata', 'Havuç Aysberg Salata', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 10 Aralık 2025 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-10', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Yüksük Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Kaşarlı Köfte (Piyaz/Domates + Fırın Biber-Soğan)', '90 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Taze Fasulye', '200 g'),
                                                                          (menu_id, 'Pilav', 'Şehriyeli Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Tatlı', 'Kabak Tatlısı', '150 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 11 Aralık 2025 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-11', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Tarhana Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuk Kavurma (Fırın Küp Patates ile)', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Sarma', '200 g + 20 g yoğurt'),
                                                                          (menu_id, 'Makarna', 'Makarna (Sos ile)', '200 g'),
                                                                          (menu_id, 'Salata', 'Havuç Tarator', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 12 Aralık 2025 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-12', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Şehriye Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Nohut Yemeği', '200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Kızartma (Sos ile)', '200 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Salata', 'Kaşık Salata', '150 g'),
                                                                          (menu_id, 'Tatlı', 'Yoğurt', '120 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 13 Aralık 2025 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-13', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Tavuksuyu Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Ekşili Sulu Köfte', '60 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Çıtır Karnabahar', '200 g'),
                                                                          (menu_id, 'Makarna', 'Makarna (Sos ile)', '200 g'),
                                                                          (menu_id, 'Salata', 'Yoğurtlu Biber Tarator', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 14 Aralık 2025 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-14', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Toyga Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuk Tantuni (Lavaş+Domates+Soğan)', '100 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Bezelye Yemeği', '200 g'),
                                                                          (menu_id, 'Pilav', 'Sebzeli Bulgur Pilavı', '200 g'),
                                                                          (menu_id, 'Tatlı', 'Meyveli Pasta', '120 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 15 Aralık 2025 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-15', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Tarhana Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Kuşbaşılı Patlıcan Kebabı', '90 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Kurufasulye', '200 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'İçecek', 'Ayran', '170-200 ml'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 16 Aralık 2025 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-16', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Yüksük Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Izgara Tavuk (Izgara Sebze ile)', '100 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Ispanak Yemeği / Ispanak Graten', '200 g + 20 g yoğurt'),
                                                                          (menu_id, 'Pilav', 'Bulgur Pilavı', '200 g'),
                                                                          (menu_id, 'Salata', 'Marul Salata', '50 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 17 Aralık 2025 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-17', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Domates Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Manisa Kebabı (Pide+Domates+Fırın Biber-Soğan)', '90 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Kış Kızartma (Karnabahar-Havuç-Patates)', '200 g'),
                                                                          (menu_id, 'Ana Yemek', 'Mantı (Yoğurt ve Sos ile)', '200 g'),
                                                                          (menu_id, 'Salata', 'Piyaz', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 18 Aralık 2025 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-18', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Ezogelin Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuk Çökertme', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'İmambayıldı', '200 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Tatlı', 'Çıtır Kadayıflı Muhallebi', '150 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 19 Aralık 2025 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-19', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Erişteli Yeşil Mercimek Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Orman Kebabı', '90 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Mücver (Yoğurt ile)', '200 g + 20 g yoğurt'),
                                                                          (menu_id, 'Pilav', 'Bulgur Pilavı', '200 g'),
                                                                          (menu_id, 'Salata', 'Çoban Salata', '150 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 20 Aralık 2025 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-20', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Salçalı Şehriye Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Çıtır Tavuk (Patates Kızartması ile)', '100 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Dolma', '200 g + 20 g yoğurt'),
                                                                          (menu_id, 'Makarna', 'Makarna (Sos/Yoğurt ile)', '200 g'),
                                                                          (menu_id, 'Tatlı', 'Cevizli Baklava', '100 g/200 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 21 Aralık 2025 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-21', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Tavuksuyu Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Kuru Fasulye', '200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Kızartma (Sos ile)', '200 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Salata', 'Kuru Cacık', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 22 Aralık 2025 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-22', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Salçalı Mercimek Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Fırında Sebzeli Tavuk', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Mevsim Türlü', '200 g'),
                                                                          (menu_id, 'Ana Yemek', 'Mantı (Yoğurt ve Sos ile)', '200 g'),
                                                                          (menu_id, 'Salata', 'Ege Salata', '150 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 23 Aralık 2025 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-23', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Toyga Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Çoban Kavurma', '90 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Çıtır Karnabahar', '200 g + 20 g yoğurt'),
                                                                          (menu_id, 'Pilav', 'Şehriyeli Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Meyve', 'Mandalina', '150-200 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 24 Aralık 2025 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-24', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Yüksük Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuk Sote', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Taze Fasulye', '200 g'),
                                                                          (menu_id, 'Pilav', 'Bulgur Pilavı', '200 g'),
                                                                          (menu_id, 'Salata', 'Marul Salata', '50 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 25 Aralık 2025 Perşembe
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-25', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Domates Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Karnıyarık', '60 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Nohut Yemeği', '200 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Salata', 'Kuru Cacık', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 26 Aralık 2025 Cuma
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-26', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Yayla Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Beşamel Soslu Mantarlı Tavuk', '100 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Patates Yemeği', '200 g'),
                                                                          (menu_id, 'Makarna', 'Makarna (Sos/Yoğurt ile)', '200 g'),
                                                                          (menu_id, 'Salata', 'Karışık Salata', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 27 Aralık 2025 Cumartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-27', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Ezogelin Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Kuru Fasulye', '200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Kızartma (Yoğurt/Sos ile)', '200 g'),
                                                                          (menu_id, 'Pilav', 'Şehriyeli Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Tatlı', 'Kalburabastı', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'Salata', 'Karışık Turşu', '80 g'),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 28 Aralık 2025 Pazar
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-28', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Tarhana Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Izgara Köfte (Lavaş+Domates+Fırın Biber-Soğan)', '90 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Sebze Graten', '200 g'),
                                                                          (menu_id, 'Pilav', 'Sebzeli Bulgur Pilavı', '200 g'),
                                                                          (menu_id, 'İçecek', 'Ayran', '170-200 ml'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 29 Aralık 2025 Pazartesi
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-29', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Mercimek Çorbası', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Tavuk Fajita', '100/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Dolma', '200 g + 20 g yoğurt'),
                                                                          (menu_id, 'Makarna', 'Makarna (Sos/Yoğurt ile)', '200 g'),
                                                                          (menu_id, 'Tatlı', 'Supangle', '150 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 30 Aralık 2025 Salı
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-30', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Yüksük Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Etli Sultan Kebabı', '90 g/250 g'),
                                                                          (menu_id, 'Yan Yemek', 'Bezelye Yemeği', '200 g'),
                                                                          (menu_id, 'Pilav', 'Bulgur Pilavı', '200 g'),
                                                                          (menu_id, 'Salata', 'Cacık', '100 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');

-- 31 Aralık 2025 Çarşamba
INSERT INTO public."Menus" ("CityId", "MealType", "Date", "Energy")
VALUES (city_id, 'Akşam Yemeği', '2025-12-31', '900-1100 kkal') RETURNING "Id" INTO menu_id;

INSERT INTO public."MenuItems" ("MenuId", "Category", "Name", "Gram") VALUES
                                                                          (menu_id, 'Çorba', 'Ezogelin Çorba', '250 g'),
                                                                          (menu_id, 'Ana Yemek', 'Çıtır Tavuk (Patates Kızartması ile)', '100 g/200 g'),
                                                                          (menu_id, 'Yan Yemek', 'Karışık Kızartma (Yoğurt/Sos ile)', '200 g'),
                                                                          (menu_id, 'Pilav', 'Pirinç Pilavı', '150 g'),
                                                                          (menu_id, 'Tatlı', 'Mozaik Pasta', '120 g'),
                                                                          (menu_id, 'Ekmek', 'Çeyrek Ekmek', ''),
                                                                          (menu_id, 'İçecek', 'Su', '500 ml');
END $$;

