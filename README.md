Подготовка к запуску
1. Системные требования
Windows 7 или выше

.NET Framework 4.7.2 или выше

SQL Server Express или выше

Visual Studio 2019 или выше (для сборки из исходного кода)

2. Установка необходимого ПО
Установка .NET Framework
Скачайте и установите .NET Framework с официального сайта Microsoft:
https://dotnet.microsoft.com/download/dotnet-framework

Установка SQL Server Express
Скачайте SQL Server Express с официального сайта:
https://www.microsoft.com/en-us/sql-server/sql-server-downloads

Запустите установщик и выберите "Basic" для автоматической настройки

Запомните имя экземпляра сервера (обычно localhost\SQLEXPRESS)

3. Настройка базы данных
Запустите SQL Server Management Studio (SSMS)

Подключитесь к вашему серверу (обычно localhost\SQLEXPRESS)

Создайте новую базу данных с именем EmployeeDB

Выполните SQL-скрипты для создания таблиц и хранимых процедур (скрипты прилагаются отдельно)
1) Tables
2) Data
3) Procedures
4) Test
5) Или сразу Full


4. Запуск приложения
Вариант 1: Запуск через Visual Studio (для разработки)
Склонируйте репозиторий или распакуйте архив с исходным кодом

Откройте файл решения WindowsFormsApp1.sln в Visual Studio

Восстановите NuGet пакеты (правой кнопкой по решению → Restore NuGet Packages)

Нажмите F5 для сборки и запуска приложения

Вариант 2: Запуск готовой сборки
Скопируйте папку с собранным приложением на целевой компьютер

Убедитесь, что установлен .NET Framework 4.7.2 или выше

Запустите файл WindowsFormsApp1.exe
