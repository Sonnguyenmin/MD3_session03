create database quanlykhohang;

use quanlykhohang;

create table accounts (
	id int auto_increment primary key,
    username varchar(100) unique not null,
    password varchar(100) not null,
    address varchar(255) not null,
    status bit
);

create table bill (
	id int auto_increment primary key,
    bill_type bit,
    acc_id int,
    foreign key (acc_id) references accounts(id),
    created datetime,
    auth_date datetime
);

create table product (
	id int auto_increment primary key,
    name varchar(100) unique not null,
    created date,
    price double check(price > 0),
    stock int check (stock >= 0),
    status bit 
);

create table bill_detail (
	id int auto_increment primary key,
    bill_id int ,
    foreign key (bill_id) references bill (id),
    product_id int,
    foreign key (product_id) references product(id),
    quantity int check (quantity >=0),
    price double check (price > 0)
);

select * from bill_detail;

insert into accounts ( username, password, address, status) values
('Hùng', '123456', 'Hưng Yên', 1),
('Cường' , '654321', 'Hà Nội', 1),
('Bách', '135790', 'Hải Dương', 1);

insert into bill ( bill_type, acc_id, created , auth_date) values
(0, 1, str_to_date('11/02/2022' , '%d/%m/%Y'), str_to_date('12/03/2022' , '%d/%m/%Y')),
(0, 1, str_to_date('05/10/2023' , '%d/%m/%Y'), str_to_date('10/10/2023' , '%d/%m/%Y')),
(1, 2, str_to_date('15/05/2024' , '%d/%m/%Y'), str_to_date('20/05/2024' , '%d/%m/%Y')),
(1, 3, str_to_date('01/02/2022' , '%d/%m/%Y'), str_to_date('10/02/2022' , '%d/%m/%Y'));


insert into product (name, created, price, stock, status) values
('Quần dài', str_to_date('12/03/2022' , '%d/%m/%Y'), 1200, 5, 1),
('Áo dài', str_to_date('15/03/2023' , '%d/%m/%Y'), 1500, 8, 1),
('Mũ cối', str_to_date('08/03/1999' , '%d/%m/%Y'), 1600, 10, 1);

insert into bill_detail (bill_id, product_id, quantity, price) values
(1, 1, 3, 1200),
(1, 2, 4, 1500),
(2, 1, 1, 1200),
(3, 2, 4, 1500),
(4, 3, 7, 1600);

-- Hiển thị tất cả account và sắp xếp theo user_name theo chiều giảm dần
select * from accounts order by username DESC;

-- Hiển thị tất cả bill từ ngày 11/2/2023 đến 15/5/2023
select * from bill where auth_date between  '2023-02-11' AND '2024-05-15';

-- Hiển thị tất cả bill_detail theo bill_id
select * from bill_detail bd inner join bill b on 
bd.bill_id = b.id where b.id = 1;
-- Hiển thị tất cả product theo tên và sắp xếp theo chiều giảm dần
select name from product order by name desc;
-- Hiển thị tất cả product có số lượng lớn hơn 10
select * from product where stock >= 10;
-- Hiển thị tất cả product còn hoạt động (dựa vào product_status)
select * from product where status = 1; 