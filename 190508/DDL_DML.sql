-- DDL

-- table 생성
create table member(
	no int not null auto_increment,
    email varchar(50) default 'a',
    passwd varchar(64) not null,
    name varchar(25),
    dept_name varchar(25),
    
    primary key(no)
);
desc member;

-- 한번 삽입 해본것
insert into member(passwd, name, dept_name) values(password('1234'), '안대혁', '시스템개발팀');
select * from member;

-- table 수정
-- member 테이블에 juminbunho char 타입, 반드시 입력되어야 하는 칼럼을 추가 하세요.
-- desc member로 추가 결과를  확인해 보세요. 
alter table member add juminbunho char(13) not null after no;
desc member;

-- 예제 2에서 추가했던, juminbunho 칼럼을 삭제 하세요.
-- desc member로 결과를 확인해 보세요. 
alter table member drop juminbunho;
desc member;

-- member 테이블에 회원 가입날짜  DATETIME 타입의 join_date 이름의 칼럼을 추가 하세요.
-- 반드시 입력되어야 하는 컬럼입니다.
alter table member add join_date datetime not null;
desc member;

-- Member 테이블의 Primary Key no에 자동 1씨기 증가하는 속성을 추가 해 보세요. 
-- ALTER TABLE member
alter table member change no no int unsigned not null auto_increment;
desc member;

-- member의 컬럼 deparment_name의 이름이  길어 dept_name으로 바꿀려고 합니다.
-- 수정해 보세요.
alter table member change dept_name department_name varchar(25);
desc member;

-- 테이블  member의 name 컬럼의 길이 제한을 10자로 줄이세요.
alter table member change name name varchar(10);
desc member;

-- member 테이블의 description을 저장하고 member 테이블을 삭제하세요.
-- 그리고 다시, 마지막 수정이 적용된 member테이블을 한 번에 생성해 보세요. 
drop table member;

-- member 테이블의 이름을 user 로 변경하세요.
alter table member rename user;
desc user;


-- DML
-- 삽입
insert into user values(null, '', password('1234'), '안대혁2', '시스템개발팀', now());
select * from user;

insert into user(join_date, name, passwd, department_name)
values(now(), '안대혁', password('1234'), '시스템개발팀');
select * from user;

-- 수정
-- 서브쿼리도 사용 가능하다 라는 것을 보여주는 예제
update user set join_date = (select now())
where no = 1;
select * from user;

-- 예제11 : user 번호가 1인 사용자의 이름을 영문으로 바꾸고,
-- 		   join_date을 현재 시간이 적용되도록 수정하세요.
update user
	set join_date = now(),
		name = 'Ahn'
        where no=1;
select * from user;

-- 삭제
-- 예제12 : user 번호가 1인 사용자를 삭제하여라,
delete from user where no = 1;
select * from user;


