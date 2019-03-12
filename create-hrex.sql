-- hrex.sql
-- Creates and populates a toy HR schema for learning purposes. It's based on
-- the classic Oracle example tables updated to modern SQL.

create schema hrex;
set search_path to hrex, public;

create table dept(
    deptno     integer     primary key,
    dname      varchar(14) not null,
    loc        varchar(13) not null
);

insert into dept(deptno, dname, loc) values
    (10, 'ACCOUNTING', 'NEW YORK'), (20, 'RESEARCH', 'DALLAS'),
    (30, 'SALES', 'CHICAGO'), (40, 'OPERATIONS', 'BOSTON');

create table emp(
    empno    integer      primary key,
    ename    varchar(10)  not null,
    job      varchar(9)   not null,
    mgr      integer      references emp,
    hiredate date         not null,
    sal      numeric(7,2) not null,
    comm     numeric(7,2),
    deptno   integer      not null references dept
);

insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values
    (7839, 'KING', 'PRESIDENT', null, '2011-11-17', 5000, null, 10),
    (7698, 'BLAKE', 'MANAGER', 7839, '2011-05-01', 2850, null, 30),
    (7782, 'CLARK', 'MANAGER', 7839, '2011-09-06', 2450, null, 10),
    (7566, 'JONES', 'MANAGER', 7839, '2011-04-02', 2975, null, 20),
    (7788, 'SCOTT', 'ANALYST', 7566, '2017-07-13', 3000, null, 20),
    (7902, 'FORD', 'ANALYST', 7566, '2011-03-12', 3000, null, 20),
    (7369, 'SMITH', 'ASSOCIATE', 7902, '2010-12-17', 800, null, 20),
    (7499, 'ALLEN', 'SALESMAN', 7698, '2011-02-20', 1600, 300, 30),
    (7521, 'WARD', 'SALESMAN', 7698, '2011-02-21', 1250, 500, 30),
    (7654, 'MARTIN', 'SALESMAN', 7698, '2011-09-28', 1250, 1400, 30),
    (7844, 'TURNER', 'SALESMAN', 7698, '2011-08-09',1500, 0, 30),
    (7876, 'ADAMS', 'ASSOCIATE', 7788, '2017-07-13', 1100, null, 20),
    (7900, 'JAMES', 'ASSOCIATE', 7698, '2011-03-12', 950, null, 30),
    (7934, 'MILLER', 'ASSOCIATE', 7782, '2012-01-23', 1300, null, 10);

select ename, dname, job, empno, hiredate, loc
    from emp natural join dept
    order by ename;

select dname, count(*) empcnt
    from dept natural join emp
    group by dname
    order by empcnt desc;
