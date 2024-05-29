# Динамический SQL. ДЗ
___
## Цели занятия
создавать процедуры с использованием динамического SQL;
перечислять ошибки при использовании динамического SQL, которые ведут к угрозам безопасности;
объяснить как можно сохранять план запроса по динамическому SQL.
___
## Краткое содержание
разница между Exec и sp_executesql;
примеры динамического sql, когда его стоит использовать;
процедуры типа "Kitchen sink";
SQL injections и как их избежать.
___
## Результаты
оптимизацию процедуры kitchen sink.
___
## Преподаватель
Дмитрий Тарасов
___
## Дата и время
25 апреля, четверг в 20:00
Длительность занятия: 90 минут
___
## Материалы
___
# Домашнее задание
___
## Цель:
В этом ДЗ вы научитесь писать динамический PIVOT.
___

## Описание/Пошаговая инструкция выполнения домашнего задания:

Более подробно задание описано в материалах в личном кабинете.

Более подробно задание описано в материалах в личном кабинете.

Пишем динамический PIVOT.

По заданию из занятия "Операторы CROSS APPLY, PIVOT, UNPIVOT".

Требуется написать запрос, который в результате своего выполнения
формирует сводку по количеству покупок в разрезе клиентов и месяцев.

В строках должны быть месяцы (дата начала месяца), в столбцах - клиенты.

Нужно написать запрос, который будет генерировать результаты для всех клиентов.

Имя клиента указывать полностью из поля CustomerName.
---
# Решение
[Здесь](hw_dynamic_sql_tasks-188-19bdb8_KomisarchukSV.sql)