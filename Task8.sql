-- Change the perctanges of the categories for a course
UPDATE Category 
SET weight = 40
WHERE category_name = 'Homework';
UPDATE Category 
SET weight = 15
WHERE category_name = 'Projects';
UPDATE Category 
SET weight = 15
WHERE category_name = 'Participation';
UPDATE Category 
SET weight = 30
WHERE category_name = 'Tests';