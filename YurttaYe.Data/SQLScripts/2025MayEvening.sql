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
VALUES (1, 1, 'Akşam Yemeği', '2025-05-01', '870-1205 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (1, 1, 'Soup', 'DOMATES ÇORBASI', '250 g'),
    (2, 1, 'Soup', 'ŞEHRİYE ÇORBASI', '250 g'),
    (3, 1, 'Main Dish 80%', 'ÇITIR TAVUK (FIRIN PATATES İLE)', '100 g/200 g'),
    (4, 1, 'Main Dish 20%', 'KURUFASULYE YEMEĞİ', '200 g'),
    (5, 1, 'Side', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (6, 1, 'Extra', 'YOĞURT', '120 g'),
    (7, 1, 'Extra', 'MEYVE SUYU', '200 ml'),
    (8, 1, 'Extra', 'Su', '500 ml'),
    (9, 1, 'Extra', 'Çeyrek Ekmek', '');

-- 2 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (2, 1, 'Akşam Yemeği', '2025-05-02', '1160-1290 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (10, 2, 'Soup', 'TARHANA ÇORBA', '250 g'),
    (11, 2, 'Soup', 'TAVUK SUYU ÇORBA', '250 g'),
    (12, 2, 'Main Dish 80%', 'İZMİR KÖFTE', '60 g/250 g'),
    (13, 2, 'Main Dish 20%', 'KARIŞIK KIZARTMA (SOS İLE)', '200 g'),
    (14, 2, 'Side', 'PEYNİRLİ MAKARNA', '200 g'),
    (15, 2, 'Extra', 'KARIŞIK SALATA', '100 g'),
    (16, 2, 'Extra', 'BROWNİ', '120 g'),
    (17, 2, 'Extra', 'Su', '500 ml'),
    (18, 2, 'Extra', 'Çeyrek Ekmek', '');

-- 3 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (3, 1, 'Akşam Yemeği', '2025-05-03', '1125-1180 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (19, 3, 'Soup', 'TOYGA ÇORBA', '250 g'),
    (20, 3, 'Soup', 'EZOGELİN ÇORBA', '250 g'),
    (21, 3, 'Main Dish 80%', 'TAVUK KÜLBASTI (FIRIN SEBZE İLE)', '100 g/200 g'),
    (22, 3, 'Main Dish 20%', 'TAZE FASULYE YEMEĞİ', '200 g'),
    (23, 3, 'Side', 'PİRİNÇ PİLAVI', '150 g'),
    (24, 3, 'Extra', 'AYRAN', '170-200 ml'),
    (25, 3, 'Extra', 'MEYVE SUYU', '170-200 ml'),
    (26, 3, 'Extra', 'KURU CACIK', '100 g'),
    (27, 3, 'Extra', 'Su', '500 ml'),
    (28, 3, 'Extra', 'Çeyrek Ekmek', '');

-- 4 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (4, 1, 'Akşam Yemeği', '2025-05-04', '860-1060 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (29, 4, 'Soup', 'SALÇALI MERCİMEK ÇORBA', '250 g'),
    (30, 4, 'Soup', 'YAYLA ÇORBA', '250 g'),
    (31, 4, 'Main Dish 80%', 'IZGARA KÖFTE (SOS VE PİYAZ İLE)', '90 g/200 g'),
    (32, 4, 'Main Dish 20%', 'ISPANAK YEMEĞİ (YOĞURT İLE)', '200 g'),
    (33, 4, 'Side', 'SPAGETTİ (SOS İLE)', '200 g'),
    (34, 4, 'Extra', 'Su', '500 ml'),
    (35, 4, 'Extra', 'Çeyrek Ekmek', '');

-- 5 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (5, 1, 'Akşam Yemeği', '2025-05-05', '850-1135 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (36, 5, 'Soup', 'SEBZE ÇORBASI', '250 g'),
    (37, 5, 'Soup', 'DOMATES ÇORBASI', '250 g'),
    (38, 5, 'Main Dish 80%', 'TAVUK ÇÖKERTME', '100 g/250 g'),
    (39, 5, 'Main Dish 20%', 'MÜCVER (YOĞURT İLE)', '200 g'),
    (40, 5, 'Side', 'ŞEHRİYELİ PİRİNÇ PİLAVI', '150 g'),
    (41, 5, 'Extra', 'MEVSİM SALATA', '100 g'),
    (42, 5, 'Extra', 'Su', '500 ml'),
    (43, 5, 'Extra', 'Çeyrek Ekmek', '');

-- 6 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (6, 1, 'Akşam Yemeği', '2025-05-06', '1085-1345 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (44, 6, 'Soup', 'MAHLUTA ÇORBASI', '250 g'),
    (45, 6, 'Soup', 'YOĞURT ÇORBASI', '250 g'),
    (46, 6, 'Main Dish 80%', 'SOSLU MİTİTE KÖFTE', '60 g/250 g'),
    (47, 6, 'Main Dish 20%', 'SEBZE SOTE', '200 g'),
    (48, 6, 'Side', 'PEYNİRLİ MAKARNA', '200 g'),
    (49, 6, 'Extra', 'TRİLİÇE', '150 g'),
    (50, 6, 'Extra', 'Su', '500 ml'),
    (51, 6, 'Extra', 'Çeyrek Ekmek', '');

-- 7 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (7, 1, 'Akşam Yemeği', '2025-05-07', '840-1190 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (52, 7, 'Soup', 'ARPA ŞEHRİYE ÇORBASI', '250 g'),
    (53, 7, 'Soup', 'YÜKSÜK ÇORBASI', '250 g'),
    (54, 7, 'Main Dish 80%', 'TAS KEBABI', '90 g/250 g'),
    (55, 7, 'Main Dish 20%', 'BEZELYE YEMEĞİ', '200 g'),
    (56, 7, 'Side', 'PİRİNÇ PİLAVI', '150 g'),
    (57, 7, 'Extra', 'KURU CACIK', '150 g'),
    (58, 7, 'Extra', 'Su', '500 ml'),
    (59, 7, 'Extra', 'Çeyrek Ekmek', '');

-- 8 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (8, 1, 'Akşam Yemeği', '2025-05-08', '1110-1170 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (60, 8, 'Soup', 'TOYGA ÇORBA', '250 g'),
    (61, 8, 'Soup', 'EZOGELİN ÇORBA', '250 g'),
    (62, 8, 'Main Dish 80%', 'KÖRİ SOSLU TAVUK (PATATES KIZARTMASI İLE)', '100 g/250 g'),
    (63, 8, 'Main Dish 20%', 'KARIŞIK DOLMA (YOĞURT İLE)', '200 g'),
    (64, 8, 'Side', 'MAKARNA (SOS İLE)', '150 g'),
    (65, 8, 'Extra', 'HAVUÇ TARATOR', '100 g'),
    (66, 8, 'Extra', 'Su', '500 ml'),
    (67, 8, 'Extra', 'Çeyrek Ekmek', '');

-- 9 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (9, 1, 'Akşam Yemeği', '2025-05-09', '1170-1330 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (68, 9, 'Soup', 'TAVUK SUYU ÇORBASI', '250 g'),
    (69, 9, 'Soup', 'TARHANA ÇORBASI', '250 g'),
    (70, 9, 'Main Dish 80%', 'NOHUT YEMEĞİ', '200 g'),
    (71, 9, 'Main Dish 20%', 'KARIŞIK KIZARTMA (SOS İLE)', '200 g'),
    (72, 9, 'Side', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (73, 9, 'Extra', 'PEYNİR TATLISI', '100 g'),
    (74, 9, 'Extra', 'KARIŞIK TURŞU', '80 g'),
    (75, 9, 'Extra', 'Su', '500 ml'),
    (76, 9, 'Extra', 'Çeyrek Ekmek', '');

-- 10 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (10, 1, 'Akşam Yemeği', '2025-05-10', '865-1010 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (77, 10, 'Soup', 'MERCİMEK ÇORBA', '250 g'),
    (78, 10, 'Soup', 'DOMATES ÇORBASI', '250 g'),
    (79, 10, 'Main Dish 80%', 'IZGARA KÖFTE (FIRIN PATATES İLE)', '90 g/200 g'),
    (80, 10, 'Main Dish 20%', 'GARNİTÜRLÜ KABAK SANDAL', '200 g'),
    (81, 10, 'Side', 'PİRİNÇ PİLAVI', '150 g'),
    (82, 10, 'Extra', 'HAYDARİ', '100 g'),
    (83, 10, 'Extra', 'Su', '500 ml'),
    (84, 10, 'Extra', 'Çeyrek Ekmek', '');

-- 11 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (11, 1, 'Akşam Yemeği', '2025-05-11', '1010-1080 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (85, 11, 'Soup', 'YAYLA ÇORBASI', '250 g'),
    (86, 11, 'Soup', 'TEL ŞEHRİYE ÇORBASI', '250 g'),
    (87, 11, 'Main Dish 80%', 'TAVUK FAJİTA', '100 g/250 g'),
    (88, 11, 'Main Dish 20%', 'PATATES YEMEĞİ', '200 g'),
    (89, 11, 'Side', 'MAKARNA (SOS İLE)', '200 g'),
    (90, 11, 'Extra', 'YOĞURT', '120 g'),
    (91, 11, 'Extra', 'Su', '500 ml'),
    (92, 11, 'Extra', 'Çeyrek Ekmek', '');

-- 12 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (12, 1, 'Akşam Yemeği', '2025-05-12', '990-1155 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (93, 12, 'Soup', 'MERCİMEK ÇORBASI', '250 g'),
    (94, 12, 'Soup', 'YOĞURT ÇORBASI', '250 g'),
    (95, 12, 'Main Dish 80%', 'KARNIYARIK', '60 g/200 g'),
    (96, 12, 'Main Dish 20%', 'SEBZE KIZARTMASI (KABAK-HAVUÇ-PATATES) (YOĞURT İLE)', '200 g'),
    (97, 12, 'Side', 'BULGUR PİLAVI (SOS İLE)', '200 g'),
    (98, 12, 'Extra', 'MEYVELİ PASTA', '120 g'),
    (99, 12, 'Extra', 'Su', '500 ml'),
    (100, 12, 'Extra', 'Çeyrek Ekmek', '');

-- 13 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (13, 1, 'Akşam Yemeği', '2025-05-13', '1085-1235 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (101, 13, 'Soup', 'EZOGELİN ÇORBA', '250 g'),
    (102, 13, 'Soup', 'TOYGA ÇORBA', '250 g'),
    (103, 13, 'Main Dish 80%', 'TAVUKLU SULTAN KEBABI', '100 g/250 g'),
    (104, 13, 'Main Dish 20%', 'KARIŞIK DOLMA (YOĞURT İLE)', '200 g'),
    (105, 13, 'Side', 'MAKARNA (SOS İLE)', '200 g'),
    (106, 13, 'Extra', 'KARIŞIK SALATA', '100 g'),
    (107, 13, 'Extra', 'Su', '500 ml'),
    (108, 13, 'Extra', 'Çeyrek Ekmek', '');

-- 14 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (14, 1, 'Akşam Yemeği', '2025-05-14', '1045-1220 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (109, 14, 'Soup', 'TARHANA ÇORBASI', '250 g'),
    (110, 14, 'Soup', 'YÜKSÜK ÇORBASI', '250 g'),
    (111, 14, 'Main Dish 80%', 'KURU FASULYE', '200 g'),
    (112, 14, 'Main Dish 20%', 'ISPANAK YEMEĞİ', '200 g'),
    (113, 14, 'Side', 'PİRİNÇ PİLAVI', '150 g'),
    (114, 14, 'Extra', 'CEVİZLİ KADAYIF', '100 g'),
    (115, 14, 'Extra', 'Su', '500 ml'),
    (116, 14, 'Extra', 'Çeyrek Ekmek', '');

-- 15 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (15, 1, 'Akşam Yemeği', '2025-05-15', '915-1145 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (117, 15, 'Soup', 'YAYLA ÇORBASI', '250 g'),
    (118, 15, 'Soup', 'MERCİMEK ÇORBASI', '250 g'),
    (119, 15, 'Main Dish 80%', 'TAVUK TANTUNİ (LAVAŞ-SOĞAN-DOMATES İLE)', '100 g/250 g'),
    (120, 15, 'Main Dish 20%', 'MÜCVER (YOĞURT İLE)', '200 g'),
    (121, 15, 'Side', 'ŞEHRİYE PİLAVI', '150 g'),
    (122, 15, 'Extra', 'KURU CACIK', '100 g'),
    (123, 15, 'Extra', 'Su', '500 ml'),
    (124, 15, 'Extra', 'Çeyrek Ekmek', '');

-- 16 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (16, 1, 'Akşam Yemeği', '2025-05-16', '975-1095 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (125, 16, 'Soup', 'DOMATES ÇORBASI', '250 g'),
    (126, 16, 'Soup', 'ARPA ŞEHRİYE ÇORBASI', '250 g'),
    (127, 16, 'Main Dish 80%', 'TİRE KÖFTE (PİDE+DOMATES SOS İLE)', '90 g/200 g'),
    (128, 16, 'Main Dish 20%', 'İMAMBAYILDI', '200 g'),
    (129, 16, 'Side', 'PEYNİRLİ MAKARNA', '200 g'),
    (130, 16, 'Extra', 'EGE SALATA', '150 g'),
    (131, 16, 'Extra', 'Su', '500 ml'),
    (132, 16, 'Extra', 'Çeyrek Ekmek', '');

-- 17 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (17, 1, 'Akşam Yemeği', '2025-05-17', '1070-1190 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (133, 17, 'Soup', 'EZOGELİN ÇORBA', '250 g'),
    (134, 17, 'Soup', 'SEBZE ÇORBASI', '250 g'),
    (135, 17, 'Main Dish 80%', 'TAVUK SOTE (AZ SULU)', '100 g/250 g'),
    (136, 17, 'Main Dish 20%', 'KARIŞIK SEBZE GRATEN', '200 g'),
    (137, 17, 'Side', 'ŞEHRİYELİ PİRİNÇ PİLAVI', '150 g'),
    (138, 17, 'Extra', 'UN VEYA İRMİK HELVASI', '100 g'),
    (139, 17, 'Extra', 'Su', '500 ml'),
    (140, 17, 'Extra', 'Çeyrek Ekmek', '');

-- 18 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (18, 1, 'Akşam Yemeği', '2025-05-18', '1085-1290 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (141, 18, 'Soup', 'MERCİMEK ÇORBASI', '250 g'),
    (142, 18, 'Soup', 'YÜKSÜK ÇORBASI', '250 g'),
    (143, 18, 'Main Dish 80%', 'HÜNKAR BEĞENDİ', '90 g/250 g'),
    (144, 18, 'Main Dish 20%', 'NOHUT/BARBUNYA YEMEĞİ', '200 g'),
    (145, 18, 'Side', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (146, 18, 'Extra', 'HAYDARİ', '100 g'),
    (147, 18, 'Extra', 'Su', '500 ml'),
    (148, 18, 'Extra', 'Çeyrek Ekmek', '');

-- 19 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (19, 1, 'Akşam Yemeği', '2025-05-19', '860-1045 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (149, 19, 'Soup', 'TARHANA ÇORBASI', '250 g'),
    (150, 19, 'Soup', 'TOYGA ÇORBA', '250 g'),
    (151, 19, 'Main Dish 80%', 'TAVUK KAVURMA (KÜP PATATES İLE)', '100 g/200 g'),
    (152, 19, 'Main Dish 20%', 'TAZE FASÜLYE YEMEĞİ', '200 g'),
    (153, 19, 'Side', 'FIRIN MAKARNA', '150 g'),
    (154, 19, 'Side', 'MAKARNA (SOS İLE)', '200 g'),
    (155, 19, 'Extra', 'CACIK', '150 g'),
    (156, 19, 'Extra', 'Su', '500 ml'),
    (157, 19, 'Extra', 'Çeyrek Ekmek', '');

-- 20 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (20, 1, 'Akşam Yemeği', '2025-05-20', '905-1160 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (158, 20, 'Soup', 'TAVUK SUYU ÇORBASI', '250 g'),
    (159, 20, 'Soup', 'MAHLUTA ÇORBASI', '250 g'),
    (160, 20, 'Main Dish 80%', 'SEBZELİ KÖFTE', '60 g/250 g'),
    (161, 20, 'Main Dish 20%', 'MÜCVER (YOĞURT İLE)', '200 g'),
    (162, 20, 'Side', 'PİRİNÇ PİLAVI', '150 g'),
    (163, 20, 'Extra', 'HAVUÇ TARATOR', '100 g'),
    (164, 20, 'Extra', 'Su', '500 ml'),
    (165, 20, 'Extra', 'Çeyrek Ekmek', '');

-- 21 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (21, 1, 'Akşam Yemeği', '2025-05-21', '890-1400 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (166, 21, 'Soup', 'YAYLA ÇORBASI', '250 g'),
    (167, 21, 'Soup', 'KIRMIZI MERCİMEK ÇORBASI', '250 g'),
    (168, 21, 'Main Dish 80%', 'EL YAPIMI TAVUK ŞİNİTZEL (ELMA DİLİMİ PATATES)', '100 g/200 g'),
    (169, 21, 'Main Dish 20%', 'SEBZE SOTE', '200 g'),
    (170, 21, 'Side', 'ERİŞTE', '200 g'),
    (171, 21, 'Side', 'MAKARNA', '200 g'),
    (172, 21, 'Extra', 'PORTAKALLI REVANİ', '100 g'),
    (173, 21, 'Extra', 'Su', '500 ml'),
    (174, 21, 'Extra', 'Çeyrek Ekmek', '');

-- 22 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (22, 1, 'Akşam Yemeği', '2025-05-22', '800-1145 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (175, 22, 'Soup', 'ŞEHRİYE ÇORBASI', '250 g'),
    (176, 22, 'Soup', 'EZOGELİN ÇORBA', '250 g'),
    (177, 22, 'Main Dish 80%', 'ETLİ SULTAN KEBABI', '90 g/250 g'),
    (178, 22, 'Main Dish 20%', 'KURU FASÜLYE YEMEĞİ', '200 g'),
    (179, 22, 'Side', 'PİRİNÇ PİLAVI', '150 g'),
    (180, 22, 'Extra', 'HAVUÇ AYSBERG SALATA', '100 g'),
    (181, 22, 'Extra', 'Su', '500 ml'),
    (182, 22, 'Extra', 'Çeyrek Ekmek', '');

-- 23 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (23, 1, 'Akşam Yemeği', '2025-05-23', '1220-1420 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (183, 23, 'Soup', 'YÜKSÜK ÇORBASI', '250 g'),
    (184, 23, 'Soup', 'SEBZE ÇORBASI', '250 g'),
    (185, 23, 'Main Dish 80%', 'MANİSA KEBABI', '90 g/200 g'),
    (186, 23, 'Main Dish 20%', 'KARIŞIK DOLMA (YOĞURT İLE)', '200 g'),
    (187, 23, 'Side', 'MAKARNA (SOS İLE)', '200 g'),
    (188, 23, 'Extra', 'SUPANGLE', '150 g'),
    (189, 23, 'Extra', 'Su', '500 ml'),
    (190, 23, 'Extra', 'Çeyrek Ekmek', '');

-- 24 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (24, 1, 'Akşam Yemeği', '2025-05-24', '975-1185 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (191, 24, 'Soup', 'TARHANA ÇORBASI', '250 g'),
    (192, 24, 'Soup', 'TOYGA ÇORBA', '250 g'),
    (193, 24, 'Main Dish 80%', 'TAVUK ŞİŞ (KÜP PATATES İLE)', '100 g/200 g'),
    (194, 24, 'Main Dish 20%', 'KARIŞIK SEBZE GRATEN', '200 g'),
    (195, 24, 'Side', 'YEŞİL MERCİMEKLİ BULGUR PİLAVI', '200 g'),
    (196, 24, 'Extra', 'BİBER TARATOR', '100 g'),
    (197, 24, 'Extra', 'Su', '500 ml'),
    (198, 24, 'Extra', 'Çeyrek Ekmek', '');

-- 25 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (25, 1, 'Akşam Yemeği', '2025-05-25', '910-1165 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (199, 25, 'Soup', 'TAVUK SUYU ÇORBASI', '250 g'),
    (200, 25, 'Soup', 'MAHLUTA ÇORBASI', '250 g'),
    (201, 25, 'Main Dish 80%', 'KURUFASULYE YEMEĞİ', '200 g'),
    (202, 25, 'Main Dish 20%', 'KARIŞIK KIZARTMA', '200 g'),
    (203, 25, 'Side', 'ŞEHRİYELİ PİRİNÇ PİLAVI', '150 g'),
    (204, 25, 'Extra', 'EGE SALATA', '150 g'),
    (205, 25, 'Extra', 'YOĞURT', '120 g'),
    (206, 25, 'Extra', 'Su', '500 ml'),
    (207, 25, 'Extra', 'Çeyrek Ekmek', '');

-- 26 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (26, 1, 'Akşam Yemeği', '2025-05-26', '1115-1360 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (208, 26, 'Soup', 'MERCİMEK ÇORBASI', '250 g'),
    (209, 26, 'Soup', 'YAYLA ÇORBASI', '250 g'),
    (210, 26, 'Main Dish 80%', 'İZMİR KÖFTE', '60 g/250 g'),
    (211, 26, 'Main Dish 20%', 'GARNİTÜRLÜ KABAK SANDAL', '200 g'),
    (212, 26, 'Side', 'SPAGETTİ (SOS İLE)', '200 g'),
    (213, 26, 'Extra', 'BARBUNYA PİLAKİ', '100 g'),
    (214, 26, 'Extra', 'Su', '500 ml'),
    (215, 26, 'Extra', 'Çeyrek Ekmek', '');

-- 27 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (27, 1, 'Akşam Yemeği', '2025-05-27', '1220-1435 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (216, 27, 'Soup', 'EZOGELİN ÇORBA', '250 g'),
    (217, 27, 'Soup', 'ARPA ŞEHRİYE ÇORBASI', '250 g'),
    (218, 27, 'Main Dish 80%', 'KÖRİ SOSLU TAVUK', '100 g/250 g'),
    (219, 27, 'Main Dish 20%', 'MÜCVER (YOĞURT İLE)', '200 g'),
    (220, 27, 'Side', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (221, 27, 'Extra', 'BİSKÜVİLİ PASTA', '120 g'),
    (222, 27, 'Extra', 'Su', '500 ml'),
    (223, 27, 'Extra', 'Çeyrek Ekmek', '');

-- 28 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (28, 1, 'Akşam Yemeği', '2025-05-28', '845-985 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (224, 28, 'Soup', 'TARHANA ÇORBASI', '250 g'),
    (225, 28, 'Soup', 'SEBZE ÇORBASI', '250 g'),
    (226, 28, 'Main Dish 80%', 'ET SOTE', '90 g/250 g'),
    (227, 28, 'Main Dish 20%', 'ISPANAK GRATEN', '200 g'),
    (228, 28, 'Side', 'PİRİNÇ PİLAVI', '150 g'),
    (229, 28, 'Extra', 'CACIK', '150 g'),
    (230, 28, 'Extra', 'Su', '500 ml'),
    (231, 28, 'Extra', 'Çeyrek Ekmek', '');

-- 29 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (29, 1, 'Akşam Yemeği', '2025-05-29', '865-1255 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (232, 29, 'Soup', 'YÜKSÜK ÇORBASI', '250 g'),
    (233, 29, 'Soup', 'YAYLA ÇORBASI', '250 g'),
    (234, 29, 'Main Dish 80%', 'AKÇAABAT KÖFTE (ELMA DİLİM PATATES İLE)', '90 g/200 g'),
    (235, 29, 'Main Dish 20%', 'TAZE FASÜLYE YEMEĞİ', '200 g'),
    (236, 29, 'Side', 'MAKARNA (SOS İLE)', '200 g'),
    (237, 29, 'Extra', 'AYRAN', '170-200 ml'),
    (238, 29, 'Extra', 'Su', '500 ml'),
    (239, 29, 'Extra', 'Çeyrek Ekmek', '');

-- 30 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (30, 1, 'Akşam Yemeği', '2025-05-30', '765-1065 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (240, 30, 'Soup', 'TOYGA ÇORBA', '250 g'),
    (241, 30, 'Soup', 'MAHLUTA ÇORBASI', '250 g'),
    (242, 30, 'Main Dish 80%', 'TAVUK TANTUNİ (LAVAŞ-SOĞAN-DOMATES İLE)', '100 g/250 g'),
    (243, 30, 'Main Dish 20%', 'SEBZE SOTE', '200 g'),
    (244, 30, 'Side', 'PİRİNÇ PİLAVI', '150 g'),
    (245, 30, 'Extra', 'HAYDARİ', '100 g'),
    (246, 30, 'Extra', 'Su', '500 ml'),
    (247, 30, 'Extra', 'Çeyrek Ekmek', '');

-- 31 Mayıs 2025
INSERT INTO public."Menus" ("Id", "CityId", "MealType", "Date", "Energy")
VALUES (31, 1, 'Akşam Yemeği', '2025-05-31', '1255-1510 kkal');

INSERT INTO public."MenuItems" ("Id", "MenuId", "Category", "Name", "Gram")
VALUES
    (248, 31, 'Soup', 'TAVUK SUYU ÇORBASI', '250 g'),
    (249, 31, 'Soup', 'DOMATES ÇORBASI', '250 g'),
    (250, 31, 'Main Dish 80%', 'KURU FASÜLYE YEMEĞİ', '200 g'),
    (251, 31, 'Main Dish 20%', 'KARIŞIK DOLMA', '200 g'),
    (252, 31, 'Side', 'SEBZELİ BULGUR PİLAVI', '200 g'),
    (253, 31, 'Extra', 'HAŞHAŞLI REVANİ', '100 g'),
    (254, 31, 'Extra', 'YOĞURT', '120 g'),
    (255, 31, 'Extra', 'Su', '500 ml'),
    (256, 31, 'Extra', 'Çeyrek Ekmek', '');

COMMIT;