// Q1.
-- 모든 직원의 급여 총액, 급여 평균, 최고 최소 급여를 표시하시오.
select sum(sal), avg(sal), max(sal), min(sal) from member;

// Q2.
-- 직위가동일한직원의수를표시하십시오.
select jikwi, count(member_id) from member group by jikwi;

// Q3.
-- 직원들중에서관리자의수를표시하십시오.
select count(distinct mgr) from member;

// Q4.
-- 총 직원수를 구하고 2000, 2001, 2002, 2003년에입사한직원수를표시하십시오. 
select  substr(hire,1,2) "입사 년도" , count(hire) "직원 수"  from member 
group by substr(hire,1,2)
having substr(hire, 1,2) in('00','01','02','03');

 

select  count(name) "전체 직원수 ", count(decode(substr(hire,1,2), '00', 1)) "00 입사",
count(decode(substr(hire,1,2), '01', 1)) "01수 입사",
count(decode(substr(hire,1,2), '02', 1)) "02 입사",
count(decode(substr(hire,1,2), '03', 1)) "03 입사"
from member;


// Q5.
-- 지급된보너스의평균값을구하십시오. (보너스가없는경우는0으로적용하세요)
select avg(nvl(bonus, 0)) "뽀나스" from member;

// Q6.
-- 최고급여가10000원이넘는부서번호와 평균급여를표시하십시오.
select dept_id "부서 번호", avg(sal) "평균 급여" from member
group by dept_id
having max(sal) > 10000;

// Q7.
-- 영업부 부서에서 근무하는 모든 직원의이름, 직위, 부서번호, 부서이름을 표시하십시오. // 부서이름 없음
select m.name "직원 이름", m.jikwi "직위", m.dept_id "부서 번호", d.dept_name "부서 이름" from member m
left outer join dept d
on m.dept_id = d.dept_id;


// Q8.
-- 직원의이름, 사번, 관리자이름, 사번을표시하십시오.
select m.name "직원 이름", m.dept_id "사번", m2.name "관리자 이름", m2.dept_id "관리자 사번" from member m
left outer join member m2
on m.mgr = m2.member_id;


// Q9.
-- 관리자가 지정되지 않은 직원도 포함하여 직원의이름, 사번, 관리자이름, 관리자의 사번을 표시하십시오.(관리자가 지정되지 않은 경우 관리자의 이름과 사번은 ‘없음’ 으로표시하세요)
select m.name "직원 이름", m.dept_id "사번", nvl(m2.name,  '없음') "관리자 이름", nvl(m2.dept_id, '없음') "관리자 사번" from member m
left outer join member m2
on m.mgr = m2.member_id;


// Q10.
-- 관리자보다 먼저 입사한 모든 직원의 이름, 입사일, 관리자이름, 관리자입사일을표시하십시오.
select m1.name "직원 이름", m1.hire "입사일", m2.name "관리자 이름", m2.hire "관리자이름" 
from member m1, member m2
where  m1.member_id = m2.mgr and m1.hire > m2.hire;

// Q11.
-- 보너스를받는직원의이름, 부서번호, 부서이름을 표시하십시오.
select m.name, m.dept_id, d.dept_name
from member m, dept d
where m.bonus is not null and m.dept_id = d.dept_id;

select m.name, m.dept_id, d.dept_name
from member m
left outer join dept d
on m.dept_id = d.dept_id
where m.bonus is not null;
