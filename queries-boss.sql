
-- employees and their boss
select e.ename, e.job, b.ename boss
    from emp e left join emp b on (e.mgr = b.empno);

-- employees, their boss and boss's boss
select e.ename, e.job, b.ename boss, bb.ename bossboss
    from emp e left join emp b on (e.mgr = b.empno)
               left join emp bb on (b.mgr = bb.empno);
