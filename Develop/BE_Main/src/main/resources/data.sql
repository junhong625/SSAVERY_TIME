insert into user (user_name, password, user_email, track_code, region_code) values ('admin', '$2a$08$lDnHPz7eUkSi6ao14Twuau08mzhWrL4kyZGGU5xfiGALO/Vxd5DOi', 'admin@ssafy.com', 1, 1);
insert into user (user_name, password, user_email, track_code, region_code ) values ('user', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'user@ssafy.com',1, 1);

insert into authority (authority_name) values ('ROLE_USER');
insert into authority (authority_name) values ('ROLE_ADMIN');



insert into user_authority (user_idx, authority_name) values (1, 'ROLE_USER');
insert into user_authority (user_idx, authority_name) values (1, 'ROLE_ADMIN');
insert into user_authority (user_idx, authority_name) values (2, 'ROLE_USER');

insert into attendance(user_idx, attendance_category, attendance_date) values(1, 1, 20220101);
insert into attendance(user_idx, attendance_category, attendance_date) values(1, 1, 20220111);
insert into attendance(user_idx, attendance_category, attendance_date) values(1, 1, 20220121);



