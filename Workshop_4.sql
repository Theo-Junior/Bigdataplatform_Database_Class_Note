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
--최고의 평균 급여를 포함하는 부서 번호와 평균 급여를 표시 하십시오.--
 select dept_id, avg(sal) from member
 where dept_id is not null
 group by dept_id
 having avg(sal) = (select max(avg(sal)) from member group by dept_id);
 
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
SELECT * FROM MEMBER
WHERE MEMBER_ID not IN (SELECT MGR FROM MEMBER WHERE MGR IS NOT NULL);

// Q8
-- 김주부사원보다늦게입사한사원을표시하십시오. --
select member_id, name, hire
from member
where hire  > (select hire from member where name = '김주부');

// Q9. --?
-- 보너스를받는 사원과 부서번호 및 급여가 일치하는 사원의 이름, 부서번호 및 급여를 표시하십시오 --
select name, dept_id, sal
from memeber
where bonus is not null

// Q10.
-- 모든 과장의 급여보다 많이받는 사원들을 표시하십시오. --
-- 평균으로 수정해서 품--
select name
from member
where sal > (select avg(sal) from member where jikwi = '과장');

select name, sal
from member
where sal >10000;

// Q11.
-- 자신의 부서 평균급여 보다 많이 받는 사원들을 표시하십시오. --
select m1.name "사원 이름", m1.dept_id "사원 번호", sal
from member m1, 
    (select dept_id, avg(sal) as AVG from member group by dept_id) m2
where m1.dept_id = m2.dept_id
        and m1.sal > m2.AVG
order by m2.AVG DESC;

// Q12.
-- 다음데이터를DEPT 테이블에추가하십시오. (60, ‘교육팀’600) --
insert into dept(dept_id, dept_name, loc_id)
values(60, '교육팀', 600);

// Q13.
-- 김지희사원을찾아급여를6000으로변경하십시오. --
update member 
    set sal = 6000 where name = '김지희';

// Q14.
-- 권민수사원을찾아삭제하십시오. 삭제한후내용을확인한후rollback 합니다. --
delete from member
    where name = '김민수'
    rollback;

// Q15.
-- 급여가 평균급여보다 많은사원의 사번, 이름를표시하십시오. --
select avg(sal) from member;

select name, dept_id, sal
from member
where sal > (select avg(sal) from member);