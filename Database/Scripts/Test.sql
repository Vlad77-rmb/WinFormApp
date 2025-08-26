USE EmployeeDB;
GO

-- Проверка процедуры получения сотрудников
EXEC GetEmployees;
GO

-- Проверка процедуры получения статусов  
EXEC GetStatuses;
GO

-- Проверка процедуры статистики
EXEC GetStatistics @StatusId = 1, @StartDate = '2020-01-01', @EndDate = '2022-12-31', @Type = 0;
GO

-- Проверка данных в таблицах
SELECT * FROM persons;
SELECT * FROM status;
SELECT * FROM deps;
SELECT * FROM posts;
GO