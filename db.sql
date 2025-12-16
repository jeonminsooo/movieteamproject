create table tbl_login(
	id varchar2(100) not null,
	jumin char(14) not null,
	pw varchar2(15),
	name varchar2(100),
	asdf char(1),
	primary key(id, jumin)
);

insert into tbl_login values('test', '070000-000000', '1234', 'test', '0');

select * from tbl_login;

select * from tbl_login;

drop table tbl_login;
drop table tbl_movie;
drop table tbl_insert;

/*기존 영화 테이블*/
create table tbl_movie(
	mcode varchar2(10) not null primary key,	/*영화 코드*/
	mdir varchar2(100) not null,				/*영화 경로*/
	mname varchar2(400),						/*영화 제목*/
	tag varchar2(100),							/*장르*/
	director varchar2(100),						/*영화감독*/
	actor varchar2(100)							/*영화주연*/
);

insert into tbl_movie values('./영화포스터/공포/hr1.jpg', '29dayslater', '공포');

/*변경된 영화 테이블*/
create table tbl_movie(
	mcode varchar2(10) not null primary key,	/*영화 코드*/
	mdir varchar2(100) not null,				/*영화 경로*/
	mname varchar2(400),						/*영화 제목*/
	tag varchar2(100)							/*장르*/
);

drop table

insert into tbl_movie values('1', './영화포스터/공포/hr1.jpg', '29dayslater', '공포');

/*
 * 1. Main.jsp에서 29dayslater # 공포 [Button-예매]를 눌렀을 때 테이블 내 값을 추출해야함. [form action=""]
 * 2. 1번에서 추출한 값은 mcode로 '1'이란 값을 추출 할 수 있어야 함.
 * 3. Yeahmae.jsp에서 request.getparamater("mcode");로 또는 애플리케이션이나 세션값을 애트리뷰트로 받아와야함.
 * 4. 쉽게설명하면 insert폼에서 등록버튼을 누르고 insertDetail페이지에서 get파라메타로 값을 넘겨받는 것과 같은 이치.
 * 5. 받아온 값을 예매테이블로 넣는다. [넣어야될 값 = mcode, id] 
 * 6. 5번을 실행할 때 로그인한 계정의 값을 받아서 같이 넣어야 겟지?
 * 7. 예매조회 5~6번값을 통해 테이블조인하여 출력 (movie, member)
 * 8. 마이페이지에서도 예매내역확인 기능 구현
 * */




select mcode, mname, tag from tbl_movie where mname like '%아%';


select mname, tag from tbl_movie where mname like '%범죄%'
;

	

create table tbl_insert(
	id varchar2(100) not null,
	mcode varchar2(7),
	region char(20),
	m_date varchar2(10),
	m_time char(5),
	m_gan char(5),
	m_seat varchar2(20)
);
insert into tbl_insert values('민수', 'm1', '1', '2025-04-17 12:30', 'A');
insert into tbl_insert values('동환', 'm2', '2', '2025-04-18 13:30', 'B');
insert into tbl_insert values('민수', 'm3', '3', '2025-04-19 14:30', 'C');

create table genre(
	
);


select id, l.name, mname, m_gan, m_time, m_dreamflix
from tbl_login l, tbl_movie m, tbl_insert i 
where l.name = i.name and m.mcode = i.mcode;


insert into tbl_insert (region, m_date, m_time) values('서을', '2025-04-17', '12:30');
insert into tbl_insert (region, m_date, m_time) values('경기', '2025-04-18', '13:30');
insert into tbl_insert (region, m_date, m_time) values('인천', '2025-04-19', '14:30');
insert into tbl_insert (region, m_date, m_time) values('대전/충청', '2025-04-20', '15:30');
insert into tbl_insert (region, m_date, m_time) values('부산/울산', '2025-04-21', '16:30');

select * from tbl_movie;
select region, m_date, m_time from tbl_insert;

select l.id, mname, region, m_date, m_time, m_gan, m_seat from tbl_login l, tbl_insert i, tbl_movie m where id = ? and l.id = i.id and where = i.mcode = m.mcode;