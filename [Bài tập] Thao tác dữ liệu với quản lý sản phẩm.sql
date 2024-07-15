create database quanlysanpham;
use quanlysanpham;

create table product (
	id int auto_increment primary key,
    name varchar(100) not null,
    created date not null
);

create table color (
	id int auto_increment primary key,
    name varchar(100) not null,
    status bit(1) default 1
);

create table size (
	id int auto_increment primary key,
    name varchar(100) not null,
    status bit(1) default 1
);

create table product_detail (
	id int auto_increment primary key,
    product_id int not null,
    foreign key (product_id) references product(id),
    color_id int not null,
    foreign key (color_id) references color(id),
    size_id int not null,
    foreign key (size_id) references size(id),
    price double check(price > 0),
    stock int check (stock >= 0),
    status bit(1) default 1
);

insert into color (name) values 
('Red'),
('Blue'),
('Green');

insert into size (name) values
('X'),
('M'),
('L'),
('XL'),
('XXL');

insert into product (name, created) values
('Quần dài', '1990-5-12'),
('Áo dài', '2005-10-5'),
('Mũ phớt', '1995-07-07');

insert into product_detail (product_id, color_id, size_id, price, stock, status) values
(1, 1, 1, 1200, 5, 1),
(2, 1, 1, 1500, 2, 1),
(1, 2, 3, 500, 3, 1),
(1, 2, 3, 1600, 3, 0),
(3, 1, 4, 1200, 5 , 1),
(3, 3, 5, 1200, 6, 1),
(2, 3, 5, 2000, 10, 0);

select * from color;
select * from size; 
select * from product; 
select * from product_detail;

# Hiển thị thông tin sản phẩm chi tiết có giá lớn hơn 1200
select price from product_detail where price > 1200;

# Hiển thị tất cả sản phẩm chi tiêt của sản phẩm có mã là 1
select * from product_detail where product_id = 1;
