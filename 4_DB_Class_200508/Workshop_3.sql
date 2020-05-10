//Q1
-- 주문번호 ‘19971213’에 대하여 주문번호, 주문순번, 제품번호, 주문수량을 주문수량의 오름차순으로 조회하세요. --
select a.ord_no "ORD_NO", b.line_no "LINE_NO", b.item_no "ITEM_",b.ord_qty "ORD_QTY"
from po_order_header a, po_order_detail b, po_item c
where a.ord_no = '19971213'
and a.ord_no=b.ord_no
and b.item_no=c.item_no
order by b.ord_qty;

//Q2
-- 1997년 12월에 공급처 ‘LG전자’로 주문한 모든 건에 대해 주문번호와 주문일 (YYYY-MM-DD 형식으로) 을
-- 주문 일의 내림차순으로 조회하세요. --
select a.ord_no, to_char(a.ord_date,'yyyy-mm-dd')
from po_order_header a, po_supplier b
where a.sup_no=b.sup_no
and b.sup_name like 'LG%'
and to_char(a.ord_date,'yyyymm') =199712
order by a.ord_date desc;

//Q3
-- 주문번호가 ‘19971203’인 주문에 대해 주문번호, 제품번호, 제품명, 제품별 주문수량 을 제품번호의 오름차순으로 조회하세요. --

select a.ord_no,b.item_no,c.item_name,b.ord_qty
from po_order_header a, po_order_detail b, po_item c
where a.ord_no = b.ord_no
and b.item_no=c.item_no
and a.ord_no ='19971203';

//Q4
-- 납기가 지났으나 납품이 완료되지 않은 모든 주문에 대하여 주문번호와 공급처 이름, 전화번호를 공급처 이름의 오름차순으로 조회하세요. --

select a.ord_no,b.sup_name,b.sup_phone
from po_order_header a,po_supplier b
where a.delv_date is null
and a.sup_no=b.sup_no
order by b.sup_name;

//Q5
-- ‘구매팀’, ‘외자팀’, ‘홍보부’ 내에서 각 부서별로 사번이 가장 빠른 사원의 부서명과 사원번호를 조회하세요. --

select emp_dep,min(emp_no)
from po_employeer
group by emp_dep
order by emp_dep;

//Q6
--  ‘홍보부’의 ‘박찬호’ 직원이 1997년에 주문을 낸 공급처의 이름과 공급처의 주소를 공급처 이름의 오름차순으로 중복되지 않게 조회하세요.--

select a.sup_name, a.sup_addr
from po_supplier a, po_employeer b, po_order_header c
where b.emp_name = '����ȣ'
and a.sup_no=c.sup_no
and c.ord_emp=b.emp_no
and to_char(c.ord_date,'yyyy')='1997';

//Q7
-- 공급처 ‘LG전자’ 로부터 1997년 12월에 납품받은 제품에 대한 총 지불 대금 즉, 각 제품 지불대금( 각 제품단가 * 제품 주문수량 ) 의 총합을 구하는 SQL문을 작성하세요. --

select sum(a.unit_price*d.ord_qty) "�� ���� ����"
from po_item a, po_order_header b, po_supplier c,po_order_detail d
where b.ord_no = d.ord_no
and d.item_no = a.item_no
and to_char(b.delv_date,'yy/mm')='97/12'
and c.sup_no=b.sup_no
and c.sup_name='LG����';


//Q8
--납기를 잘 지키지 않는 불량 공급자를 파악하기 위해 공급자별로 납기 미 준수횟수( 납품이 아직 안된 것은 제외) 가
-- 2건 이상인 공급처를 공급처 번호와 납기 미준수 횟수로 조회하세요. --

-- 8번 정답 --
select sup_no “공급자 번호“, count(sup_no) “미준수 횟수”
    from po_order_header
    where delv_date - due_date > 0
    group by sup_no
    having count(sup_no) >1;
-- 8번 정답 조인절 추가 --
select pH.sup_no “공급자 번호“, pS.sup_name “공급처“, count(pH.sup_no) “미준수 횟수”
    from po_order_header pH left outer join po_supplier pS
    on (pH.sup_no = pS.sup_no)
    where (pH.delv_date - pH.due_date) > 0
    group by pH.sup_no, pS.sup_name
    having count(pH.sup_no) >1;
-- 8번 정답 서브쿼리
select   sup_no “공급자 번호“, count(T) “미준수  횟수”
from
(
select sup_no, count(sup_no) as T
    from po_order_header
    where delv_date - due_date > 0
    group by sup_no
)
where T > 1
group by sup_no
order by sup_no asc;

//Q9
-- 1997년에 주문한 제품의 단가 중에 가장 높은 단가를 조회하세요. --
select max(b.unit_price)
from po_order_header a,po_item b,po_order_detail c
where to_char(a.ord_date,'yyyy')='1997'
and a.ord_no = c.ord_no
and c.item_no=b.item_no;
