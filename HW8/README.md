# Операторы изменения данных. ДЗ 
___
## Цели занятия
использовать операторы INSERT, UPDATE, UPSERT, DELETE, MERGE, BULK INSERT;
использовать утилиту bcp.
___
## Краткое содержание
DML и для чего он нужен;
операторы INSERT, UPDATE, DELETE, MERGE, Bulk insert;
утилита bcp in\out.
___
## Результаты
скрипты с примерами использования функций SQL server.
___
## Преподаватель
Марина Васильева
___
## Дата и время
2 мая, четверг в 20:00
Длительность занятия: 90 минут
___
## Материалы
___
# Домашнее задание
___
## Цель:
В этом ДЗ вы научитесь работать с записями и потренируетесь писать запросы.
___

## Описание/Пошаговая инструкция выполнения домашнего задания:

1. Довставлять в базу пять записей используя insert в таблицу Customers или Suppliers
2. Удалите одну запись из Customers, которая была вами добавлена
3. Изменить одну запись, из добавленных через UPDATE
4. Написать MERGE, который вставит вставит запись в клиенты, если ее там нет, и изменит если она уже есть
5. Напишите запрос, который выгрузит данные через bcp out и загрузить через bulk insert
---
# Решение
[Здесь](hw_dml_tasks-455564-bbb053_KomisarchukSV.sql)