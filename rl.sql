with recursive rl(empno, ename, job, mgr) as
(select empno, ename, job, mgr from emp where ename = 'ADAMS'
    union all
 select b.empno, b.ename, b.job, b.mgr from rl r join emp b on r.mgr = b.empno)
select * from rl;
