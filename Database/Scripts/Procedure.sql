USE EmployeeDB;
GO

-- Удаление существующих процедур (если есть)
DROP PROCEDURE IF EXISTS GetEmployees;
DROP PROCEDURE IF EXISTS GetStatistics;
DROP PROCEDURE IF EXISTS GetStatuses;
DROP PROCEDURE IF EXISTS GetDeps;
DROP PROCEDURE IF EXISTS GetPosts;
GO

-- Процедура получения сотрудников
CREATE PROCEDURE GetEmployees
    @StatusId INT = NULL,
    @DepId INT = NULL,
    @PostId INT = NULL,
    @LastNamePart VARCHAR(100) = NULL
AS
BEGIN
    SELECT 
        p.id,
        p.last_name + ' ' + LEFT(p.first_name, 1) + '. ' + LEFT(p.second_name, 1) + '.' AS FIO,
        s.name AS StatusName,
        d.name AS DepName,
        po.name AS PostName,
        p.date_employ,
        p.date_uneploy
    FROM persons p
    INNER JOIN status s ON p.status = s.id
    INNER JOIN deps d ON p.id_dep = d.id
    INNER JOIN posts po ON p.id_post = po.id
    WHERE 
        (@StatusId IS NULL OR p.status = @StatusId) AND
        (@DepId IS NULL OR p.id_dep = @DepId) AND
        (@PostId IS NULL OR p.id_post = @PostId) AND
        (@LastNamePart IS NULL OR p.last_name LIKE '%' + @LastNamePart + '%')
END
GO

-- Процедура получения статистики
CREATE PROCEDURE GetStatistics
    @StatusId INT,
    @StartDate DATETIME,
    @EndDate DATETIME,
    @Type INT
AS
BEGIN
    IF @Type = 0
        SELECT 
            CAST(date_employ AS DATE) AS Date,
            COUNT(*) AS Count
        FROM persons
        WHERE status = @StatusId
            AND date_employ BETWEEN @StartDate AND @EndDate
        GROUP BY CAST(date_employ AS DATE)
    ELSE
        SELECT 
            CAST(date_uneploy AS DATE) AS Date,
            COUNT(*) AS Count
        FROM persons
        WHERE status = @StatusId
            AND date_uneploy BETWEEN @StartDate AND @EndDate
        GROUP BY CAST(date_uneploy AS DATE)
END
GO

-- Процедуры для загрузки справочников
CREATE PROCEDURE GetStatuses
AS
BEGIN
    SELECT id, name FROM status
END
GO

CREATE PROCEDURE GetDeps
AS
BEGIN
    SELECT id, name FROM deps
END
GO

CREATE PROCEDURE GetPosts
AS
BEGIN
    SELECT id, name FROM posts
END
GO