create database if not exists big3 default character set utf8 collate utf8_general_ci;

create user 'big3'@'localhost' identified by '1111';

grant all privileges on big3.* to 'big3'@'localhost';

use big3;

DROP TABLE IF EXISTS branch_master;
DROP TABLE IF EXISTS branch_file;
DROP TABLE IF EXISTS branch;
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS event_template;
DROP TABLE IF EXISTS event_file;
DROP TABLE IF EXISTS board_mgr;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS menu_img;
DROP TABLE IF EXISTS template;
DROP TABLE IF EXISTS temp_file;
DROP TABLE IF EXISTS temp_mgr;

-- 점주 테이블
CREATE TABLE `branch_master` (
	`bmno`    INT(11)      NULL     COMMENT 'bmno', -- bmno
	`bmemail` VARCHAR(40)  NOT NULL COMMENT 'bmemail', -- bmemail
	`bmpwd`   VARCHAR(100) NOT NULL COMMENT 'bmpwd', -- bmpwd
	`bmname`  VARCHAR(40)  NOT NULL COMMENT 'bmname', -- bmname
	`bmtel`   VARCHAR(30)  NOT NULL COMMENT 'bmtel', -- bmtel
	`bmdate`  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'bmdate', -- bmdate
	`bmfbid`  VARCHAR(40)  NULL     COMMENT 'bmfbid', -- bmfbid
	`bmgrade` VARCHAR(20)  NULL     DEFAULT 'normal' COMMENT 'bmgrade' -- bmgrade
)
COMMENT 'branch_master';

-- 지점 테이블
CREATE TABLE `branch` (
	`bno`    INT(11)      NULL     COMMENT 'bno', -- bno
	`bmno`   INT(11)      NULL     COMMENT 'bmno', -- bmno
	`bname`  VARCHAR(30)  NOT NULL COMMENT 'bname', -- bname
	`baddr`  VARCHAR(50)  NOT NULL COMMENT 'baddr', -- baddr
	`btel`   VARCHAR(30)  NOT NULL COMMENT 'btel', -- btel
	`bintro` VARCHAR(200) NOT NULL COMMENT 'bintro', -- bintro
	`bdate`  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'bdate', -- bdate
	`barea`  VARCHAR(50)  NULL     COMMENT 'barea' -- barea
)
COMMENT 'branch';


-- 지점 파일 관리 테이블
CREATE TABLE `branch_file` (
	`fmno`           INT(11)      NULL     COMMENT 'fmno', -- fmno
	`bno`           INT(11)      NULL     COMMENT 'bno', -- bno
	`ori_file_name`  VARCHAR(260) NOT NULL COMMENT 'ori_file_name', -- ori_file_name
	`save_file_name` VARCHAR(36)  NOT NULL COMMENT 'save_file_name', -- save_file_name
	`fm_date_time`   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'fm_date_time', -- fm_date_time
	`fm_udate_time`  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'fm_udate_time', -- fm_udate_time
	`save_user_name` VARCHAR(30)  NOT NULL COMMENT 'save_user_name', -- save_user_name
	`del_chk`        VARCHAR(10)  NOT NULL DEFAULT 'N' COMMENT 'del_chk' -- del_chk
)
COMMENT 'branch_file';


-- 이벤트 테이블
CREATE TABLE event (
   evno       INT(11)       NULL,
   etpno      INT(11)       NULL,
   bno        INT(11)       NULL,	
   evtype     VARCHAR(40)   NULL,
   evtitle    VARCHAR(40)   NULL ,
   evinfo     VARCHAR(200)  NULL ,
   evcontent  VARCHAR(200)  NULL ,
   evcontent2 VARCHAR(200)  NULL ,
   evsdate    DATETIME 	    NULL ,
   evedate    DATETIME      NULL,
   delchk     VARCHAR(40)   NULL DEFAULT 'N',
   evimg      VARCHAR(200)  NULL
);

-- 이벤트 파일 관리 테이블
CREATE TABLE `event_file` (
	`efno`           INT(11)      NULL     COMMENT 'efno', -- efno
	`evno`           INT(11)      NULL     COMMENT 'evno', -- evno
	`ori_file_name`  VARCHAR(260) NOT NULL COMMENT 'ori_file_name', -- ori_file_name
	`save_file_name` VARCHAR(36)  NOT NULL COMMENT 'save_file_name', -- save_file_name
	`fm_date_time`   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'fm_date_time', -- fm_date_time
	`fm_udate_time`  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'fm_udate_time', -- fm_udate_time
	`save_user_name` VARCHAR(30)  NOT NULL COMMENT 'save_user_name', -- save_user_name
	`del_chk`        VARCHAR(10)  NOT NULL DEFAULT 'N' COMMENT 'del_chk' -- del_chk
)
COMMENT 'event_file';

-- 이벤트 템플릿 테이블
CREATE TABLE event_template (
   etpno      INT(11)       NULL     ,
   etptitle   VARCHAR(40)   NOT NULL ,
   etpinfo    VARCHAR(200)   NOT NULL ,
   etpdate    DATETIME   NOT NULL DEFAULT NOW(),
   delchk    VARCHAR(40)   NOT NULL DEFAULT 'N'  ,
   etpimg     VARCHAR(200)  
);



-- 게시판 정보 테이블

create table board_mgr(
    bmdno integer null,
    bdtype varchar(20) not null,
    manager varchar(20) not null,
    bdinfo varchar(300) not null,
    bddate datetime not null default now(),
    visible char(1) not null default 'Y'
);

alter table board_mgr add constraint primary key member_bmdno_pk(bmdno);
alter table board_mgr modify bmdno integer not null auto_increment;
alter table board_mgr add constraint unique key member_memail_uni(bdtype);

-- 게시판 테이블

create table board(
    bdno integer null,
    bdtype varchar(20) not null,
    bdwriter varchar(20) not null,
    bdsubject varchar(40) not null,
    bdhit integer not null default 0,
    bdcontent varchar(300) not null,
    bddate datetime not null default now(),
    bdupdate datetime not null default now(),
    delchk char(1) not null default 'N'
);

alter table board add constraint primary key board_bdno_pk(bdno);
alter table board modify bdno integer not null auto_increment;


-- 댓글

create table reply(
    rno integer null,
    bdno integer not null,
    rcontent varchar(20) not null,
    replyer varchar(20) not null,
    rsubject varchar(40) not null,
    rdate datetime not null default now()
);

alter table reply add constraint primary key reply_rno_pk(rno);
alter table reply modify rno integer not null auto_increment;

-- 메뉴 테이블

create table menu(
    mno integer null,
    mtype varchar(30) not null,
    mname varchar(40) not null,
    mprice varchar(40) not null,
    mcontent varchar(100) not null,
    mkcal varchar(30) not null,
    mdate datetime not null default now(),
    delchk char(1) not null default 'N',
    manager varchar(40) not null
);

alter table menu add constraint primary key menu_mno_pk(mno);
alter table menu modify mno integer not null auto_increment;

-- 템플릿

create table template(
    tpno integer null,
    tpmno integer not null,
    tptype varchar(30) not null,
    tparea varchar(40) not null,
    tpdate datetime not null default now(),
    tpupdate datetime not null default now()
);

alter table template add constraint primary key template_tpno_pk(tpno);
alter table template modify tpno integer not null auto_increment;
alter table template add constraint foreign key template_tpno_fk(tpmno)
references temp_mgr(tpmno);

-- 템플릿 파일

create table temp_file(
    tfno integer null,
    tpmno integer not null,
    filename varchar(255) not null,
    newfilename varchar(255) not null,
    tpmdate datetime not null default now(),
    visible char(1) not null default 'Y',
    filepath varchar(255) not null
);

alter table temp_file add constraint primary key temp_file_tpmno_pk(tfno);
alter table temp_file modify tfno integer not null auto_increment;
alter table temp_file add constraint foreign key template_tpno_fk(tpmno)
references temp_mgr(tpmno);

-- 템플릿 쿼리

select tpno, tptype, group_concat(tpareaa) from template where tptype = 'type1';

select tpno, tptype, tpareaa, tpdate, tpupdate, manager
from template

insert into template(tptype, tpareaa, tpdate, tpupdate, manager)
values('type1','area6',default,default,'admin');

drop procedure if exists inserttemplate;
DELIMITER $$
create procedure inserttemplate()
BEGIN
  DECLARE i INT DEFAULT 7;
  
  WHILE(i <= 12) DO
   INSERT INTO template(tpno, tptype, tpareaa, tpdate, tpupdate, manager)
   VALUES(i, 'type2', concat('area',i), default, default, 'admin');
   SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;
call inserttemplate();

-- 게시판 더미

drop procedure if exists insertarticle;
DELIMITER $$
create procedure insertarticle()
BEGIN
  DECLARE i INT DEFAULT 1;
  
  WHILE(i <= 100) DO
   INSERT INTO board(bdno, bdtype, bdwriter, bdsubject, bdhit, bdcontent,
    bddate, bdupdate, delchk)
   VALUES(i, concat('테스트데이터',i), '관리자', concat('제목',i), default, concat('테스트내용',i), default, default, default);
   SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;
call insertarticle();


-- 메뉴 템플릿 정보 관리자

create table temp_mgr(
    tpmno integer null,
    tptype varchar(40) not null,
    tpmdate datetime not null default now(),
    manager varchar(40) not null,
    tpmcomment varchar(50) null
);

alter table temp_mgr add constraint primary key temp_mgr_tpno_pk(tpmno);
alter table temp_mgr modify tpmno integer not null auto_increment;


insert into template1(tptype, tparea1, tparea2, tparea3, tparea4, tparea5, tparea6, tpdate, tpupdate, manager)
values('type1','1','2','3','4','5','6',default,default,'관리자');

select tp.tptype, tp.tparea1, tp.tparea2, tp.tparea3, tp.tparea4, tp.tparea5, tp.tparea6, tp.tpdate, tp.tpupdate, tp.manager
from temp_mgr tg , template1 tp
where tg.tpno = tp.tpno
