create trigger tr_delete_empleado
on empleado
for delete 
as
print 'El usuario '+system_user+' elimino un empleado, en la fecha: '+(convert (varchar (20),getdate()));

delete from empleado where dni_empleado = 42450133

select * from empleado