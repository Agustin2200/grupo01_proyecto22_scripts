use proyecto2022
select * FROM empleado
go
-- Backup Completo 
go
Backup database proyecto2022
to disk = 'C:\backupSQL\proyecto2022.bak'
with name='BackupCompleto', init



-- Insertar datos
insert into empleado(dni_empleado,apellido,nombre,domicilio,email,año_ingreso,id_estado,id_sucursal,id_tipo) values (30000001,'Aguirre','Nahuel','Barrio laguna seca', 'aggna@gmail.com','20180916',1,2,2);

select * FROM empleado



--Backup del Log
Backup log proyecto2022
to disk = 'C:\backupSQL\proyecto2022.bak'
with name='BackupLog1'

-- Insertar datos
insert into empleado(dni_empleado,apellido,nombre,domicilio,email,año_ingreso,id_estado,id_sucursal,id_tipo) values (20000001,'Molina','Omar','jujuy 451', 'omar@gmail.com','20180916',1,1,2);
insert into empleado(dni_empleado,apellido,nombre,domicilio,email,año_ingreso,id_estado,id_sucursal,id_tipo) values (50000001,'Aguirre','Jose','tacuari 1299', 'jose@gmail.com','20180916',1,2,2);

select * FROM empleado

--Backup del Log
Backup log proyecto2022
to disk = 'C:\backupSQL\proyecto2022.bak'
with name='BackupLog2'

-- Información de los Backups dentro del archivo .bak
Restore headeronly
from disk='C:\backupSQL\proyecto2022.bak'
use master 
----- Borramos la base de datos para propbar la restauracion 
drop database proyecto2022

------Restore de backup completo y de los del log
Restore database proyecto2022 from disk = 'C:\backupSQL\proyecto2022.bak'
with file=1, norecovery

Restore log proyecto2022 from disk = 'C:\backupSQL\proyecto2022.bak'
with file=2, norecovery

Restore log proyecto2022 from disk = 'C:\backupSQL\proyecto2022.bak'
with file=3, recovery

use proyecto2022
select * FROM empleado




