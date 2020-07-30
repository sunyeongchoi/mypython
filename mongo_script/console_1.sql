//1.employee_db 생성

//2.employees 컬렉션 생성
//3. employees 컬렉션 capped 확인
//4. employees 컬렉션 statistics 확인

//5.document 추가 insertMany() 사용
/*
  {"number":1001,"last_name":"Smith","first_name":"John","salary":62000,"department":"sales", hire_date:ISODate("2016-01-02")},
  {"number":1002,"last_name":"Anderson","first_name":"Jane","salary":57500,"department":"marketing", hire_date:ISODate("2013-11-09")},
  {"number":1003,"last_name":"Everest","first_name":"Brad","salary":71000,"department":"sales", hire_date:ISODate("2017-02-03")},
  {"number":1004,"last_name":"Horvath","first_name":"Jack","salary":42000,"department":"marketing", hire_date:ISODate("2017-06-01")},
*/


//6.document select all

//7.SELECT * FROM employees WHERE department='sales';

//8.select * from employees where hire_date > "2017-01-01"

//9.select number,last_name,first_name from employees

//10.select number,last_name,first_name from employees where number=1003

//11.select * from employees where number = 1001 and department = 'sales'

//12.select * from employees where number = 1002 or department = 'sales'

//13.select * from employees where number in (1001,1003)

//14.select * from employees where number not in (1001,1003)

//15.select * from employees where last_name like '%e%'

//16.select * from employees where firs_name like '%a%'

//17.select * from employees where first_name like 'B%'

//18.select * from employees where last_name like '%h'

//19.select * from employees order by department

//20.select * from employees order by hire_date desc

//21.select count(*) from employees

//23.insertOne
//insert into employees (number,last_name,first_name,salary,department,status) values (1005,'Hong','Gildong',55000,'clerk','A')
//insert into employees (number,last_name,first_name,salary,department,status) values (1006,'박','둘리',50000,'clerk','B')

//24.select * from employees where status = 'A'

//25.select * from employees where status in ('A','B)

//26.status column이 존재하는 document 조회

//27.status column이 존재하지 않는 document 조회

//28.hire_date column이 존재하는 document 조회

//29.hire_date column이 존재하지 않는 document 조회

//30.status column이 존재하는 document count 조회

//31.hire_date column이 존재하는 document count 조회

//32.select distinct(department) from employees

//33.select * from employees where salary >= 50000

//34.select * from emploees where salary < 50000

//35.select * from employees where salary > 45000 and salary <= 60000

//36.update employees set salary = 57000 where number = 1005

//37.update employees set last_name = '홍' where number = 1005

//38.update employees set salary = salary + 100 where number in (1005,1006)

//39.delete from employees where status = 'A'

//update() operation uses the $unset operator to remove the fields status and salary
//number가 1006 인 document의 status , salary  필드값 제거하기
