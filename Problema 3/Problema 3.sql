drop database if exists fixo;
CREATE DATABASE fixo;
use fixo;
create table direccion(
	idDireccion int primary key,
    Direccion varchar(45),
    Ciudad varchar(45),
    Pais varchar(45)
);

create table categoria(
	idCategoria int primary key,
    Nombre varchar(45)
);

create table cliente(
	idCliente int primary key,
    Nombre varchar(45),
    Apellido varchar(45),
    Edad int,
    Direccion_idDireccion int,
    foreign key(Direccion_idDireccion) references direccion(idDireccion)
);

create table peliculas(
	idPeliculas int primary key,
    Nombre varchar(45),
    Duracion int,
    Descripcion text,
    Año int,
    Categoria_idCategoria int,
    foreign key(Categoria_idCategoria) references categoria(idCategoria)
);

create table inventario(
	idCopiasPeliculas int primary key,
    Disponible tinyint,
    Peliculas_idPeliculas int,
    foreign key(Peliculas_idPeliculas) references peliculas(idPeliculas)
);

create table renta(
	idRenta int primary key,
    fecha_Renta date,
    fecha_Entrega date,
    Inventario_idCopiasPeliculas int,
    Cliente_idCliente int,
    foreign key(Cliente_idCliente) references cliente(idCliente),
    foreign key(Inventario_idCopiasPeliculas) references inventario(idCopiasPeliculas)
);

insert into direccion values 
(1, 'Av. Siempre Viva 742', 'Springfield', 'USA'),
(2, 'Calle Falsa 123', 'Madrid', 'España'),
(3, 'Rua das Flores 456', 'Lisboa', 'Portugal'),
(4, 'Boulevard des Capucines 22', 'París', 'Francia'),
(5, 'Via Roma 88', 'Roma', 'Italia');

insert into categoria values 
(1, 'Acción'),
(2, 'Comedia'),
(3, 'Drama'),
(4, 'Terror'),
(5, 'Ciencia Ficción');

insert into cliente values 
(1, 'Juan', 'Pérez', 30, 1),
(2, 'María', 'González', 25, 2),
(3, 'Luís', 'Martínez', 40, 3),
(4, 'Ana', 'Silva', 22, 4),
(5, 'Juliana', 'Rossi', 35, 5);

insert into peliculas values 
(1, 'Rápidos y Furiosos', 130, 'Carreras callejeras y acción sin límites.', 2001, 1),
(2, 'La Máscara', 101, 'Un hombre tímido se transforma con una máscara mágica.', 1994, 2),
(3, 'Cadena Perpetua', 142, 'Historia de esperanza y redención en prisión.', 1994, 3),
(4, 'El Conjuro', 112, 'Investigadores paranormales enfrentan una entidad demoníaca.', 2013, 4),
(5, 'Pokemon1', 136, 'Un entrenador novato busca ganarlo todo.', 1999, 1);

insert into inventario values 
(1, 1, 1),
(2, 1, 2),
(3, 0, 3),
(4, 1, 4),
(5, 0, 5);

insert into renta values 
(1, '2025-04-01', '2025-04-03', 1, 1),
(2, '2025-04-05', '2025-04-07', 2, 2),
(3, '2025-04-10', '2025-04-13', 3, 3),
(4, '2025-04-12', '2025-04-14', 4, 4),
(5, '2025-04-15', '2025-04-17', 5, 5);

-- Buscar el nombre Juliana
select * from cliente where Nombre = 'Juliana';
select * from peliculas where Nombre = 'Juliana';

-- Eliminar una consulta llamada Pokemon1
delete from peliculas where Nombre = 'Pokemon1';

-- Ordenar de manera ascendente
select * from peliculas order by Nombre asc;
-- Ordenar de manera descendente
select * from peliculas order by Nombre desc;