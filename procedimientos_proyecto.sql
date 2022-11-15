--USE proyecto2022


---------------CREACION DE PROCEDIMIENTO PARA INSERTAR ELEMANTO A UNA TABLA -----------
create proc insertar_sucursal
@idSucursal as int,
@telefono as bigint,
@direccion as varchar(150),
@nombre as varchar(100)
as

insert into sucursal (id_sucursal, telefono,direccion, nombre)
values (@idSucursal, @telefono, @direccion, @nombre)


select * from sucursal;


create proc insertar_empleado
@dni_empleado as int,
@apellido as varchar(150),
@nombre as varchar(100),
@domicilio as varchar(150),
@email as varchar(100),
@año_ingreso datetime,
@id_estado int, 
@id_sucursal int,
@id_tipo int
as

insert into empleado(dni_empleado,apellido, nombre,domicilio, email, año_ingreso, id_estado, id_sucursal,id_tipo)
values (@dni_empleado,@apellido,@nombre,@domicilio,@email,@año_ingreso,@id_estado,@id_sucursal,@id_tipo)


select * from empleado;
