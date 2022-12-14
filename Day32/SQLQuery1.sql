use DB4

create table 제품 (
	제품 nvarchar(30),
	제품명 nvarchar(100),
	primary key (제품)
)

create table 매출 (
	일자 nvarchar(08),
	제품 nvarchar(30),
	수량 numeric(18,0) default 0 null,
	primary key (일자, 제품)
)

insert into 제품 (제품, 제품명) values ('A1', '사과'), ('A2', '당근')

insert into 매출 (일자, 제품, 수량) values ('20200101', 'A1', 10), ('20200102', 'A2', 20)

select * from 제품
select * from 매출

--foreign key (외래키)
--테이블간의 관계(연관)에서 사용한다

--기본문법
--alter table [테이블명] add constraint fk이름 foreign key (테이블 컬럼)
--references [연결된테이블] (연결된 테이블 컬럼명)

alter table 매출 add constraint [매출_FK1] foreign key ([제품])
	references [제품] (제품)

--주의사항
-- 1. 연결하고자 하는 컬럼의 크기 데이터 유형이 동일해야한다
-- 2. 연결되는 테이블 칼럼은 기본키(pk) 또는 unique index 등 설정 되어야한다

select * from 매출

insert into 매출 (일자, 제품, 수량) values ('20200103', 'A3', 30)
-- 테이블과 충돌로인해 실행이 불가능하다 (논리에 맞게 추가해야한다)

delete A
from 제품 A
where A.제품 = 'A1'
and A.제품명 = '사과'
-- 해당 쿼리를 실행시 충돌이 일어나고 실행이되지않는다 
-- 이유는 제품의 제품열과 매출의 제품열이 서로 관계가 설정되어있어서 삭제가 불가하다

drop table 제품
-- 관계가 설정되있는 테이블은 삭제가 불가능하다

drop table 매출
-- 먼저 관계의 기준이되는 매출테이블을 삭제를 한다면 가능하다

drop table 제품
-- 관계의 기준이되는 매출테이블을 삭제가된다면 제품 관계가 이어져있는 제품테이블도 삭제가 가능하다

----------------------------------------------------------------------------------------------

--인덱스(index)

--조회(select), 수정(update), 삭제(delete) 등 실행 시 테이블의 데이터량이 많아
--속도 저하시 책의 목차(찾아보기)와 유사한 index를 생성하여 속도를 개선할수있다

--튜님 index 기본으로 설정한다

--인덱스 데이터 중복 허용 여부에 따라 일반 index와 unique index로 분류한다
--unique index는 기본키(pk)로 볼수있다 그래서 기본키를 사용하지 굳이 유니크 인덱스는 사용하지는 않는다

--단점
--인덱스 저장공간이 추가로 필요하다
--입력, 수정, 삭제시 처리속도가 저하된다
--(이유는 해당 테이블이 수정되거나 할때는 인덱스도 수정되어야 하기때문에 그렇다, 조회는 빨라서 좋다)

--문법
--매출 테이블에 index를 생성한다

-- 1.매출_index1 [제품] 단일키
-- 2.매출_index2 [일자], [제품] 복합키

-- 1
create index [매출_index1] on [매출] ([제품])

-- 2
create unique index [매출_index2] on [매출] ([일자], [제품])

select * from 매출 where 제품 = 'A2'
--[매출_index1]로 검색했을 확률이 높다 (인덱스를 만들어줬기때문)

insert into 매출 (일자, 제품, 수량) values ('20200101', 'A2', 10)

select * from 매출

--만약 프로젝트중에 조회하면 빠르게 조회가된다
--프로젝트가 끝나고 실제 사용자들이 사용하기 시작하면 데이터베이스 조회시간이 느려진다
--그랬을경우 첫번째 찾아보는게 인덱스이다

------------------------------------------------------------------

--임시테이블(temporary table)

--영구적으로 보관되지 않는다
--테이블 생성방법은 #을 붙이는 것이다
--create table 테이블명
--사용자의 세션별로 완전히 독립적으로 사용 가능한 임시테이블이다
--##임시테이블 : #임시테이블과 동일하지만 다른 사용자가 데이터를 조회 또는입력이 가능하다
--               ##임시테이블은 동시에 한사용자만 생성 할수있다
--			   글로벌임시테이블이라고 한다


--테이블을 활용한 자료 가공 처리시 문제점
--- 작업1 테이블을 이용하여 자료 가공 후 결과 조회 하는 업무를 한다고 가정

--사용자A (세션번호 : 100)
--- 이미 테이블이 존재하면 drop table 작업1
--- create table 작업1
--- create table 작업2
--- 자료가공 작업1 (insert, update, delete)
--- 결과조회 작업1 (select * from)

--사용자B (세션번호 : 200)
--- 이미 테이블이 존재하면 drop table 작업1
--- create table 작업1
--- create table 작업2
--- 자료가공 작업1 (insert, update, delete)
--- 결과조회 작업1 (select * from)

--만약 사용자A가 테이블 작업시 lock을 걸면 사용자B가 대기해야한다
--그래서 임시테이블을 이용해서 문제를 해결할수있다

