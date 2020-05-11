
// Q1. 
-- 다음과같은컬럼을가지는TEST 테이블을만드십시오. --
create table TEST
(
    ID number(5,1),
    Name varchar2(20)
)

// Q2.
-- TEST 테이블에JOB 컬럼을추가하십시오.(JOB VARCHAR2(10)) --
alter table TEST
    add(JOB varchar2(10));

// Q3.
-- TEST 테이블에JOB 컬럼을삭제한후테이블이구조를확인하십시오. --
alter table TEST
    drop column JOB;

select * from TEST;

// Q4.
-- TEST 테이블에ID 컬럼의PRIMARY KEY 제약조건을추가하십시오. --
alter table TEST
    add constraint PK
    primary key(ID);
    
// Q5. 
-- 제약조건을확인하십시오. --
select * from TEST;

// Q6.
-- ID 컬럼에설정된제약조건을삭제하십시오. --
alter table TEST
    drop constraint PK;
    
// Q7.
-- member 테이블에서사원번호, 이름, 직위만보여주는member_view 뷰를만드십시오.--
create view v1(dept_id, name, jikwi)
as select dept_id, name, jikwi
from member;


// Q8.
--만든뷰에대한정보를확인하십시오. --
SELECT * FROM v1;

// Q9.
-- ID_SEQ 시퀀스를생성하십시오. (시작값: 100, 증가값: 10, 최대값: 1000)  --
create sequence sq1
start with 100
increment by 10
maxvalue 1000;

create table member2
( 
     ID number(5,1)
 )
 
 alter table member2
    modify ID number(5,1);

insert into member2 values(sq1.nextval);
insert into member2 values(sq1.nextval);
insert into member2 values(sq1.nextval);
