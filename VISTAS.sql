/*
--VISTA NRO 1:
--RETORNO: Lista de los empleados por sucursal
--OBJETIVO: Mostrar los atributos que se especifica en la vista de la tabla empleado

--*/
CREATE VIEW empleado_sucursal
AS
	SELECT  e.* FROM empleado e
	INNER JOIN sucursal o ON e.id_sucursal = o.id_sucursal

--Lllamamos a la vista , pidiendole algunos de los datos que retorne su tabla					
SELECT id_sucursal, nombre , dni_empleado ,email , año_ingreso FROM empleado_sucursal ORDER BY id_sucursal , nombre ;  


-------------------------------------------------------------------------------------------

--/*
--VISTA NRO 2:
--RETORNO: Lista de las ventas realizadas por los empleados
--OBJETIVO: Mostrar solo algunos atributos de la tabla venta

--*/

CREATE VIEW venta_empleado
AS
	SELECT v.* FROM venta v
		INNER JOIN empleado e ON v.dni_empleado = e.dni_empleado

-- Lllamamos a la vista , pidiendole algunos datos que retorne su tabla
SELECT dni_empleado, nro_venta , fecha_venta FROM venta_empleado group by dni_empleado, nro_venta , fecha_venta  ORDER BY nro_venta asc 
