USE EmployeeDB;
GO

-- �������� ��������� ��������� �����������
EXEC GetEmployees;
GO

-- �������� ��������� ��������� ��������  
EXEC GetStatuses;
GO

-- �������� ��������� ����������
EXEC GetStatistics @StatusId = 1, @StartDate = '2020-01-01', @EndDate = '2022-12-31', @Type = 0;
GO

-- �������� ������ � ��������
SELECT * FROM persons;
SELECT * FROM status;
SELECT * FROM deps;
SELECT * FROM posts;
GO