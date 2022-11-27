# DDL - Create

create database store;


create table countries (
    code varchar(20) primary key,
    name varchar(20) unique ,
    continent_name nvarchar(20) NOT NULL
);

create table  users (
    id int primary key ,
    full_name varchar(25),
    email varchar(20) unique,
    gender varchar(1) check ( gender = 'f' OR gender='m'),
    date_of_birth varchar(20) ,
    country_code varchar(20),
    foreign key (country_code) references countries(code)
);

create table products(
    id int unique primary key ,
    name varchar(10) NOT NULL ,
    price int default 0,
    status varchar(10) check ( status = 'valid' OR status = 'expired'),
    create_at datetime default current_timestamp
);

create table orders (
    id int primary key ,
    user_id int ,
    status varchar(15) check ( status = 'start' OR  status = 'finish'),
    created_at datetime default current_timestamp,
    foreign key (user_id) references users(id)
);


create table order_product (
    order_id int ,
    product_id int,
    quantity int default 0,
    foreign key (order_id) references orders(id),
    foreign key (product_id) references products(id)
);


alter table orders
modify created_at datetime default current_timestamp;

alter table products
modify create_at datetime default current_timestamp;


# DQL - Select
select * from products;
select * from users;
select * from orders;
select * from countries;
select * from order_product;

# DML - insert

insert into countries values ('2343','saudi arabia','5566');
insert into users values (1,'Nasser Naif','nnnajs@gami.com','m','2032-35-28','2343');
insert into orders values (1,1,'start',default);
insert into orders values (2,1,'start',default);
insert into orders values (3,1,'finish',default);
insert into products values (1,'Iphone 14',5000,'expired',default);
insert into products values (2,'Iphone 11',default,'valid',default);
insert into order_product values (3,2,3);



# DML - Update
update countries set name='KSA' where code=2343;

# DML - Delete

delete from orders where id=1 OR id = 2