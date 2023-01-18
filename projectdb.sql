-- 최종 예약테이블 --
create table t_reservation (
	reservation_idx		int(11)			not null		auto_increment,
    user_name			varchar(20)		not null,
    reservation_contact	varchar(200)	not null,
    check_in			date			not null,
    room_type			varchar(200)	not null,
    pool_reservation	char(1)			not null,
    check_out			date			not null,
    primary key(reservation_idx)
);

select * from t_reservation;

-- 선생님이 도와주신 기능 --
select * from t_reservation 
where
room_type = 'delux' 
and 
user_name = '홍길동'
and
( 
	check_in between str_to_date('2023-01-01', '%Y-%m-%d') and str_to_date('2023-01-03', '%Y-%m-%d')
    or 
    check_out between str_to_date('2023-01-01', '%Y-%m-%d') and str_to_date('2023-01-03', '%Y-%m-%d')
);


insert into t_reservation(user_name, reservation_contact, check_in, room_type, pool_reservation, check_out)
values('홍길동', '010-1237-1237', '2023-01-03', 'delux', 'N', '2023-01-05');


-- insert into t_reservation(user_name, reservation_contact, check_in, room_type, pool_reservation, check_out)
-- values('홍길동', '010-1237-1237', '2023-01-03', 'delux', 'N', '2023-01-05')
-- where check_in = (select max(check_in) from t_reservation where check_in < '2023-01-03' and room_type = 'delux')  and check_out < '2023-01-05' ;


-- 우리 시스템에 적용이 잘 안됨 --
select * from t_reservation
where check_in = (select max(check_in) from t_reservation where check_in < '2023-01-03' and room_type = 'delux')  and check_out < '2023-01-05' ;

select * from t_reservation;

-- UTF-8로 변경하는 방법 --
ALTER TABLE t_reservation  
COLLATE='euckr_korean_ci',
CONVERT TO CHARSET euckr;

 
-- 중복방지 다른 테스트--
 create table t_reservation (
	reservation_idx		int(11)			not null,
    user_name			varchar(20)		not null,
    reservation_contact	varchar(200)	not null,
    check_in			date			not null,
    room_type			varchar(200)	not null,
    pool_reservation	char(1)			not null,
    check_out			date			not null,
    primary key(check_in, room_type)
);
-- insert into t_reservation(reservation_idx, user_name, reservation_contact, check_in, room_type, pool_reservation, check_out)
-- (
	-- select ifnull(max(reservation_idx), 0) +1, '고길동', '010-1235-1235', '2023-01-02', 'standard', 'N', '2023-01-04'
    -- from t_reservation

-- );

-- insert into t_reservation(reservation_idx, user_name, reservation_contact, check_in, room_type, pool_reservation, check_out)
-- (
	-- select ifnull(max(reservation_idx), 0) +1, '고길동', '010-1235-1235', '2023-01-03', 'delux', 'N', '2023-01-05'
    -- from t_reservation

-- );
-- insert into t_reservation(reservation_idx, user_name, reservation_contact, check_in, room_type, pool_reservation, check_out)
-- (
	-- select ifnull(max(reservation_idx), 0) +1, '홍길동', '010-1237-1237', '2023-01-03', 'delux', 'N', '2023-01-05'
    -- from t_reservation

-- );

-- insert ignore into t_reservation (check_in, room_type, check_out)
-- values('2023-01-03' ,  'delux', '2023-01-05');


-- 문의(Ask) 테이블 --   
create table t_ask (
   ask_idx     		int(11)          not null      auto_increment,
    title      		varchar(300)     not null,
    contents   		text             not null,
    hit_cnt     	smallint(10)     default '0',
    regist_dt   	datetime         not null,
    regist_id   	varchar(50)      not null,
    updated_dt  	datetime         null,
    updated_id  	varchar(50)      null,
    deleted_yn  	char(1)          not null      default 'N',
    primary key(ask_idx)
);


