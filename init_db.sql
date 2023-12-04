/*worker - таблиця для працівників. У таблиці мають бути наступні поля:
    ID - ідентифікатор працівника, ціле число, сурогатний первинний ключ.PROJECT_WORKER PROJECT_WORKER 
    NAME - ім'я працівника, рядок. Обмеження - не має бути NULL, довжина має бути від 2 до 1000 символів включно.
    BIRTHDAY - дата народження. Рік у цій даті має бути більшим за 1900
    LEVEL - рівень технічного розвитку працівника. Має бути обмеження - це поле не може бути NULL, значення поля може бути одним з - Trainee, Junior, Middle, Senior
    SALARY - заробітна плата працівника за 1 місяць. Обмеження - ціле число, не менше 100 і не більше 100 000*/

DROP TABLE  worker if exists CASCADE;

CREATE TABLE worker  (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(1000) NOT NULL CHECK (LENGTH(name) >= 2 AND LENGTH(name) <= 1000),
    birthday DATE CHECK (birthday > '1900-01-01'),
    level VARCHAR(10) NOT NULL CHECK (level IN ('Trainee', 'Junior', 'Middle', 'Senior')),
    salary INT CHECK (salary >= 100 AND salary <= 100000),
    PRIMARY KEY (id)
);

/*client - таблиця для клієнтів. Мають бути наступні поля:
ID - ідентифікатор клієнта, ціле число, сурогатний первинний ключ.
NAME - ім'я працівника, рядок. Обмеження - не має бути NULL, довжина має бути від 2 до 1000 символів включно*/

DROP TABLE client if exists CASCADE;

CREATE TABLE client (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(1000) NOT NULL CHECK (LENGTH(name) >= 2 AND LENGTH(name) <= 1000),
    PRIMARY KEY (id)
);

/*project - таблиця для проєктів. Мають бути наступні поля:
    ID - ідентифікатор проєкту, ціле число, сурогатний первинний ключ.
    CLIENT_ID - ідентифікатор клієнта, що замовив цей проєкт
    START_DATE - дата початку виконання проєкту
    FINISH_DATE - дата кінця виконання проєкту*/

DROP TABLE project if exists CASCADE;

CREATE TABLE project (
    id INT GENERATED ALWAYS AS IDENTITY,
    client_id INT,
    start_date DATE,
    finish_date DATE,
    PRIMARY KEY (id),
    CONSTRAINT project_fk FOREIGN KEY (client_id) REFERENCES client(id)
);

/*project_worker - таблиця, що показує, які працівники над якими проєктами працюють. Поля таблиці:
    PROJECT_ID - ідентифікатор проєкту. Зовнішній ключ для таблиці project(id)
    WORKER_ID - ідентифікатор клієнту. Зовнішній ключ для таблиці worker(id)
    первинний ключ для цієї таблиці - складений, пара (PROJECT_ID, WORKER_ID)*/

DROP TABLE project_worker if exists;

CREATE TABLE project_worker (
    project_id INT,
    worker_id INT,
    CONSTRAINT project_worker_project_fk FOREIGN KEY (project_id) REFERENCES project (id),
    CONSTRAINT project_worker_worker_fk FOREIGN KEY (worker_id) REFERENCES worker(id),
    PRIMARY KEY (project_id, worker_id)
);