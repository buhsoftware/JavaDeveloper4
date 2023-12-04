SELECT p.id, SUM(w.salary * (DATEDIFF('MONTH', p.start_date, p.finish_date))) AS price
FROM project_worker AS pw
JOIN project AS p
    ON pw.project_id = p.id
JOIN worker AS w
    ON pw.worker_id = w.id
GROUP BY p.id
ORDER BY price DESC;
