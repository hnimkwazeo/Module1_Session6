create table department (
	id serial primary key,
	name varchar(50)
);

create table employee (
	id serial primary key,
	full_name varchar(100),
	department_id int references department(id),
	salary numeric(10,2)
);

INSERT INTO department (name) VALUES
('Công nghệ thông tin'),
('Kế toán'),
('Nhân sự'),
('Marketing'),
('Kinh doanh'),
('Vận hành'),
('Pháp chế');

INSERT INTO employee (full_name, department_id, salary) VALUES
('Nguyễn Văn An', 1, 15000000),
('Trần Thị Bình', 2, 12000000),
('Lê Minh Cường', 1, 22000000),
('Phạm Thu Dung', 3, 10000000),
('Hoàng Văn Đức', 4, 18000000),
('Nguyễn Thị Hạnh', 5, 25000000),
('Trần Quốc Khánh', 5, 30000000),
('Lê Thị Lan', 6, 9000000),
('Phạm Văn Minh', 1, 27000000),
('Hoàng Thị Ngọc', 2, 16000000),
('Bùi Văn Nam', NULL, 8000000),
('Đặng Thị Oanh', 4, 14000000);

--Y1:
select e.full_name, e.salary, d.name
from employee e
join department d on e.department_id = d.id;

--Y2:
select d.name as "department_name", avg(e.salary) as "avg_salary"
from employee e
join department d on e.department_id = d.id
group by d.name;

--Y3:
select d.name as "department_name", avg(e.salary) as "avg_salary"
from employee e
join department d on e.department_id = d.id
group by d.name
having avg(e.salary) > 10000000;

--Y4:
select d.name as "department_name", e.id as "employee_id"
from department d
left join employee e on d.id = e.department_id
where e.id is null
group by d.name, e.id;


