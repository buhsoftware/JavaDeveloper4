SELECT 'YOUNGEST' as type, name, birthday FROM worker
WHERE birthday  IN (SELECT MAX(birthday) FROM worker)
UNION ALL
SELECT 'ELDEST' as type, name, birthday FROM worker
WHERE birthday  IN  (SELECT MIN(birthday) FROM worker);