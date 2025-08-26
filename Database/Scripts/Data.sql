USE EmployeeDB;
GO

-- Очистка таблиц (если нужно)
DELETE FROM persons;
DELETE FROM status;
DELETE FROM deps;
DELETE FROM posts;

-- Сброс идентификаторов
DBCC CHECKIDENT ('persons', RESEED, 0);
DBCC CHECKIDENT ('status', RESEED, 0);
DBCC CHECKIDENT ('deps', RESEED, 0);
DBCC CHECKIDENT ('posts', RESEED, 0);

-- Добавление статусов
INSERT INTO status (name) VALUES 
('Активный'),
('Уволенный'),
('В отпуске');

-- Добавление отделов
INSERT INTO deps (name) VALUES 
('IT отдел'),
('Бухгалтерия'),
('Отдел кадров');

-- Добавление должностей
INSERT INTO posts (name) VALUES 
('Разработчик'),
('Тестировщик'),
('Бухгалтер'),
('HR-менеджер');

-- Добавление сотрудников
INSERT INTO persons (first_name, second_name, last_name, date_employ, date_uneploy, status, id_dep, id_post) VALUES 
('Иван', 'Иванович', 'Иванов', '2020-01-15', NULL, 1, 1, 1),
('Петр', 'Петрович', 'Петров', '2019-03-10', '2021-06-20', 2, 1, 2),
('Мария', 'Сергеевна', 'Сидорова', '2021-02-01', NULL, 1, 3, 4),
('Анна', 'Владимировна', 'Кузнецова', '2018-05-20', NULL, 1, 2, 3);
GO