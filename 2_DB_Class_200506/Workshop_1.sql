// Q1.
--급여가 14000에서 30000사이에 포함되지 않는 모든 직원의 이름과 급여를 표시 하십시오.--
select name "직원 이름", sal "급여"  from member where sal not in(14000, 30000) order by sal asc;

// Q2.
--직원의 사번, 이름, 급여및 급여를 20% 인상한 급여로 표시 하십시오.--
select MEMBER_ID "사번" , name "직원 이름", sal*1.2 "인상된 급여" from member;

// Q3.
--각 직원의 근무 달수를  표시 하십시오.--
select months_between(sysdate, hire) || ' 개월 ' "근무 일수" from member;

//  Q4.
--각 직원의 근무 달수를  표시 하십시오. 결과는 소수점 둘째자리에서 반올림 합니다.--
select round(months_between(sysdate, hire), 2) || ' 개월 ' "근무 일수" from member;

// Q5.
--각 직원의 이름, 급여를 표시하는 질의문을 작성하십시오. 급여는 10자리 길이로, 왼쪽에는 #표시가 채워지는 형식으로 표기하십시오.--
select name "직원 이름", lpad(sal, 10, '#') "급여" from member;

// Q6.
--각 직원의 사번, 이름, 입사일과 입사한 후에 10달이 경과된 날짜를 표시 하시오.--
select MEMBER_ID "사번", name "직원 이름", hire "입사일", add_months(hire, 10) "입사 10개월 후" from member;

// Q7.
--member 테이블에서 사원의 이름, 직위, 입사일 과 입사한 요일을 표시하되 월요일이 처음으로 하는 순서로 입사요일을 정렬 하십시오.--
select name "직원 이름",  jikwi "직위", hire "입사일", to_char(HIRE, 'day') "요일"  from member order by to_char(hire-1, 'd') asc;

// Q8. --모든 직원의 이름, 직위, 직위별 등급을 표시 하십시오. 각 직위별 등급은 아 래를 참조하십시오.--
select name "직원 이름", jikwi "직위", decode(jikwi, '사장', 'A',  '부장', 'B', '과장', 'C', '대리', 'D', '사원', 'E') "직위 등급표" from member;

// Q9. --각 직원들의 이름과 연봉을 계산 하십시오.--
select name "직원 이름", (sal*12 + nvl(bonus,0)) "연봉" from member;

// Q10.
--2004년에 입사한 직원의 사번과 이름을 표시하십시오.-- // Error..


// Q11.
--관리자가 없는 직원의 이름과 직위를 표시하십시오.--
select name "직원 이름", jikwi "직위" from member where mgr is null;

// Q12.
--보너스를 받은 직원의 이름과 급여, 보너스를 기준으로 내림차순 정렬하여 표시하십시오.--
select name "직원 이름", sal "급여", bonus "보너스"
from member
where bonus is not null 
order by bonus asc;
