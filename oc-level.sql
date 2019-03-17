with recursive oc(level, empno, ename, job, mgr) as
(select 1, empno, ename, job, mgr
    from emp where mgr is null
     union all
 select level+1, s.empno, s.ename, s.job, s.mgr 
    from oc join emp s on oc.empno = s.mgr)
select * from oc;
