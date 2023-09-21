--2023-09-21 DB 정규화
--DB 정규화(Normalization)
--정규화란? 한마디로 db 서버의 메모리를 낭비하지 않기 위해서
--어떤 테이블을 식별자를 가지는 여러개의 테이블로 나누는 과정을 정규화라 한다
--정규화된 데이타베이스는 중복이 최소화되도록 설계된 데이타베이스이다
--장점 : 메모리를 절약할수 있다. 
--      구조화된 시스템으로 인해서 관리가 편하다
--단점 : 조회비율이 매우 높은 시스템의 경우에는 테이블간의 join 연산이 반복적으로
--       이뤄지기 때문에 질의 응답 속도가 살짝 늦어질수 있다

--student 의 num 을 외부키로 갖는 새로운 테이블 stuinfo 를 만들어보자
--외부키는 테이블 생성시에 설정해도 되고 나중에 설정해도된다

create table stuinfo (
      idx number(5) CONSTRAINT stuinfo_pk_idx primary key,
      num number(5),
      addr varchar2(20),
      hp varchar2(20));

-- student 의 num 을 외부키로 설정(이때 주의: student 의 num 은 반드시 primary key 라야 한다)
--ppt 29페이지에 있음
alter table stuinfo add CONSTRAINT stuinfo_fk_num FOREIGN key(num) references student(num);

--stuinfo 에 데이타를 추가해보자, 없는번호인 9번으로 insert 시 어떤 오류가 나는지 확인필요
-- 오류메세지: 무결성 제약조건(ANGEL.STUINFO_FK_NUM)이 위배되었습니다- 부모 키가 없습니다
--student 테이블이 부모테이블: 거기에 num 9 가 없어서 오류가 나는것
insert into stuinfo values (seq_stu.nextval,9,'서울시 강남구','010-2323-4545');
--만약 김말자의 정보일경우 김말자의 num 이 3 이므로 3으로 추가해야만 한다
insert into stuinfo values (seq_stu.nextval,3,'서울시 강남구','010-2323-4545');--김말자
insert into stuinfo values (seq_stu.nextval,6,'제주도','010-1234-1234');--영숙
insert into stuinfo values (seq_stu.nextval,8,'부산','010-8989-7878');--영자

--stuinfo 만 조회
select * from stuinfo;

--student 만 조회
select * from student;

--개인정보가 등록된 학생에 한해서 모든 정보를 출력해보자(inner join,equi join)
select 
    stu.name,stu.java,stu.spring,stu.ban,info.addr,info.hp
from student stu,stuinfo info
where stu.num=info.num; 

--컬럼명앞에 무조건 어느테이블 소속인지 붙였는데
-- 양쪽에 같은 컬럼이 없다면 생략래도 된다
select 
   stu.num, name,java,spring,ban,addr,hp
from student stu,stuinfo info
where stu.num=info.num; 

--개인정보가 등록되어있지 않은 학생들을 출력해보자 (outer join)
--sub table dp (+) : 동록이 안된 컬럼은 null 값으로 출력
select 
    stu.name,stu.java,stu.spring,stu.ban,info.addr,info.hp
from student stu,stuinfo info
where stu.num=info.num(+);

--위의 결과에 null 인 학생만 출력하고자 할경우
select 
    stu.name,stu.java,stu.spring,stu.ban,info.addr,info.hp
from student stu,stuinfo info
where stu.num=info.num(+) and info.addr is null;

--sub 테이블에 연결된 데이타가 있는데 부모테이블(student) 의 해다아 데이타를 삭제하고자 할경우
--오류발생: 무결성 제약조건(ANGEL.STUINFO_FK_NUM)이 위배되었습니다- 자식 레코드가 발견되었습니다
delete from student where num=3; --오류

delete from student where num=7; --지워짐,stuinfo 에 데이타가 없어서

--student 의 3번 데이타를 지워보자
--자식 테이블(stuinfo 의 num 이 3인 데이타를 먼저 삭제후 student 삭제)
delete from stuinfo where num=3;--자식 테이블 먼저 삭제
delete from student where num=3;--부모테이블 삭제

--부모 테이블 drop
--오류 발생 : 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다
drop table student;

--자식 테이블은 삭제가 될까요?네 됩니다
drop table stuinfo;

-----------------------------------------------------------------
-- 상품정보를 담을 shop 테이블
-- 장바구니에 담을 cart 테이블을 만드는데 상품정보 저장을 위해서 shop 의 num 을 외부키로 설정
-- 상품을 삭제하면 장바구니의 해당 데이타가 자동으로 삭제되도록 on delele cascade 설정해보자
-- 시퀀스도 새로 하나 만들어보자
create SEQUENCE seq_shop start with 10 increment by 10 nocache;

--shop table 생성
create table shop (
    sang_no number(5) constraint shop_pk_no primary key,
    sang_name varchar2(100),
    sang_price number(7),
    sang_color varchar2(20)
);

--외부키로 연결된 cart 테이블을 생성-shop 의 상품을 지우면 장바구니 목록은 자동으로 지워지도록
-- cascade 를 설정해서 생성해보자
create table cart (
    cart_no number(5) constraint cart_pk_no primary key,
    sang_no number(5),
    cnt number(5),
    cartday date
);

alter table cart add CONSTRAINT cart_fk_shopno FOREIGN key(sang_no) REFERENCES shop(sang_no) on delete cascade;

--model (ERD) 확인해보세요

-- 5개의 상품을 등록해보자
insert into shop values (seq_shop.nextval,'블라우스',23000,'yellow');
insert into shop values (seq_shop.nextval,'청바지',45000,'black');
insert into shop values (seq_shop.nextval,'브이넥티',11000,'white');
insert into shop values (seq_shop.nextval,'브이넥티',23000,'red');
insert into shop values (seq_shop.nextval,'체크자켓',130000,'gray');
commit;

--cart 에 블라우스,브이넥티(white),체크자켓 3개에 대해서 추가-날짜는 현재날짜로(sysdate)

--조회(inner join)
-- 상품명,가격,색상,갯수,구입일(yyyy-mm-dd hh24:mi) 

--아무도 cart 에 담지 않은 상품명 조회
-- 상품명,가격,색상을 출력






      
      
      
      
      
      
      
      
      
      

