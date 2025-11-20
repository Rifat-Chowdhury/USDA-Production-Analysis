-- Clean up Value formatting for all production tables
-- Removes commas from the Value column so it can be treated as numeric

-- Cheese Production
UPDATE cheese_production
SET value = REPLACE(value, ',', '');

-- Honey Production
UPDATE honey_production
SET value = REPLACE(value, ',', '');

-- Milk Production
UPDATE milk_production
SET value = REPLACE(value, ',', '');

-- Coffee Production
UPDATE coffee_production
SET value = REPLACE(value, ',', '');

-- Egg Production
UPDATE egg_production
SET value = REPLACE(value, ',', '');

-- Yogurt Production
UPDATE yogurt_production
SET value = REPLACE(value, ',', '');
