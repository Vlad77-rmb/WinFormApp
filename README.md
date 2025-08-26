1. Системные требования
• Windows 7 или выше
• .NET Framework 4.7.2 или выше
• SQL Server Express или выше
• Visual Studio 2019 или выше

2. Установка необходимого ПО
• Установка .NET Framework
• Установка SQL Server Express
• Запустить установщик и выбрать "Basic" для автоматической настройки
• Запомнить имя экземпляра сервера - localhost\SQLEXPRESS

3. Настройка базы данных
• Запустить SQL Server Management Studio (SSMS)
• Подключиться к серверу localhost\SQLEXPRESS
• Создать новую базу данных с именем EmployeeDB

Выполнить SQL-скрипты для создания таблиц в такой последовательности:
1) Tables
2) Data
3) Procedures
4) Test
5) Или сразу Full

4. Запуск приложения
Запуск через Visual Studio
Склонируйте репозиторий или распакуйте архив с исходным кодом
Откройте файл решения WindowsFormsApp1.sln в Visual Studio
Восстановите NuGet пакеты
Нажмите F5 для сборки и запуска приложения
