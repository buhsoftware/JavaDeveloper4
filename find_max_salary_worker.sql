SELECT id, name FROM worker WHERE salary in (SELECT MAX(salary) FROM worker);