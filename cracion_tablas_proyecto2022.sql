--create database proyecto2022

--use proyecto2022

CREATE TABLE categoria (
  id_categoria int NOT NULL constraint PK_categoria PRIMARY KEY,
  categoria_desc varchar(30) NOT NULL
);

CREATE TABLE tipo_empleado(
	id_tipo int not null CONSTRAINT PK_tipo_empleado PRIMARY KEY, 
	nombre varchar (20)
);

create table sucursal (
	id_sucursal int not null constraint PF_sucursal PRIMARY KEY, 
	nombre varchar (50),
	direccion varchar (100),
	telefono decimal (11,0)
)
CREATE TABLE estado(
	id_estado int not null CONSTRAINT PK_estado PRIMARY KEY,
	nombre varchar (20)
);


CREATE TABLE empleado (
	dni_empleado int not null constraint PK_empleado PRIMARY KEY,
	apellido varchar (50),
	nombre varchar (50),
	domicilio varchar (100),
	email varchar (100),
	año_ingreso datetime,
	id_estado int not null,
	id_sucursal int not null,
	id_tipo int not null
);

CREATE TABLE cliente (
	dni_cliente int not null constraint PK_cliente PRIMARY KEY,
	apellido varchar (50),
	nombre varchar (50),
	domicilio varchar (100),
	email varchar (100)
);


CREATE TABLE producto (
	id_producto int not null constraint PK_producto PRIMARY KEY,
	nombre varchar(30),
	descripcion varchar(100),
	precio decimal,
	id_estado int not null, -- Poner esto solo para habilitar y deshabilitar el producto de acuerdo a las ventas en el dia, NO ESTARIAMOS ELIMINANDO SOLO PARA UN CONTROL, OSEA NO MOSTRAR 
	id_categoria int not null
);

--- En ese caso esta tabla producto_sucursal no haria falta ya que el producto se deshabilitaria en el caso de que en ninguna sucursal posean
-- en ese momento el producto

CREATE TABLE producto_sucursal (
	id_sucursal int not null,
	id_producto int not null,
	stock int not null,
	stock_minimo int not null
	constraint PK_producto_sucursal PRIMARY KEY (id_sucursal, id_producto)
);

CREATE TABLE venta (
	nro_venta int not null constraint PK_venta PRIMARY KEY,
	dni_cliente int not null,
	dni_empleado int not null,
	id_sucursal int not null, --- Pondriamos la sucursal en la venta de acuerdo a quien es la que prepara el pedido
	fecha_venta datetime
);

/* Eso lo hago porque averiguando para las WEB de distintos locales, el administrador va deshabilitando el producto de acuerdo
a las ventas del dia lo que quiere decir que NO podriamos comprar un producto que se encuentre deshabilitado ya que no se veria
en el menu.  No se manejan por stock poque no se sabe de ante manos el tipo de hamburguesa por ejemplo que se va a vender ni cuantas
de cada una. Tambien en algunas si es para retiros te da la opcion de seleccionar la sucursal cuando se realiza la venta por ende podriamos 
verlo como que para generar la venta, en ese caso, se deberia seleccionar la sucursal.*/ 

CREATE TABLE detalle_venta(
	nro_venta int not null,
	id_producto int not null,
	cantidad int not null,
	precio decimal 
	constraint PK_detalle_venta PRIMARY KEY (nro_venta, id_producto)
);

/*En el detalle lo que tendriamos va a ser solo la venta y la cantidad de productos que va a ser realizado por la sucursal que especificamos
en la tabla venta*/


--TABLA EMPLEADO
ALTER TABLE  empleado
	ADD CONSTRAINT FK_estado_empleado FOREIGN KEY (id_estado) REFERENCES estado(id_estado);
ALTER TABLE  empleado
	ADD CONSTRAINT FK_sucursal_empleado FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
ALTER TABLE  empleado
	ADD CONSTRAINT FK_tipo_empleado FOREIGN KEY (id_tipo) REFERENCES tipo_empleado(id_tipo);

-- TABLA PRODUCTO

ALTER TABLE  producto
	ADD CONSTRAINT FK_producto_categoria FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria);

-- TABLA PRODUCTO_SUCURSAL
ALTER TABLE  producto_sucursal
	ADD CONSTRAINT FK_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto);

ALTER TABLE  producto_sucursal
	ADD CONSTRAINT FK_producto_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);

--TABLA VENTA
ALTER TABLE  venta
	ADD CONSTRAINT FK_venta_empleado FOREIGN KEY (dni_empleado) REFERENCES empleado(dni_empleado);
ALTER TABLE  venta
	ADD CONSTRAINT FK_venta_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal);
ALTER TABLE  venta
	ADD CONSTRAINT FK_venta_cliente FOREIGN KEY (dni_cliente) REFERENCES cliente(dni_cliente);


-- TABLA DETALLE_VENTA

ALTER TABLE  detalle_venta
	ADD CONSTRAINT FK_venta_detalle FOREIGN KEY (nro_venta) REFERENCES venta(nro_venta);
ALTER TABLE  detalle_venta
	ADD CONSTRAINT FK_producto_detalle FOREIGN KEY (id_producto) REFERENCES producto(id_producto);
	