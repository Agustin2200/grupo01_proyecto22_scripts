
-----------------TRIGGERS DE INSERCION---------------------------


----Creamos un trigger en el cual verifique si el precio es menor a 0 que indique que es un precio invalido,
--caso contrario que permita ingresar el producto

CREATE TRIGGER tr_insercion_producto on producto For Insert
AS
if(SELECT precio FROM inserted) < 0 -- La tabla inserted es una tabla temporal 
Begin
		print 'PRECIO INVALIDO'
		RollBack --Anula el insert
End
else
print 'Se inserto el producto correctamente por parte de ' + System_user + ' en el dia y hora: ' + convert(varchar(50),getdate()) ;




		select * from categoria 
---PROBAMOS INSERTANDO UN NUEVO REGISTRO EN LA TABLA PRODUCTO CON PRECIO NEGATIVO		
INSERT INTO producto (id_producto, nombre, descripcion, precio, id_estado, id_categoria) VALUES (4, 'PIZZA ESPECIAL','INGREDIENTES: ......',490,1,2)