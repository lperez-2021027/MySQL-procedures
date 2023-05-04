create database control_musica;
use control_musica;
##---creado tablas sin FK

	create table usuario(id_usuario int not null,
	nombres varchar (30),
	apellidos varchar (30),
	nombre_usuario varchar (15),
	contraseña varchar (30),
	pais varchar (20),
	fecha_nacimiento date,
	correo_electronico varchar (30),
	primary key (id_usuario));

create table metodo_pago(id_metodo int not null,
nombre varchar (30),
primary key(id_metodo));

	create table tipo_plan(id_plan int not null,
	nombre varchar (30),
	precio float,
	vencimiento date,
	primary key(id_plan));

create table genero(id_genero int not null,
nombre varchar (30),
primary key(id_genero));

	create table artista(id_artista int not null, 
	nombre varchar (35),
	primary key(id_artista));


##--------creando tablas con FK

    create table cuenta(id_cuenta int not null,
	id_metodo int,
	id_plan int,
	id_usuario int,
	primary key(id_cuenta),
	foreign key(id_metodo) references metodo_pago(id_metodo),
	foreign key(id_plan) references tipo_plan(id_plan),
	foreign key(id_usuario) references usuario(id_usuario));

create table album(id_album int not null,
nombre varchar(30),
id_artista int,
primary key(id_album),
foreign key (id_artista) references artista(id_artista));

	create table sencillo(id_sencillo int not null,
	duracion float,
	nombre varchar(50),
	id_album int,
	id_artista int,
	primary key(id_sencillo),
	foreign key (id_album) references album(id_album),
	foreign key (id_artista) references artista(id_artista));

create table genero_album(id_genero_album int not null,
id_album int,
id_genero int,
primary key(id_genero_album),
foreign key(id_album) references album(id_album),
foreign key(id_genero) references genero(id_genero));

	create table genero_sencillo(id_genero_sencillo int not null,
	id_sencillo int,
	id_genero int,
	primary key(id_genero_sencillo),
	foreign key(id_sencillo) references sencillo(id_sencillo),
	foreign key(id_genero) references genero(id_genero));

create table asignar_lista(id_asignar_lista int not null,
id_cuenta int,
nombre_lista varchar(30),
primary key(id_asignar_lista),
foreign key(id_cuenta) references cuenta(id_cuenta));

	create table lista_reproduccion(id_lista_repro int not null,
	nombre_lista int,
	reproducciones int,
	id_sencillo int,
	primary key(id_lista_repro),
	foreign key(nombre_lista) references asignar_lista(id_asignar_lista),
	foreign key(id_sencillo) references sencillo(id_sencillo));


##----añadiendo información a tablas sin fk------##

delimiter $$
create procedure insertar_datos_usu(id_usuario int,nombres varchar(30),apellidos varchar(30),nombre_usuario 
varchar(15),contraseña varchar(30),pais varchar(20),fecha_nacimiento date,correo_electronico varchar(30))
begin
	insert into usuario 
    values(id_usuario,nombres, apellidos, nombre_usuario, contraseña, pais, fecha_nacimiento,
    correo_electronico);
    end $$
delimiter $$
call insertar_datos_usu(1,'Juan','Perez','JuanitoPE','juanito1','Guatemala','2000-06-21','juanito01@gmail.com');
call insertar_datos_usu(2,'Pedro','Ramirez','ramirez01','RamirezGT','Guatemala','2004-04-11','ramirez01@gmail.com');
call insertar_datos_usu(3,'Jaime','Salas','Salasito','Salas00','Mexico','2001-11-13','jaime01@gmail.com');
call insertar_datos_usu(4,'Carlos','Estrada','Carlozz','Carlos1','Mexico','2005-01-01','carlos01@gmail.com');
call insertar_datos_usu(5,'Julio','Hernandez','JulioE','julionero1','Chile','1998-06-15','julio01@gmail.com');
call insertar_datos_usu(6,'Juarez','Asturia','Juarezzz','juarez01','Guatemala','2003-10-28','juarez01@gmail.com');
call insertar_datos_usu(7,'Jose','Franco','JoseFran','FRanco01','Chile','2001-03-31','jose01@gmail.com');
call insertar_datos_usu(8,'Jason','Smith','JasonLive','JasosnX','USA','2005-09-01','jason01@gmail.com');
call insertar_datos_usu(9,'Laura','Perez','LaurelPE','LauraNOESTA','Mexico','2009-01-21','Laurita01@gmail.com');
call insertar_datos_usu(10,'Evelyn','Pascual','LynUwU','eveLYN010','Guatemala','2005-01-29','evelyn01@gmail.com');

delimiter $$
create procedure insertar_datos_pago(id_metodo int, nombre varchar(30))
begin
	insert into metodo_pago 
    values(id_metodo,nombre);
    end $$
delimiter $$
call insertar_datos_pago(1,'Pay Pal');
call insertar_datos_pago(2,'Mastercard');
call insertar_datos_pago(3,'Tarjeta Debito');

delimiter $$
create procedure insertar_datos_plan(id_plan int,nombre varchar(30), precio float, vencimiento date)
begin
	insert into tipo_plan
    values(id_plan, nombre, precio, vencimiento);
    end $$
delimiter $$
call insertar_datos_plan(1,'Basico',10.50,'2021-10-14');
call insertar_datos_plan(2,'Medium',18.50,'2021-11-24');
call insertar_datos_plan(3,'Pro',24.50,'2021-12-31');
call insertar_datos_plan(4,'Pro Master',10.50,'2022-01-28');

delimiter $$
create procedure insertar_datos_genero(id_genero int, nombre varchar(30))
begin
	insert into genero
    values(id_genero, nombre);
    end $$
delimiter $$
call insertar_datos_genero(1,'Electro');
call insertar_datos_genero(2,'Drum and Bass');
call insertar_datos_genero(3,'Dupstep');
call insertar_datos_genero(4,'Rock');
call insertar_datos_genero(5,'Dead Metal');
call insertar_datos_genero(6,'Ambiental');
call insertar_datos_genero(7,'Instrumental');
call insertar_datos_genero(8,'City Pop');
call insertar_datos_genero(9,'Pop');
call insertar_datos_genero(10,'Jazz');

delimiter $$
create procedure insertar_datos_art(id_artista int, nombre varchar(35))
begin
	insert into artista
    values(id_artista, nombre);
    end $$
delimiter $$
call insertar_datos_art(1,'Sewerslvt');
call insertar_datos_art(2,'Frank Sinatra');
call insertar_datos_art(3,'Skrillex');
call insertar_datos_art(4,'Bring Me The Horizon');
call insertar_datos_art(5,'Anri');

##----añadiendo datos a tablas con FK
delimiter $$
create procedure insertar_datos_cnt(id_cuenta int, id_metodo int, id_plan  int, id_usuario int)
begin
	insert into cuenta
    values(id_cuenta, id_metodo, id_plan, id_usuario);
    end $$
delimiter $$
call insertar_datos_cnt(1,1,3,1);
call insertar_datos_cnt(2,1,1,2);
call insertar_datos_cnt(3,3,4,3);
call insertar_datos_cnt(4,2,2,4);
call insertar_datos_cnt(5,3,1,5);
call insertar_datos_cnt(6,2,3,6);
call insertar_datos_cnt(7,3,4,7);
call insertar_datos_cnt(8,1,1,8);
call insertar_datos_cnt(9,3,2,9);
call insertar_datos_cnt(10,2,4,10);

delimiter $$
create procedure insertar_datos_alb(id_album int, nombre varchar(30), id_artista int)
begin
	insert into album
    values(id_album,nombre,id_artista);
    end $$
delimiter $$
call insertar_datos_alb(1,'Skitzofrenia Simulation',1);
call insertar_datos_alb(2,'nothing but the best',2);
call insertar_datos_alb(3,'Recess',3);
call insertar_datos_alb(4,'sempiternal',4);
call insertar_datos_alb(5,'Timely!!',5);

delimiter $$
create procedure insertar_datos_sen(id_sencillo int, duracion float,nombre varchar(50),id_album int, id_artista int)
begin
	insert into sencillo
    values(id_sencillo,duracion,nombre,id_album,id_artista);
    end $$
delimiter $$
call insertar_datos_sen(1,6.34,'Purple hearts in her eyes',1,1);
call insertar_datos_sen(2,4.34,'I Break My Heart & Yours',1,1);
call insertar_datos_sen(3,2.27,'Fly Me To The Moon (Remastered)',2,2);
call insertar_datos_sen(4,3.57,'I love You Baby',2,2);
call insertar_datos_sen(5,5.03,'Ease My Mind',3,3);
call insertar_datos_sen(6,3.40,'Try It Out',3,3);
call insertar_datos_sen(7,3.48,'Can You Feel My Heart',4,4);
call insertar_datos_sen(8,3.56,'Sleepwalking',4,4);
call insertar_datos_sen(9,4.55,'Remember Summer Days',5,5);
call insertar_datos_sen(10,4.15,'Windy Summer',5,5);

delimiter $$
create procedure insertar_datos_gsen(id_genero_sencillo int,id_sencillo int,id_genero int)
begin
	insert into genero_sencillo
    values(id_genero_sencillo ,id_sencillo ,id_genero);
    end $$
delimiter $$
call insertar_datos_gsen(1,1,2);
call insertar_datos_gsen(2,2,7);
call insertar_datos_gsen(3,3,9);
call insertar_datos_gsen(4,4,10);
call insertar_datos_gsen(5,5,3);
call insertar_datos_gsen(6,6,1);
call insertar_datos_gsen(7,7,4);
call insertar_datos_gsen(8,8,5);
call insertar_datos_gsen(9,9,8);
call insertar_datos_gsen(10,10,6);

delimiter $$
create procedure insertar_datos_galb(id_genero_album int,id_album int,id_genero int)
begin
	insert into genero_album
    values(id_genero_album ,id_album ,id_genero);
    end $$
delimiter $$
call insertar_datos_galb(1,1,2);
call insertar_datos_galb(2,2,10);
call insertar_datos_galb(3,3,3);
call insertar_datos_galb(4,4,4);
call insertar_datos_galb(5,5,8);

delimiter $$
create procedure insertar_datos_aslst(id_asignar_lista int,id_cuenta int,nombre_lista varchar(30))
begin
	insert into asignar_lista
    values(id_asignar_lista ,id_cuenta ,nombre_lista);
    end $$
delimiter $$
call insertar_datos_aslst(1,1,'Para pensar');
call insertar_datos_aslst(2,2,'Concentrado');
call insertar_datos_aslst(3,3,'Viejos Tiempos');
call insertar_datos_aslst(4,4,'Japonesas');
call insertar_datos_aslst(5,5,'Para alocarnos');
call insertar_datos_aslst(6,6,'Divagando');
call insertar_datos_aslst(7,7,'Pura roca');
call insertar_datos_aslst(8,8,'De todo');
call insertar_datos_aslst(9,9,'De aquellas');
call insertar_datos_aslst(10,10,'Mis favoritas');

delimiter $$
create procedure insertar_datos_lst(id_lista_repro int,nombre_lista int,reproducciones int,id_sencillo int)
begin
	insert into lista_reproduccion
    values(id_lista_repro,nombre_lista,reproducciones,id_sencillo);
    end $$
delimiter $$
call insertar_datos_lst(1,10,10,10);
call insertar_datos_lst(2,9,20,1);
call insertar_datos_lst(3,8,11,2);
call insertar_datos_lst(4,7,19,9);
call insertar_datos_lst(5,6,9,6);
call insertar_datos_lst(6,5,24,3);
call insertar_datos_lst(7,4,14,8);
call insertar_datos_lst(8,3,5,7);
call insertar_datos_lst(9,2,18,4);
call insertar_datos_lst(10,1,29,5);
##--------Por alguna razón el comando call no se ejecuta si selecciona todo y ejecuta
##--------Debido a eso se debe selleccionar cada bloque de comandos call y ejecutar
##--------No tengo idea si solo a mi me sucede, pero por si las dudas aquí se lo señalo


##--consultas
show tables

##-1
delimiter $$
create procedure genero_y_artista(Id int)
begin
select artista.nombre as genero_y_artista from artista, genero_album, album where Id = genero_album.id_genero 
and genero_album.id_album = album.id_album and album.id_artista = artista.id_artista;
end$$
delimiter ;
call genero_y_artista(3);

##-2
delimiter $$
create procedure usuario_met_pago(Id varchar(30))
begin
select usuario.nombres , metodo_pago.nombre as metodo_pago from cuenta , metodo_pago , usuario where 
 Id = metodo_pago.nombre and metodo_pago.id_metodo=cuenta.id_metodo and cuenta.id_usuario = usuario.id_usuario;
end$$
delimiter ;
call usuario_met_pago('Mastercard');

##-3
delimiter $$
create procedure usuario_plan(Id varchar(30))
begin
select usuario.nombres , tipo_plan.nombre as tipo_plan , tipo_plan.precio from usuario , cuenta , tipo_plan where
Id = tipo_plan.nombre and tipo_plan.id_plan = cuenta.id_plan and cuenta.id_usuario 
= usuario.id_usuario;  
end$$
delimiter ;
call usuario_plan ('Pro Master');

#-4
delimiter $$
create procedure ingresos_plan_basico(Id varchar(30))
begin
select sum(tipo_plan.precio) as ingresos_plan_basico from usuario , cuenta , tipo_plan where
Id = tipo_plan.nombre and tipo_plan.id_plan=cuenta.id_plan and cuenta.id_usuario = usuario.id_usuario;
end$$
delimiter ;
call ingresos_plan_basico('Basico');

#-5
delimiter $$
create procedure usuarios_chikitos()
begin
select usuario.nombres , usuario.fecha_nacimiento from usuario where usuario.fecha_nacimiento>'2003-10-05';
end$$
delimiter ;
call usuarios_chikitos();

#-6
delimiter $$
create procedure generos_y_artistas(Id varchar(30))
begin 
select artista.nombre , genero.nombre from artista , genero_album, genero, album where 
Id = genero.nombre and genero.id_genero = genero_album.id_genero and genero_album.id_album = 
album.id_album and album.id_artista = artista.id_artista;
end $$
delimiter ;
call generos_y_artistas('City Pop');

#-7
delimiter $$
create procedure usuario_por_pais(Id varchar(20))
begin
select count(usuario.id_usuario) , usuario.pais from usuario where Id = usuario.pais;
end$$
delimiter ;
call usuario_por_pais('Guatemala');

#-8
delimiter $$
create procedure usuarios_chikitos()
begin
select usuario.nombres , usuario.fecha_nacimiento from usuario where usuario.fecha_nacimiento>'2003-10-05';
end$$
delimiter ;
call usuarios_chikitos();

#-9
delimiter $$
create procedure pais_y_planes(Id varchar(20))
begin
select usuario.nombres , tipo_plan.precio , usuario.pais from usuario , tipo_plan , cuenta
 where Id =usuario.pais and cuenta.id_usuario=usuario.id_usuario and cuenta.id_plan = tipo_plan.id_plan;
end $$
delimiter ;
call pais_y_planes('Guatemala');

#-10
delimiter $$
create procedure total_usuarios ()
begin
select count(usuario.id_usuario) from usuario;
end $$ 
delimiter ;
call total_usuarios();