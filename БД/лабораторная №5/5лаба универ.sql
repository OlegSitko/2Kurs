use UNIVER;
go
select FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME, PROFESSION.PROFESSION_NAME, PROFESSION.QUALIFICATION
from	
	FACULTY,
	PULPIT,
	PROFESSION
where 
	PULPIT.FACULTY = FACULTY.FACULTY
	and FACULTY.FACULTY = PROFESSION.FACULTY 
	and  FACULTY.FACULTY_NAME IN (
select FACULTY_NAME 
from 
	FACULTY
where
	PROFESSION_NAME Like '%���������� %'
	or PROFESSION_NAME Like '%����������%');

--������� 2

select FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME, PROFESSION.PROFESSION_NAME, PROFESSION.QUALIFICATION
from 
	FACULTY
	inner join PULPIT on FACULTY.FACULTY = PULPIT.FACULTY
	inner join PROFESSION on FACULTY.FACULTY = PROFESSION.FACULTY
where PULPIT.FACULTY = FACULTY.FACULTY  
	and FACULTY.FACULTY = PROFESSION.FACULTY 
	and  FACULTY.FACULTY_NAME IN (
		select FACULTY_NAME 
		from FACULTY
where PROFESSION_NAME Like '%���������� %'
or PROFESSION_NAME Like '%����������%');

--������� 3

select FACULTY.FACULTY_NAME, PULPIT.PULPIT_NAME, PROFESSION.PROFESSION_NAME, PROFESSION.QUALIFICATION
from 
	FACULTY
	inner join PULPIT on FACULTY.FACULTY = PULPIT.FACULTY
	inner join PROFESSION on FACULTY.FACULTY = PROFESSION.FACULTY
where 
	FACULTY.FACULTY_NAME Like '%���������� %'
	or FACULTY.FACULTY_NAME Like '%����������%';

--������� 4

select AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME
from 
	AUDITORIUM AS a
where
	AUDITORIUM_NAME = (
	select top (1) AUDITORIUM_NAME  
	FROM AUDITORIUM AS aa
		WHERE a.AUDITORIUM_TYPE = aa.AUDITORIUM_TYPE
	order by AUDITORIUM_CAPACITY desc)
	ORDER BY AUDITORIUM_CAPACITY DESC;

--������� 5

select FACULTY_NAME, PULPIT_NAME
from FACULTY, PULPIT
where not exists 
(select *
from 
	PULPIT
where 
	FACULTY.FACULTY = PULPIT.FACULTY
);

--������� 6

select top (1)
	(select avg(NOTE) from PROGRESS
	where PROGRESS.SUBJECT like '%����%') [����],
	(select avg(NOTE) from PROGRESS
	where PROGRESS.SUBJECT like '%��%')[��],
	(select avg(NOTE) from PROGRESS
	where PROGRESS.SUBJECT like '%����%')[C���]
	from SUBJECT

--������� 7

select AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY
from AUDITORIUM
where AUDITORIUM_CAPACITY >= all(
	select AUDITORIUM_CAPACITY
	from AUDITORIUM
	where AUDITORIUM_TYPE like '��%'
)
;
--������� 8
select AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY
from AUDITORIUM
where AUDITORIUM_CAPACITY >= any(
	select AUDITORIUM_CAPACITY
	from AUDITORIUM
	where AUDITORIUM_TYPE like '��%'
)
;
select BDAY,
STRING_AGG(NAME, ', ')
from STUDENT
GROUP BY BDAY
HAVING COUNT(*) > 1
ORDER BY BDAY
;