/*--TRANSACCIONES--
-- begin tran: Se utiliza para utilizar una o varias instrucciones
-- commit: Se utiliza para terminar una transaccion
-- rollback: Se utiliza para regresar a un estado anterior */

 /*- bloque try Manejo de errores --*/


 /*Transaccion Aceptada cambio de precio al producto */
begin tran
update producto set precio = 500 where id_producto = 1

rollback /*Volvemos al precio anterior del procuto*/


--Ejemplo de error, intentamos cargar un producto que ya se encuentra registrado y no nos permite hacer la transaccion. 

declare @Error int

begin tran
update producto set id_producto = 3
where nombre = 'HAMBURGUESA SUPER'

INSERT INTO producto(id_producto,nombre,descripcion,precio,id_estado,id_categoria) 
VALUES (3,'hamb Super','INGREDIENTES:......',500,1,1);


set @Error = @@ERROR
  if  (@Error <>0)
    begin
        rollback tran
        print 'Error en la transacción: Producto ya existente '
    end
    else
    commit

select * from producto