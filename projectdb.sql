create table t_reservation (
	reservation_idx		int(11)			not null	auto_increment,
    user_name			varchar(20)		not null,
    reservation_contact	varchar(200)	not null,
    check_in			datetime		not null,
    room_type			varchar(200)	not null,
    pool_reservation	char(1)			not null,
    check_out			datetime		not null,
    primary key(reservation_idx)
);

    
ALTER TABLE t_reservation  -- UTF-8로 변경하는 방법 --
COLLATE='euckr_korean_ci',
CONVERT TO CHARSET euckr;

    
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


create table t_check_rsv (
	check_idx		int(11)			not null		auto_increment,
    input_name		varchar(45)		not null,
    input_phone		varchar(45)		not null,
    primary key(check_idx)
);

