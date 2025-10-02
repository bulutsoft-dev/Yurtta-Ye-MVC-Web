BEGIN;

-- Önce Ekim 2024 akşam yemeği menülerinin item'larını sil
DELETE FROM public."MenuItems"
WHERE "MenuId" IN (
    SELECT m."Id"
    FROM public."Menus" m
    WHERE m."Date" BETWEEN DATE '2024-10-01' AND DATE '2024-10-31'
      AND m."MealType" = 'Akşam Yemeği'
);

-- Sonra ilgili Menus kayıtlarını sil
DELETE FROM public."Menus"
WHERE "Date" BETWEEN DATE '2024-10-01' AND DATE '2024-10-31'
  AND "MealType" = 'Akşam Yemeği';

COMMIT;
