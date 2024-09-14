-- Ko chạy khúc này

select P.product_id as product_id, P.product_tittle as product_tittle, P.product_import_price as product_import_price, P.product_price as product_price, P.product_sale_percent as product_sale_percent,
P.product_disciption as product_disciption, PS.product_size_s as product_size_s, PS.product_size_m as product_size_m,
PS.product_size_l as product_size_l, PS.product_size_xl as product_size_xl, P.catelogy_id as catelogy_id
from Product P 
join ProductSize PS on P.product_id = PS.product_id
join Category C on P.catelogy_id = C.category_id
where P.product_tittle like ?

select C.*, p.product_tittle, P.product_price
from Cart C
join Product P on P.product_id = C.product_id
left join Orders O on O.order_id = C.order_id
where C.customer_id = 3

select C.product_size_s, C.product_size_m, C.product_size_l, C.product_size_xl
from Cart C
join Product P on P.product_id = C.product_id
left join Orders O on O.order_id = C.order_id
where C.customer_id = ? AND C.product_id = ?

delete from Cart where product_id = 2; 
delete from ProductSize where product_id = 2; 
delete from Product where product_id = 2; 

INSERT INTO Product VALUES(1,'CYBER DARK MARCUS TEE', 450000, 500000, 0, 'NEEDS OF WISDOM® / Streetwear / Based in Saigon / Made in Vietnam', 1);
INSERT INTO ProductSize VALUES(10, 10 , 10, 10, 8);

INSERT INTO Product VALUES(?, ?, ?, ?, ?, ?, ?);
INSERT INTO ProductSize VALUES(?, ? , ?, ?, ?);

select top 1 product_id from Product order by product_id desc

update Product
set product_tittle = ?,
product_import_price = ?,
product_price = ?,
product_sale_percent = ?,
product_disciption = ?,
catelogy_id = ?
where product_id = ?;
update ProductSize
set product_size_s = ?,
product_size_m = ?,
product_size_l = ?,
product_size_xl = ?
where product_id = ?;

INSERT INTO Cart VALUES(2, 3, null, 'L', 1);
INSERT INTO Cart VALUES(?, ?, null, ?,?,?,?);

delete from Cart where customer_id = 4 and product_id = 4 and size = 'XL'
select * from Cart;
select * from Cart where product_id = 3 AND customer_id = 4;

delete from Cart where customer_id = 4 AND product_id = 3 AND size ='L'
delete from Orders where customer_id = 2
delete from Customer where customer_id = 2
delete from Account where account_id = ?

select top 1 account_id from Account order by account_id DESC;

select size from Cart where product_id = 3 AND customer_id = 4

update Cart
set quantity = 1
where product_id = 3 AND customer_id = 4 AND size = 'XL'

insert into Orders values(?,?,?)

select top 1 order_id from Orders order by order_id DESC;

update Cart
set order_id = ?
where product_id = ? AND customer_id = ? 

select product_size_xl from ProductSize where product_id = 2

update ProductSize
set product_size_l = ?
where product_id = ?
select product_size_xl from ProductSize where product_id = 1

select * from Orders
