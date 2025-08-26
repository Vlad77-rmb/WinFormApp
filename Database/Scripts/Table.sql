USE EmployeeDB;
GO

-- Создание таблицы статусов
CREATE TABLE [dbo].[status](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [name] [varchar](100) NOT NULL,
    CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED ([id] ASC)
)
GO

-- Создание таблицы должностей
CREATE TABLE [dbo].[posts](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [name] [varchar](100) NOT NULL,
    CONSTRAINT [PK_posts] PRIMARY KEY CLUSTERED ([id] ASC)
)
GO

-- Создание таблицы отделов
CREATE TABLE [dbo].[deps](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [name] [varchar](100) NOT NULL,
    CONSTRAINT [PK_deps] PRIMARY KEY CLUSTERED ([id] ASC)
)
GO

-- Создание таблицы сотрудников
CREATE TABLE [dbo].[persons](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [first_name] [varchar](100) NOT NULL,
    [second_name] [varchar](100) NOT NULL,
    [last_name] [varchar](100) NOT NULL,
    [date_employ] [datetime] NULL,
    [date_uneploy] [datetime] NULL,
    [status] [int] NOT NULL,
    [id_dep] [int] NOT NULL,
    [id_post] [int] NOT NULL,
    CONSTRAINT [PK_persons] PRIMARY KEY CLUSTERED ([id] ASC)
)
GO