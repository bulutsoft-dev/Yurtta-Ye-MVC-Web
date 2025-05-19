BEGIN;

-- Tabloları sıfırla (opsiyonel, mevcut verileri siler)
TRUNCATE public."MenuItems", public."Menus", public."Cities" RESTART IDENTITY;

-- Row-Level Security’yi kapat
ALTER TABLE public."Cities" DISABLE ROW LEVEL SECURITY;
ALTER TABLE public."Menus" DISABLE ROW LEVEL SECURITY;
ALTER TABLE public."MenuItems" DISABLE ROW LEVEL SECURITY;

-- Manisa’yı Cities’e ekle
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM public."Cities" WHERE "Name" = 'Manisa') THEN
        INSERT INTO public."Cities" ("Id", "Name") VALUES (1, 'Manisa');
    END IF;
END $$;

-- 1 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (1, 1, 'Kahvaltı', '2025-05-01', '780 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(1, 1, 'Main Dish', 'Sade Omlet', '1 adet L boy yumurta'),
(2, 1, 'Side', 'Poğaça Çeşitleri (Dere Otlu-Sade)', '1 adet'),
(3, 1, 'Cheese', 'Kaşar Peynir', '40 g'),
(4, 1, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(5, 1, 'Vegetable', 'Mevsim Sebzeleri Söğüş', '100 g'),
(6, 1, 'Bread', 'Çeyrek Ekmek', ''),
(7, 1, 'Drink', 'Su', '500 ml'),
(8, 1, 'Drink', 'Çay/Bitki Çayı', '');

-- 2 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (2, 1, 'Kahvaltı', '2025-05-02', '845 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(9, 2, 'Main Dish', 'Karışık Pizza', '150 g'),
(10, 2, 'Side', 'Haşlanmış Yumurta', '1 adet L boy'),
(11, 2, 'Cheese', 'Beyaz Peynir', '40 g'),
(12, 2, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(13, 2, 'Spread', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
(14, 2, 'Bread', 'Çeyrek Ekmek', ''),
(15, 2, 'Drink', 'Su', '500 ml'),
(16, 2, 'Drink', 'Çay/Bitki Çayı', '');

-- 3 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (3, 1, 'Kahvaltı', '2025-05-03', '965 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(17, 3, 'Main Dish', 'Sucuklu Yumurta', '1 adet L boy yumurta+ 25 g beyaz etli'),
(18, 3, 'Side', 'Sade Açma', '1 adet'),
(19, 3, 'Cheese', 'Tulum veya Beyaz Peynir', '40 g'),
(20, 3, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(21, 3, 'Spread', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
(22, 3, 'Bread', 'Çeyrek Ekmek', ''),
(23, 3, 'Drink', 'Su', '500 ml'),
(24, 3, 'Drink', 'Çay/Bitki Çayı', '');

-- 4 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (4, 1, 'Kahvaltı', '2025-05-04', '830 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(25, 4, 'Main Dish', 'Patates Kızartması/Fırın Patates', '150 g'),
(26, 4, 'Side', 'Haşlanmış Yumurta', '1 adet L boy'),
(27, 4, 'Cheese', 'Beyaz Peynir', '40 g'),
(28, 4, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(29, 4, 'Vegetable', 'Mevsim Sebzeleri Söğüş', '100 g'),
(30, 4, 'Bread', 'Çeyrek Ekmek', ''),
(31, 4, 'Drink', 'Su', '500 ml'),
(32, 4, 'Drink', 'Çay/Bitki Çayı', '');

-- 5 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (5, 1, 'Kahvaltı', '2025-05-05', '630 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(33, 5, 'Main Dish', 'Menemen', '150 g (1 adet L boy yumurta)'),
(34, 5, 'Side', 'Çikolatalı/Peynirli Milföy Börek', '60 g'),
(35, 5, 'Cheese', 'Labne Peynir/Krem Peynir', '20 g'),
(36, 5, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(37, 5, 'Spread', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
(38, 5, 'Bread', 'Çeyrek Ekmek', ''),
(39, 5, 'Drink', 'Su', '500 ml'),
(40, 5, 'Drink', 'Çay/Bitki Çayı', '');

-- 6 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (6, 1, 'Kahvaltı', '2025-05-06', '610 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(41, 6, 'Main Dish', 'Sosis Kokteyl (Salçalı veya Kızartma)', '100 g'),
(42, 6, 'Side', 'Haşlanmış Yumurta', '1 adet L boy'),
(43, 6, 'Cheese', 'Beyaz Peynir', '40 g'),
(44, 6, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(45, 6, 'Vegetable', 'Mevsim Sebzeleri Söğüş', '100 g'),
(46, 6, 'Bread', 'Çeyrek Ekmek', ''),
(47, 6, 'Drink', 'Su', '500 ml'),
(48, 6, 'Drink', 'Çay/Bitki Çayı', '');

-- 7 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (7, 1, 'Kahvaltı', '2025-05-07', '785 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(49, 7, 'Main Dish', 'Kaşarlı Omlet', '30 g kaşar p.+ 1 adet L boy yumurta'),
(50, 7, 'Side', 'Mozaik Kek', '50 g'),
(51, 7, 'Cheese', 'Tulum veya Beyaz Peynir', '40 g'),
(52, 7, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(53, 7, 'Spread', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
(54, 7, 'Bread', 'Çeyrek Ekmek', ''),
(55, 7, 'Drink', 'Su', '500 ml'),
(56, 7, 'Drink', 'Çay/Bitki Çayı', '');

-- 8 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (8, 1, 'Kahvaltı', '2025-05-08', '765 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(57, 8, 'Main Dish', 'Patates Kavurması veya Patates Salatası', '150 g'),
(58, 8, 'Side', 'Haşlanmış Yumurta', '1 adet L boy'),
(59, 8, 'Cheese', 'Beyaz Peynir', '40 g'),
(60, 8, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(61, 8, 'Spread', 'Helva', '40 g'),
(62, 8, 'Bread', 'Çeyrek Ekmek', ''),
(63, 8, 'Drink', 'Su', '500 ml'),
(64, 8, 'Drink', 'Çay/Bitki Çayı', '');

-- 9 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (9, 1, 'Kahvaltı', '2025-05-09', '950 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(65, 9, 'Main Dish', 'Peynirli Omlet', '30 g beyaz p.+ 1 adet L boy yumurta'),
(66, 9, 'Side', 'Simit', '1 adet'),
(67, 9, 'Cheese', 'Kaşar Peynir', '40 g'),
(68, 9, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(69, 9, 'Spread', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
(70, 9, 'Bread', 'Çeyrek Ekmek', ''),
(71, 9, 'Drink', 'Su', '500 ml'),
(72, 9, 'Drink', 'Çay/Bitki Çayı', '');

-- 10 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (10, 1, 'Kahvaltı', '2025-05-10', '830 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(73, 10, 'Main Dish', 'Patates Kızartması/Fırın Patates', '150 g'),
(74, 10, 'Side', 'Haşlanmış Yumurta', '1 adet L boy'),
(75, 10, 'Cheese', 'Beyaz Peynir', '40 g'),
(76, 10, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(77, 10, 'Vegetable', 'Mevsim Sebzeleri Söğüş', '100 g'),
(78, 10, 'Bread', 'Çeyrek Ekmek', ''),
(79, 10, 'Drink', 'Su', '500 ml'),
(80, 10, 'Drink', 'Çay/Bitki Çayı', '');

-- 11 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (11, 1, 'Kahvaltı', '2025-05-11', '920 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(81, 11, 'Main Dish', 'Sade Omlet', '1 adet L boy yumurta'),
(82, 11, 'Side', 'Zeytinli/Peynirli Açma', '1 adet'),
(83, 11, 'Cheese', 'Kaşar Peynir', '40 g'),
(84, 11, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(85, 11, 'Spread', 'Bal+Tereyağ', '20 g+10 g'),
(86, 11, 'Bread', 'Çeyrek Ekmek', ''),
(87, 11, 'Drink', 'Su', '500 ml'),
(88, 11, 'Drink', 'Çay/Bitki Çayı', '');

-- 12 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (12, 1, 'Kahvaltı', '2025-05-12', '660 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(89, 12, 'Main Dish', 'Börek Çeşitleri (Peynirli/Ispanaklı)', '120 g'),
(90, 12, 'Side', 'Haşlanmış Yumurta', '1 adet L boy'),
(91, 12, 'Cheese', 'Labne Peynir/Krem Peynir', '20 g'),
(92, 12, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(93, 12, 'Vegetable', 'Mevsim Sebzeleri Söğüş', '100 g'),
(94, 12, 'Bread', 'Çeyrek Ekmek', ''),
(95, 12, 'Drink', 'Su', '500 ml'),
(96, 12, 'Drink', 'Çay/Bitki Çayı', '');

-- 13 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (13, 1, 'Kahvaltı', '2025-05-13', '810 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(97, 13, 'Main Dish', 'Sucuklu Yumurta', '1 adet L boy yumurta+ 25 g beyaz etli'),
(98, 13, 'Side', 'Peynirli/Çikolatalı Milföy Börek', '60 g'),
(99, 13, 'Cheese', 'Beyaz Peynir', '40 g'),
(100, 13, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(101, 13, 'Spread', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
(102, 13, 'Bread', 'Çeyrek Ekmek', ''),
(103, 13, 'Drink', 'Su', '500 ml'),
(104, 13, 'Drink', 'Çay/Bitki Çayı', '');

-- 14 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (14, 1, 'Kahvaltı', '2025-05-14', '935 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(105, 14, 'Main Dish', 'Patates Kızartması/Fırın Patates', '150 g'),
(106, 14, 'Side', 'Haşlanmış Yumurta', '1 adet L boy'),
(107, 14, 'Cheese', 'Kaşar Peynir', '40 g'),
(108, 14, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(109, 14, 'Spread', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
(110, 14, 'Bread', 'Çeyrek Ekmek', ''),
(111, 14, 'Drink', 'Su', '500 ml'),
(112, 14, 'Drink', 'Çay/Bitki Çayı', '');

-- 15 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (15, 1, 'Kahvaltı', '2025-05-15', '765 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(113, 15, 'Main Dish', 'Sade Omlet', '1 adet L boy yumurta'),
(114, 15, 'Side', 'Poğaça Çeşitleri (Dere Otlu-Sade)', '1 adet'),
(115, 15, 'Cheese', 'Tulum veya Beyaz Peynir', '40 g'),
(116, 15, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(117, 15, 'Vegetable', 'Mevsim Sebzeleri Söğüş', '100 g'),
(118, 15, 'Bread', 'Çeyrek Ekmek', ''),
(119, 15, 'Drink', 'Su', '500 ml'),
(120, 15, 'Drink', 'Çay/Bitki Çayı', '');

-- 16 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (16, 1, 'Kahvaltı', '2025-05-16', '845 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(121, 16, 'Main Dish', 'Karışık Pizza', '150 g'),
(122, 16, 'Side', 'Haşlanmış Yumurta', '1 adet L boy'),
(123, 16, 'Cheese', 'Beyaz Peynir', '40 g'),
(124, 16, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(125, 16, 'Spread', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
(126, 16, 'Bread', 'Çeyrek Ekmek', ''),
(127, 16, 'Drink', 'Su', '500 ml'),
(128, 16, 'Drink', 'Çay/Bitki Çayı', '');

-- 17 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (17, 1, 'Kahvaltı', '2025-05-17', '835 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(129, 17, 'Main Dish', 'Menemen', '150 g (1 adet L boy yumurta)'),
(130, 17, 'Side', 'Simit', '1 adet'),
(131, 17, 'Cheese', 'Kaşar Peynir', '40 g'),
(132, 17, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(133, 17, 'Fruit', 'Muz', '150-200 g'),
(134, 17, 'Bread', 'Çeyrek Ekmek', ''),
(135, 17, 'Drink', 'Su', '500 ml'),
(136, 17, 'Drink', 'Çay/Bitki Çayı', '');

-- 18 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (18, 1, 'Kahvaltı', '2025-05-18', '770 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(137, 18, 'Main Dish', 'Karışık Kızartma', '150 g'),
(138, 18, 'Side', 'Haşlanmış Yumurta', '1 adet L boy'),
(139, 18, 'Cheese', 'Tulum veya Beyaz Peynir', '40 g'),
(140, 18, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(141, 18, 'Spread', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
(142, 18, 'Bread', 'Çeyrek Ekmek', ''),
(143, 18, 'Drink', 'Su', '500 ml'),
(144, 18, 'Drink', 'Çay/Bitki Çayı', '');

-- 19 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (19, 1, 'Kahvaltı', '2025-05-19', '675 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(145, 19, 'Main Dish', 'Sucuklu Yumurta', '1 adet L boy yumurta+ 25 g beyaz etli'),
(146, 19, 'Side', 'Patates Haşlama', '100 g'),
(147, 19, 'Cheese', 'Beyaz Peynir', '40 g'),
(148, 19, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(149, 19, 'Vegetable', 'Mevsim Sebzeleri Söğüş', '100 g'),
(150, 19, 'Bread', 'Çeyrek Ekmek', ''),
(151, 19, 'Drink', 'Su', '500 ml'),
(152, 19, 'Drink', 'Çay/Bitki Çayı', '');

-- 20 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (20, 1, 'Kahvaltı', '2025-05-20', '710 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(153, 20, 'Main Dish', 'Sosis Kokteyl (Salçalı veya Kızartma)', '100 g'),
(154, 20, 'Side', 'Haşlanmış Yumurta', '1 adet L boy'),
(155, 20, 'Cheese', 'Kaşar Peynir', '40 g'),
(156, 20, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(157, 20, 'Spread', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
(158, 20, 'Bread', 'Çeyrek Ekmek', ''),
(159, 20, 'Drink', 'Su', '500 ml'),
(160, 20, 'Drink', 'Çay/Bitki Çayı', '');

-- 21 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (21, 1, 'Kahvaltı', '2025-05-21', '990 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(161, 21, 'Main Dish', 'Patatesli Yumurta', '150 g (1 adet L boy yumurta)'),
(162, 21, 'Side', 'Sade Poğaça', '1 adet'),
(163, 21, 'Cheese', 'Beyaz Peynir', '40 g'),
(164, 21, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(165, 21, 'Vegetable', 'Mevsim Sebzeleri Söğüş', '100 g'),
(166, 21, 'Bread', 'Çeyrek Ekmek', ''),
(167, 21, 'Drink', 'Su', '500 ml'),
(168, 21, 'Drink', 'Çay/Bitki Çayı', '');

-- 22 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (22, 1, 'Kahvaltı', '2025-05-22', '875 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(169, 22, 'Main Dish', 'Zeytinli/Peynirli Açma', '1 adet'),
(170, 22, 'Side', 'Haşlanmış Yumurta', '1 adet L boy'),
(171, 22, 'Cheese', 'Kaşar Peynir', '40 g'),
(172, 22, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(173, 22, 'Spread', 'Bal+Tereyağ', '20 g+10 g'),
(174, 22, 'Bread', 'Çeyrek Ekmek', ''),
(175, 22, 'Drink', 'Su', '500 ml'),
(176, 22, 'Drink', 'Çay/Bitki Çayı', '');

-- 23 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (23, 1, 'Kahvaltı', '2025-05-23', '675 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(177, 23, 'Main Dish', 'Sade Omlet', '1 adet L boy yumurta'),
(178, 23, 'Side', 'Peynirli/Çikolatalı Milföy Börek', '60 g'),
(179, 23, 'Cheese', 'Tulum veya Beyaz Peynir', '40 g'),
(180, 23, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(181, 23, 'Vegetable', 'Mevsim Sebzeleri Söğüş', '100 g'),
(182, 23, 'Bread', 'Çeyrek Ekmek', ''),
(183, 23, 'Drink', 'Su', '500 ml'),
(184, 23, 'Drink', 'Çay/Bitki Çayı', '');

-- 24 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (24, 1, 'Kahvaltı', '2025-05-24', '815 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(185, 24, 'Main Dish', 'Patates Kızartması/Fırın Patates', '150 g'),
(186, 24, 'Side', 'Haşlanmış Yumurta', '1 adet L boy'),
(187, 24, 'Cheese', 'Labne Peynir/Krem Peynir', '20 g'),
(188, 24, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(189, 24, 'Spread', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
(190, 24, 'Bread', 'Çeyrek Ekmek', ''),
(191, 24, 'Drink', 'Su', '500 ml'),
(192, 24, 'Drink', 'Çay/Bitki Çayı', '');

-- 25 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (25, 1, 'Kahvaltı', '2025-05-25', '810 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(193, 25, 'Main Dish', 'Menemen', '150 g (1 adet L boy yumurta)'),
(194, 25, 'Side', 'Poğaça Çeşitleri (Dere Otlu-Sade)', '1 adet'),
(195, 25, 'Cheese', 'Beyaz Peynir', '40 g'),
(196, 25, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(197, 25, 'Spread', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
(198, 25, 'Bread', 'Çeyrek Ekmek', ''),
(199, 25, 'Drink', 'Su', '500 ml'),
(200, 25, 'Drink', 'Çay/Bitki Çayı', '');

-- 26 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (26, 1, 'Kahvaltı', '2025-05-26', '875 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(201, 26, 'Main Dish', 'Simit', '1 adet'),
(202, 26, 'Side', 'Haşlanmış Yumurta', '1 adet L boy'),
(203, 26, 'Cheese', 'Kaşar Peynir', '40 g'),
(204, 26, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(205, 26, 'Spread', 'Bal+Tereyağ', '20 g+10 g'),
(206, 26, 'Bread', 'Çeyrek Ekmek', ''),
(207, 26, 'Drink', 'Su', '500 ml'),
(208, 26, 'Drink', 'Çay/Bitki Çayı', '');

-- 27 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (27, 1, 'Kahvaltı', '2025-05-27', '715 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(209, 27, 'Main Dish', 'Peynirli Omlet', '30 g beyaz p.+ 1 adet L boy yumurta'),
(210, 27, 'Side', 'Meyveli Kek', '50 g'),
(211, 27, 'Cheese', 'Tulum veya Beyaz Peynir', '40 g'),
(212, 27, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(213, 27, 'Vegetable', 'Mevsim Sebzeleri Söğüş', '100 g'),
(214, 27, 'Bread', 'Çeyrek Ekmek', ''),
(215, 27, 'Drink', 'Su', '500 ml'),
(216, 27, 'Drink', 'Çay/Bitki Çayı', '');

-- 28 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (28, 1, 'Kahvaltı', '2025-05-28', '915 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(217, 28, 'Main Dish', 'Patates Kızartması/Fırın Patates', '150 g'),
(218, 28, 'Side', 'Haşlanmış Yumurta', '1 adet L boy'),
(219, 28, 'Cheese', 'Beyaz Peynir', '40 g'),
(220, 28, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(221, 28, 'Spread', 'Helva', '40 g'),
(222, 28, 'Bread', 'Çeyrek Ekmek', ''),
(223, 28, 'Drink', 'Su', '500 ml'),
(224, 28, 'Drink', 'Çay/Bitki Çayı', '');

-- 29 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (29, 1, 'Kahvaltı', '2025-05-29', '855 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(225, 29, 'Main Dish', 'Kaşarlı Omlet', '30 g kaşar p.+ 1 adet L boy yumurta'),
(226, 29, 'Side', 'Sade Açma', '1 adet'),
(227, 29, 'Cheese', 'Labne Peynir/Krem Peynir', '20 g'),
(228, 29, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(229, 29, 'Spread', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
(230, 29, 'Bread', 'Çeyrek Ekmek', ''),
(231, 29, 'Drink', 'Su', '500 ml'),
(232, 29, 'Drink', 'Çay/Bitki Çayı', '');

-- 30 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (30, 1, 'Kahvaltı', '2025-05-30', '810 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(233, 30, 'Main Dish', 'Börek Çeşitleri (Patatesli/Ispanaklı)', '120 g'),
(234, 30, 'Side', 'Haşlanmış Yumurta', '1 adet L boy'),
(235, 30, 'Cheese', 'Beyaz Peynir', '40 g'),
(236, 30, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(237, 30, 'Vegetable', 'Mevsim Sebzeleri Söğüş', '100 g'),
(238, 30, 'Bread', 'Çeyrek Ekmek', ''),
(239, 30, 'Drink', 'Su', '500 ml'),
(240, 30, 'Drink', 'Çay/Bitki Çayı', '');

-- 31 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (31, 1, 'Kahvaltı', '2025-05-31', '860 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES 
(241, 31, 'Main Dish', 'Sade Omlet', '1 adet L boy yumurta'),
(242, 31, 'Side', 'Poğaça Çeşitleri (Dere Otlu-Sade)', '1 adet'),
(243, 31, 'Cheese', 'Kaşar Peynir', '40 g'),
(244, 31, 'Olive', 'Siyah/Yeşil Zeytin', '30 g'),
(245, 31, 'Spread', 'Tahinli Pekmez/Bal/Reçel Çeşitleri/Sürülebilir Çikolata', '20 g'),
(246, 31, 'Bread', 'Çeyrek Ekmek', ''),
(247, 31, 'Drink', 'Su', '500 ml'),
(248, 31, 'Drink', 'Çay/Bitki Çayı', '');

COMMIT;