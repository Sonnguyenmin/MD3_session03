create database quanlybanhang;
use quanlybanhang;

create table customer (
	c_id int auto_increment primary key,
    c_name varchar(100) not null,
    c_age int check (c_age > 0)
);

create table orders (
	o_id int auto_increment primary key,
    c_id int not null,
    foreign key (c_id) references customer(c_id),
    o_date datetime not null,
    o_total_price double check (o_total_price > 0)
);

create table product (
	p_id int auto_increment primary key,
    p_name varchar(100) not null,
    p_price double check (p_price > 0)
);

create table order_detail (
	o_id int not null, 
    foreign key (o_id) references orders (o_id),
    p_id int not null,
    foreign key (p_id) references product (p_id),
    od_qty int check (od_qty >= 0)
);

insert into customer (c_name, c_age) values
('Minh Quan', 10),
('Ngoc Oanh',20),
('Hong Ha', 50);

insert into orders ( c_id, o_date, o_total_price) values
(1, '2006-3-21', 150000),
(2, '2006-3-23', 200000),
(1, '2006-3-16', 170000);

insert into product (p_name, p_price) values
('May giat', 300),
('Tu lanh', 500),
('Dieu hoa', 700),
('Quat', 100),
('Bep dien', 200),
('May hut mui', 500);
	
insert into order_detail (o_id, p_id, od_qty) values 
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

select * from customer;
select * from orders;
select * from product;
select * from order_detail;

select o_id, o_date, o_total_price from orders;

#Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách hàng đó.
SELECT c_name, p_name, od_qty
FROM customer c inner join orders o on c.c_id = o.c_id inner join order_detail od on o.o_id = od.o_id  
inner join product p on od.p_id = p.p_id order by c.c_name, p.p_name;

#Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c_name from customer c left join orders o on c.c_id = o.c_id where o.o_id is null;

#Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
#(giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
#Giá bán của từng loại được tính = odQTY * pPrice)

select o_date, o_total_price from 
orders o inner join order_detail od on o.o_id = od.o_id
inner join product p on od.p_id = p.p_id ;
