SELECT client_id, count(id) as project_count FROM project GROUP BY client_id
HAVING count(id) = Select max(project_count) FROM (SELECT client_id, count(id) as project_count FROM project GROUP BY client_id);