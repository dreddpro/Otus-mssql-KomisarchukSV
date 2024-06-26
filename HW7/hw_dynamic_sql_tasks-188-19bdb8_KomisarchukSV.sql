/*
Домашнее задание по курсу MS SQL Server Developer в OTUS.

Занятие "07 - Динамический SQL".

Задания выполняются с использованием базы данных WideWorldImporters.

Бэкап БД можно скачать отсюда:
https://github.com/Microsoft/sql-server-samples/releases/tag/wide-world-importers-v1.0
Нужен WideWorldImporters-Full.bak

Описание WideWorldImporters от Microsoft:
* https://docs.microsoft.com/ru-ru/sql/samples/wide-world-importers-what-is
* https://docs.microsoft.com/ru-ru/sql/samples/wide-world-importers-oltp-database-catalog
*/

-- ---------------------------------------------------------------------------
-- Задание - написать выборки для получения указанных ниже данных.
-- ---------------------------------------------------------------------------

USE WideWorldImporters

/*

Это задание из занятия "Операторы CROSS APPLY, PIVOT, UNPIVOT."
Нужно для него написать динамический PIVOT, отображающий результаты по всем клиентам.
Имя клиента указывать полностью из поля CustomerName.

Требуется написать запрос, который в результате своего выполнения 
формирует сводку по количеству покупок в разрезе клиентов и месяцев.
В строках должны быть месяцы (дата начала месяца), в столбцах - клиенты.

Дата должна иметь формат dd.mm.yyyy, например, 25.12.2019.

Пример, как должны выглядеть результаты:
-------------+--------------------+--------------------+----------------+----------------------
InvoiceMonth | Aakriti Byrraju    | Abel Spirlea       | Abel Tatarescu | ... (другие клиенты)
-------------+--------------------+--------------------+----------------+----------------------
01.01.2013   |      3             |        1           |      4         | ...
01.02.2013   |      7             |        3           |      4         | ...
-------------+--------------------+--------------------+----------------+----------------------
*/


DECLARE @dml AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
-- формируем список
SELECT @ColumnName = ISNULL(@ColumnName + ',','') 
                   + QUOTENAME(CustomerName)--заключаем в квадратные скобки
FROM (SELECT DISTINCT  CustomerName
      FROM sales.Customers) AS CustomerName
ORDER BY CustomerName.CustomerName

SELECT @ColumnName as ColumnName

SET @dml = 
N'
SELECT 
    InvoiceMonth,' + @ColumnName + '

FROM
    (SELECT 
         Dates.InvoiceMonth, 
         SName.SpecName, 
         I.InvoiceID
     FROM Sales.Customers AS C
     INNER JOIN Sales.Invoices AS I
          ON I.CustomerID = C.CustomerID
     CROSS APPLY
         (
          SELECT 
              SpecName = C.CustomerName
          ) AS SName
     CROSS APPLY
         (
          SELECT 
              InvoiceMonth = FORMAT(DATEADD([Month], DATEDIFF([Month], 0, I.InvoiceDate), 0), ''dd.MM.yyyy'')
          ) AS Dates
     ) AS D 
	 PIVOT(COUNT(D.[InvoiceID]) FOR D.SpecName IN(' + @ColumnName + ')) AS P
ORDER BY 
    CAST(P.InvoiceMonth AS DATE);'

EXEC sp_executesql @dml