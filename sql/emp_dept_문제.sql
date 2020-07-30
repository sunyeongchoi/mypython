select * from emp;
#emp : 사원번호,이름,업무,관리자번호,입사일자,급여,커미션,부서번호
select * from dept;
#dept : 부서번호,부서명,도시명
select * from salgrade;
#salgrade : 등급,최저급여,최고급여

# 1. EMP TABLE 에서 이름, 급여, 커미션 금액, 총액 (SAL + COMM) 을 구하여 총액이 많은 순서로 출력하라. 
# 단 커미션이 NULL인 사람은 제외한다.
select ename, sal, comm, (sal+comm) as 총액
from emp
where comm is not null;


# 2. EMP와 DEPT TABLE 을 JOIN 하여 부서번호, 부서명, 이름, 급여를 출력하라.
select d.deptno, d.dname, e.ename, e.sal
from emp e
inner join dept d on e.deptno = d.deptno;


# 3. EMP 테이블에서 사원번호가 7521인 사원과 업무가 같고, 급여가 7934인 사원보다 많은 사원의
# 사원번호, 이름, 담당업무, 입사일자, 급여를 출력하여라.
select empno, ename, job, hiredate, sal
from emp
where job = (select job from emp where empno = 7521)
and sal > (select sal from emp where empno = 7934);




# 4. EMP 테이블에서 평균급여보다 적은 급여를 받는 사원의 사원번호, 이름, 담당업무, 급여, 부서번호를 출력하라.
select empno, ename, job, sal, deptno
from emp
where sal < (select avg(sal) from emp);


# 5. EMP TABLE 에 있는 EMPNO와 MGR을 이용하여 서로의 관계를 다음과 같이 출력하라.
# SMTH의 매니저는 FORD이다.
# concat함수 사용 **************************************
# 5.1 (self query) 같은 emp 테이블 2개를 조인합니다.
select concat(e1.ename, '의 매니저는',e2.ename,'이다') as 사원과매니저
from emp e1 inner join emp e2
on e2.empno = e1.mgr;

# 5.2 inline view
select concat(e1.ename, '의 매니저는',e2.ename,'이다') as 사원과매니저
from emp e1,(select * from emp)e2
where e2.empno = e1.mgr;

#6. ALLEN의 직무와 같은 사람의 이름, 부서명, 급여, 직무를 출력하라.
select  ename, d.dname, sal, job
from emp e inner join dept d on e.deptno = d.deptno
where job = (select job from emp where ename='ALLEN');


#7. EMP 테이블에서 SALES 부서 사원의 이름,업무를 출력하는 SELECT문을 작성하시오.
#7.1 Nested Query
select ename, job
from emp
where deptno = (select dept.deptno from dept where dname = 'SALES');

#7.2 Inline View
select e.ename, e.job,d.deptno
from emp e, (select deptno from dept where dname='SALES') as  d
where e.deptno = d.deptno;


#8. EMP 테이블에서 이름에 “T”가 있는 사원이 근무하는 부서에서 근무하는 모든 사원에 대해 사원 번호,이름,급여를 출력하는 SELECT문을 작성하시오.
#단 사원번호 순으로 출력하여라.
select empno, ename, sal, deptno
from emp
where deptno in (select distinct deptno from emp where ename like '%T%')
order by empno;


# 9. 전체 사원의 평균 임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 지역, 급여를 출력하라.
select empno, ename, d.dname, hiredate,d.loc, sal
from emp e inner join dept d on e.deptno = d.deptno
where sal > (select avg(sal) from emp);


# 10. EMP 테이블에서 관리자중에서 부하직원을 2명이상 관리하는 관리자의 이름을 출력하세요.
select mgr, count(*) as subem
from emp
group by mgr
having subem >= 2;
# 10.1 Nested Query (where 절에 subquery)
select empno, ename
from emp
where empno in (select mgr from emp group by mgr having count(*) >= 2);

# 10.2 Inline View (from 절에 subquery)
select empno, ename
from emp, (select mgr from emp group by mgr having count(*) >= 2) e2
where empno = e2.mgr;

# 11.EMP 테이블에서 CHICAGO에서 근무하는 사원과 같은 업무를 하는 사원의 이름,업무를 출력하는 SELECT문을 작성하시오.
# 11.1.1 Nested Query ( where 절에 in 구문에  subquery 대입 )
select ename, job
from emp
where job in
(select job
from emp
where deptno = (select deptno from dept where loc = 'CHICAGO'));

# 11.2 Inline View
select ename, job
from (select ename, job from emp where job in (select job from emp where deptno = (select deptno from dept where loc='CHICAGO'))) as a;

# 12.EMP 테이블에서 업무가 JONES와 같거나 월급이 FORD이상인 사원의 이름,업무,부서번호,급여를 출력하는 SELECT문을 작성하시오.
# 단 업무별, 월급이 많은 순으로 출력하여라.
select ename, job, d.deptno, sal
from emp e inner join dept d on e.deptno = d.deptno
where job = (select job from emp where ename='JONES')
or sal >= (select sal from emp where ename='FORD')
order by job, sal desc;

# 13. EMP 테이블에서 업무별로 최소 급여를 받는 사원의 사원번호, 이름, 업무, 입사일자, 급여, 부서번호를 출력하여라.
select empno, ename, job, hiredate, sal, deptno
from emp
where (job,sal) in (select job, min(sal) from emp group by job)
group by job;

# 14. emp와 dept 테이블에서 업무가 manager인 사원의 이름, 업무, 부서명, 근무지를 출력하여라.
# Inline View 를 사용하자
select ename, job, d.dname, d.loc
from dept d, (select * from emp where job='manager') e
where e.deptno = d.deptno;

# 15. EMP 테이블에서 30번 부서원 중 최저급여를 받는 사원을 제외한 나머지 사원들의 모든 정보를 출력하는 SELECT문을 작성하시오.
# (Multi Column Sub Query)
select *
from emp
where deptno = 30
and sal != (select min(sal) from emp where deptno=30);

select *
from emp
where (deptno,sal) not in (select deptno, min(sal) from emp group by deptno)
and deptno = 30;

# 16. EMP 테이블에서 말단 사원의 사원번호,이름,업무,부서번호를 출력하는 SELECT 문을 작성하시오.
# (말단사원: 다른 사원을 관리하지 않는 사원)
# - ORACLE : NVL(VALUE1, VALUE2)
# - MSSQL  : ISNULL(VALUE1, VALUE2)
# - MYSQL  : IFNULL(VALUE1, VALUE2)
SELECT DISTINCT(IFNULL(mgr,0)) FROM emp;
select ename, empno
from emp
where empno not in (SELECT DISTINCT(IFNULL(mgr,0)) FROM emp);

# 결과가 출력되지 않는다. in 구문은 null 값을 비교하지 못하기 때문이다.
select ename, empno
from emp
where empno not in (SELECT DISTINCT mgr FROM emp);

# 17. EMP 테이블에서 사원번호, 이름, 업무, 급여, 급여의 등급을 출력하되 3등급 이상인 사원의 정보만을 출력하세요.
# (emp와 salgrade 테이블을 이용);
select empno, ename, job, sal, s.grade
from emp e, salgrade s
where (e.sal >= s.LOSAL) and (e.sal <= s.HISAL) and s.grade >= 3;


# 18. 부서번호, 부서에 속한 직원수, 부서명, 도시명을 출력하세요.
# 직원수가 5명이상인 부서만 출력하세요.
select d.deptno, count(*) as emp_cnt, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno
group by d.deptno
having emp_cnt >= 5;

# 20. EMP 테이블에서 적어도 한 명 이상으로부터 보고를 받을 수 있는 사원의 업무,이름,사원번호,부서번호를 출력하시오.
# (즉 관리자를 출력하세요)
select ename, empno
from emp
where empno in (SELECT DISTINCT(IFNULL(mgr,0)) FROM emp);