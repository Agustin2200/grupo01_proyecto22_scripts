---------TRIGGER ACTUALIZACION-------

CREATE TRIGGER tr_empleado on empleado 
for update
as
print 'Se modifico los datos de un empleado correctamente por parte de ' + System_user + ' en el dia y hora: ' + convert(varchar(50),getdate()) ;

select * from empleado
 
update empleado set domicilio = 'Belgrano 2298', nombre = 'Augusto' where dni_empleado = 39459133;

