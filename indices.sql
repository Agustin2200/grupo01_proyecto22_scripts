/* SQLSERVER accede a los datos de dos maneras:
 * 1. Recorriendo las tablas desde el principio, extrayendo los registros que cumplen con las condiciones de la consulta.
 * 2. Empleando índices, recorriendo una estructura tipo árbol para localizar los registros que cumplen con las condiciones de la consulta.
 *
 * Conceptualmente un índice en una tabla es igual al índice de un libro, es decir permite encontrar datos rápidamente.
 * Una tabla se indexa por uno o varios campos. El objetivo es acelerar la recuperación de la información.
 * SQLSERVER permite crear dos tipos de índices:
 * + Agrupado : Determina la secuencia de almacenamiento de los registros en una tabla. Similar a una guía telefónica..
 * Los registros con el mismo valor de campo se agrupan juntos. Una tabla sólo puede tener un índice agrupado.
 * + No agrupado : es cómo el índice de un libro, los datos se almacenan en un lugar diferente al del índice, los punteros
 * indican el lugar de almacenamiento de los elementeos indizados en la tabla. 
 *
 * La diferencia básica entre índices agrupados y no agrupados es que los registros de un índice agrupado están ordenados y 
 * almacenados de forma secuencial en función de su clave.
 */

-- Para ver las constraints en una tabla se usa el sp -> sp_helpconstraint
-- Para ver los índices en una tabla  -> exec sp_helpindex libros;
exec sp_helpconstraint venta;
exec sp_helpindex venta;

create nonclustered index idx_venta_dni_empleado on venta (dni_empleado);
create nonclustered index idx_venta_dni_cliente on venta (dni_cliente);
create nonclustered index idx_venta_id_sucursal on venta (id_sucursal);

exec sp_helpconstraint producto;
exec sp_helpindex producto;

create nonclustered index idx_producto_estado on producto (id_estado);
create nonclustered index idx_producto_categoria on producto (id_categoria);