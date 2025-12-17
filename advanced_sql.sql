show tables;
select * from Students;
-- Query to show total students department wise
select Department, COUNT(*) as Total_students
from Students
group by Department;

-- query to check total students for all departments
select COUNT(*) as Total_students
from Students;

-- top 5 performers
create view top5_performers as
select StudentID, Name, Department, Marks,
ROW_NUMBER() over (order by Marks desc) as rank_row_number
from Students;

select * from top5_performers
where rank_row_number<=5;
-- 3rd way
select StudentID, Name, Department, Marks
from
(select StudentID, Name, Department, Marks,
ROW_NUMBER() over (order by Marks desc) as rank_row_number
from Students) as temp
where rank_row_number<=5;









