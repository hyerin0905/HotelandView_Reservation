-- reservation(예약) 테이블 (변경 후)--
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

insert into t_reservation(reservation_idx, user_name, reservation_contact, check_in, room_type, pool_reservation, check_out)
(
	select ifnull(max(reservation_idx), 0) +1, '고길동', '010-1235-1235', '2023-01-02', 'standard', 'N', '2023-01-04'
    from t_reservation

);

insert into t_reservation(reservation_idx, user_name, reservation_contact, check_in, room_type, pool_reservation, check_out)
(
	select ifnull(max(reservation_idx), 0) +1, '고길동', '010-1235-1235', '2023-01-03', 'delux', 'N', '2023-01-05'
    from t_reservation

);

-- 예약 시 데이터가 모두 동일할 경우 무시되는 쿼리--
insert ignore into t_reservation (check_in, room_type, check_out)
values('2023-01-02' ,  'standard', '2023-01-04');

select * from t_reservation;

 -- UTF-8로 변경하는 방법 --   
ALTER TABLE t_reservation  
COLLATE='euckr_korean_ci',
CONVERT TO CHARSET euckr;

 -- ask(문의) 테이블--   
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





