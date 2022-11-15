---use proyecto2022

CREATE FUNCTION empleadosPorSucursal( @idSucursal int )
RETURNS TABLE
AS
RETURN
(
SELECT s.id_sucursal, em.nombre, em.apellido FROM sucursal s
INNER JOIN empleado em ON s.id_sucursal = em.id_sucursal ---Los joins permite mostrar lo que nosotros le especificamos para que visualmente sea mas sencillo para el usuario 
WHERE em.id_sucursal = @idSucursal /* nro de sucursal. */ 

) 

SELECT * FROM empleadosPorSucursal(2);

