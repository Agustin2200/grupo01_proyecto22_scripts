---use proyecto2022



insert into estado (id_estado, nombre) 
values (0,'Deshabilitado')
insert into estado (id_estado, nombre) 
values (1,'Habilitado')

insert into tipo_empleado (id_tipo, nombre) 
values (1,'Administrador'), (2,'Vendedor')



insert into empleado(dni_empleado,apellido, nombre,domicilio, email, año_ingreso, id_estado, id_sucursal,id_tipo)
values (42450133,'Acevedo','Agustin','Cazadores Correntinos y Pirovano','agustincasere22@gmail.com','20190125',1,1,1),
(40451143,'Gomez','Jorge','Salta 3456','jorge@gmail.com','20200106',1,1,1),
(39458133,'Rodriguez','Nahuel','Independencia 324','nahuel@gmail.com','20190315',1,2,2),
(38256133,'Caceres','Marcos','Tacuari 1474','marcos@gmail.com','20210125',1,2,2)

insert into cliente(dni_cliente,apellido,nombre,domicilio,email)
values (40212090, 'Caceres','Marcelo','san juan 121','jc@gmail.com'),
(41212090, 'Fernandez','Fernando','Tacuari 121','FF@gmail.com'),
(32212090, 'Brown','Marcos','San luis 7778','mmb@gmail.com'),
(27212090, 'Mendez','Juan','Independencia 321','m.juan@gmail.com')

insert into venta(nro_venta, dni_cliente,dni_empleado,id_sucursal,fecha_venta)
values (1,40212090, 42450133,1,'20190125'),
(2,41212090, 40451143,1,'20190126'),
(3,32212090, 38256133,2,'20190127'),
(4,27212090, 42450133,1,'20190128')

select * from sucursal