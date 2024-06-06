# [Запрос 1](1.sql)

Выбрать среди работников Америки (`region_name` = 'Americas') тех, чья зарплата превосходит зарплату менеджера из Европы (`region_name` = 'Europe') с наибольшим количеством подчиненных. 

*Поля*: Фамилия сотрудника, Имя сотрудника.  
*Сортировка*: Фамилия сотрудника, Имя сотрудника.

# [Запрос 2](2.sql)

Выбрать сумму окладов сотрудников по подразделениям компании и процент, который эта сумма составляет от суммы окладов всех сотрудников компании. Если в подразделении нет сотрудников, то считать, что сумма их окладов равна нулю. В отчете отдельной строкой учесть сведения о сотрудниках, которые не приписаны ни к какому подразделению компании (`null` в поле подразделения) При вычислении процентов должно быть использовано округление результата, а не отбрасывание дробной части.

*Поля*: идентификатор подразделения компании, сумма окладов сотрудников подразделения компании, процент.  
*Сортировка*: процент.

# [Запрос 3](3.sql)

Вывести для каждого отдела из Америки (`region_name` = 'Americas') количество работников в иерархии до третьего уровня. Первый уровень — работники без руководителя, второй уровень — это их подчиненные, а третий уровень — подчиненные работников второго уровня. 

*Поля*: Название отдела, количество работников I уровня, количество работников II уровня, количество работников III уровня.  
*Сортировка*: Название отдела.