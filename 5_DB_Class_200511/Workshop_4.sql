// Q1.
-- 황기훈과 동일한부서에 속한사원의 이름과입사일, 급여를표시하십시오. --
select name "이름", hire "입사일" , sal "급여" 
from member
where dept_id = 20;

SELECT NAME, HIRE, SAL FROM MEMBER 
WHERE DEPT_ID = (SELECT DEPT_ID FROM MEMBER WHERE NAME = '황기훈');

// Q2.
-- 급여가평균급여보다많은사원의사번, 이름을표시하십시오. --
select avg(sal) from member;

select member_id, name, sal
from member
where sal > (select avg(sal) from member);

 // Q3.
 -- 최고의평균급여를포함하는부서번호와평균급여를표시하십시오. -- 
 select dept_id, (select max(avg(sal)) from member)
 from member
 where dept_id is not null
 group by dept_id
 order by dept_id asc;
 
 
 // Q4.
 -- 배기수에게보고하는모든사원의이름과급여를표시하십시오. --
 select name, sal
 from member
 where mgr  = 100;
 
 SELECT NAME, SAL FROM MEMBER 
WHERE MGR = (SELECT MEMBER_ID FROM MEMBER WHERE NAME = '배기수');
 
 // Q5.
 -- 영업부부서에모든사원의사번, 이름, 부서번호, 직위를표시하십시오. --
 select member_id, name, dept_id, jikwi
 from member
 where dept_id = 300;

 SELECT MEMBER_ID, NAME, DEPT_ID, JIKWI FROM MEMBER 
WHERE DEPT_ID = (SELECT DEPT_ID FROM DEPT WHERE DEPT_NAME = '영업부');
 
 // Q6.
-- 부하직원이있는모든사원을표시하십시오. --
select * from member
where member_id in (select mgr from member where mgr is not null);

SELECT * FROM MEMBER
WHERE MEMBER_ID IN (SELECT MGR FROM MEMBER WHERE MGR IS NOT NULL);

// Q7.
-- 부하직원이없는사원을표시하십시오. --

// Q8
-- 김주부사원보다늦게입사한사원을표시하십시오. --

// Q9.
-- 보너스를받는사원과부서번호및급여가일치하는사원의이름, 부서번호및급여를표시하십시오 --

// Q10.
-- 모든과장의급여보다많이받는사원들을표시하십시오. --

// Q11.
-- 자신의부서평균급여보다많이받는사원들을표시하십시오. --

// Q12.
-- 다음데이터를DEPT 테이블에추가하십시오. (60, ‘교육팀’600) --

// Q13.
-- 김지희사원을찾아급여를6000으로변경하십시오. --

// Q14.
-- 권민수사원을찾아삭제하십시오. 삭제한후내용을확인한후rollback 합니다. --

// Q15.
-- 급여가평균급여보다많은사원의사번, 이름를표시하십시오. --