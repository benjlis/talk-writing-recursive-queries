-- CTE example
with deptcomp(deptno, dname, empcnt, avgsal, totsal, totcomm, totcomp) as
    (select deptno, dname, count(emp), round(avg(sal), 2), sum(sal),
            coalesce(sum(comm), 0), sum(sal + coalesce(comm, 0))
        from dept natural join emp
        group by deptno, dname)
select * from deptcomp where empcnt >= 5 and totcomm = 0;
