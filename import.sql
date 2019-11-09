create database bytepl_manager;

use bytepl_manager;

create table usuario(
	id int auto_increment not null primary key,
	nombre varchar(150) not null,
	correo varchar(100) not null unique,
	contrasena varchar(15) not null,
	fecha datetime default now(),
	cargo varchar(50) default 'EMPLEADO',
	rol varchar(30) default 'USUARIO' 
);

create table nota(
	id int auto_increment not null primary key,
	titulo varchar(150) not null,
	descripcion varchar(1000) not null,
	fecha datetime default now(),
	id_usuario int not null,
	foreign key (id_usuario) references usuario(id)
);

create table tarea(
	id int auto_increment not null primary key,
	titulo varchar(150) not null,
	descripcion varchar(1000) not null,
	fecha datetime default now(),
	fecha_entrega date,
	id_usuario_envia int not null,
	id_usuario_recibe int not null,
	visto bool default false,
	recibido bool default false,
	proceso bool default false,
	foreign key (id_usuario_envia) references usuario(id),
	foreign key (id_usuario_recibe) references usuario(id)
);

create table sesion(
	id int auto_increment not null primary key,
	fecha datetime default now(),
	id_usuario int not null,
	foreign key (id_usuario) references usuario(id)
);


select count(*) from Usuario where correo = '' and contrasena = ''