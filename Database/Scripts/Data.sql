USE EmployeeDB;
GO

-- ������� ������ (���� �����)
DELETE FROM persons;
DELETE FROM status;
DELETE FROM deps;
DELETE FROM posts;

-- ����� ���������������
DBCC CHECKIDENT ('persons', RESEED, 0);
DBCC CHECKIDENT ('status', RESEED, 0);
DBCC CHECKIDENT ('deps', RESEED, 0);
DBCC CHECKIDENT ('posts', RESEED, 0);

-- ���������� ��������
INSERT INTO status (name) VALUES 
('��������'),
('���������'),
('� �������');

-- ���������� �������
INSERT INTO deps (name) VALUES 
('IT �����'),
('�����������'),
('����� ������');

-- ���������� ����������
INSERT INTO posts (name) VALUES 
('�����������'),
('�����������'),
('���������'),
('HR-��������');

-- ���������� �����������
INSERT INTO persons (first_name, second_name, last_name, date_employ, date_uneploy, status, id_dep, id_post) VALUES 
('����', '��������', '������', '2020-01-15', NULL, 1, 1, 1),
('����', '��������', '������', '2019-03-10', '2021-06-20', 2, 1, 2),
('�����', '���������', '��������', '2021-02-01', NULL, 1, 3, 4),
('����', '������������', '���������', '2018-05-20', NULL, 1, 2, 3);
GO