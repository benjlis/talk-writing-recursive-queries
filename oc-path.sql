
with recursive oc(level, empno, ename, job, mgr, rl) as
(select 1, empno, ename, job, mgr, array[ename]::text
    from emp where mgr is null
     union all
 select level+1, s.empno, s.ename, s.job, s.mgr, oc.rl || array[s.ename]::text
    from oc join emp s on oc.empno = s.mgr)
select * from oc order by rl;
