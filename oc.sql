with recursive oc(empno, ename, job, mgr) as
(select empno, ename, job, mgr from emp where mgr is null
    union all
 select s.empno, s.ename, s.job, s.mgr from oc join emp s on oc.empno = s.mgr)
select * from oc;
