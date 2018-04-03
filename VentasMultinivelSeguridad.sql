--SE CREAN LOS TABLESPACE MULTINIVEL_USER, DEFAULT_USER, TEMP_MULTINIVEL_USER;

--SE CREA EL USUARIO MULINIVEL Y SE LE ASIGNAN LOS ROLES Y PRIVILEGIOS:

--SE INGRESA DESDE EL USUARIO MULTINIVEL Y SE SUBE EL SCRIPT DE CREACION DE LA BASE 

--SE CREAN LOS ROLES, LAS VISTAS Y LOS SINONIMOS PARA QUE EL RESTO DE USUARIOS PUEDAN ACCEDER A CIERTAS FUNCIONALIDADES EN EL ESQUEMA

---------------------------CREACION TABLESPACE---------------------
CONN system/oracle

CREATE TABLESPACE MULTINIVEL_USER
DATAFILE '/home/sebastianbd/Desktop/VentasMultinivel/Datos/MULTINIVEL_USER.DBF'
SIZE 500M AUTOEXTEND ON;

CREATE TEMPORARY TABLESPACE TEMP_MULTINIVEL_USER
TEMPFILE '/home/sebastianbd/Desktop/VentasMultinivel/Datos/MULTINIVEL_USER.DBF'
SIZE 50M AUTOEXTEND ON;

CREATE TABLESPACE DEFAULT_USER
DATAFILE '/home/sebastianbd/Desktop/VentasMultinivel/Datos/DEFAULT_USER.DBF'
SIZE 100M AUTOEXTEND ON;


------------------CREACION USER MULTINIVEL Y PRIVS-------------------

CREATE USER MULTINIVEL IDENTIFIED BY MULTINIVEL
DEFAULT TABLESPACE MULTINIVEL_USER
TEMPORARY TABLESPACE TEMP_MULTINIVEL_USER
QUOTA 50M ON MULTINIVEL_USER;


GRANT CREATE ANY VIEW TO MULTINIVEL;
GRANT CREATE ROLE TO MULTINIVEL;
GRANT CREATE USER TO MULTINIVEL;
GRANT ALTER ANY ROLE TO MULTINIVEL;
GRANT DROP ANY ROLE TO MULTINIVEL;
GRANT DROP USER TO MULTINIVEL;
GRANT GRANT ANY ROLE TO MULTINIVEL;
GRANT DBA TO MULTINIVEL;
-----------------------EJECUCION DE SCRIPTS-----------------------

CONN MULTINIVEL/MULTINIVEL

START'/home/sebastianbd/Desktop/VentasMultinivel/Datos/VentasMultinivelCreacion.sql'

start '/home/sebastianbd/Desktop/VentasMultinivel/Datos/VentasMultinivelLLenado.sql' 

-----------------------------VISTAS---------------------------------

CREATE VIEW V_REGION AS SELECT N_NOMBRE FROM MULTINIVEL.REGION;
CREATE PUBLIC SYNONYM V_REGION FOR MULTINIVEL.V_REGION;
CREATE VIEW V_CATEGORIA AS SELECT N_NOMBRE FROM MULTINIVEL.CATEGORIA;
CREATE PUBLIC SYNONYM V_CATEGORIA FOR MULTINIVEL.V_CATEGORIA;


-----------------------------ROLES-----------------------------------

CREATE ROLE R_CLIENTE;

GRANT SELECT ON MULTINIVEL.PRODUCTO TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.PRECIO TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.PRODUCTO_REGION TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.SUBCATEGORIA TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.CLIENTE TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.REP_VENTAS TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.CATEGORIA TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.REGION TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.V_REGION TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.V_CATEGORIA TO R_CLIENTE;
GRANT SELECT ON MULTINIVEL.VENTA TO R_CLIENTE;
GRANT INSERT ON MULTINIVEL.VENTA TO R_CLIENTE;
GRANT INSERT ON MULTINIVEL.PRODUCTO_VENTA TO R_CLIENTE;
GRANT INSERT ON MULTINIVEL.VENTA_REPVENTA TO R_CLIENTE;
GRANT UPDATE ON MULTINIVEL.PRODUCTO_REGION TO R_CLIENTE;
GRANT ALL PRIVILEGES ON MULTINIVEL.SEQ_VENTA TO R_CLIENTE;

CREATE ROLE R_REPVENTAS;

GRANT SELECT ON MULTINIVEL.REP_VENTAS TO R_REPVENTAS;
GRANT SELECT ON MULTINIVEL.CLASIFICACION TO R_REPVENTAS;
GRANT INSERT ON MULTINIVEL.CLIENTE TO R_REPVENTAS;
GRANT CREATE USER TO R_REPVENTAS;
GRANT GRANT ANY ROLE TO R_REPVENTAS;
GRANT GRANT ANY PRIVILEGE TO R_REPVENTAS;


CREATE ROLE R_DIRECTOR;

GRANT SELECT ON MULTINIVEL.REP_VENTAS TO R_DIRECTOR;
GRANT SELECT ON MULTINIVEL.CLASIFICACION TO R_DIRECTOR;
GRANT INSERT ON MULTINIVEL.PRODUCTO TO R_DIRECTOR;
GRANT UPDATE ON MULTINIVEL.CLASIFICACION TO R_DIRECTOR;


----------------------USUARIOS---------------------------
CREATE USER MARIA IDENTIFIED BY maria
DEFAULT TABLESPACE DEFAULT_USER
QUOTA 1M ON DEFAULT_USER;

CREATE USER SEBASTIAN IDENTIFIED BY sebastian
DEFAULT TABLESPACE DEFAULT_USER
QUOTA 1M ON DEFAULT_USER;

CREATE USER DUVAN IDENTIFIED BY duvan 
DEFAULT TABLESPACE DEFAULT_USER
QUOTA 1M ON DEFAULT_USER;

CREATE USER ALEXIS IDENTIFIED BY alexis
DEFAULT TABLESPACE DEFAULT_USER
QUOTA 1M ON DEFAULT_USER;

CREATE USER JUAN IDENTIFIED BY juan
DEFAULT TABLESPACE DEFAULT_USER
QUOTA 1M ON DEFAULT_USER;

GRANT R_CLIENTE , CONNECT TO JUAN;
GRANT R_REPVENTAS , CONNECT TO DUVAN;
GRANT R_REPVENTAS , CONNECT TO ALEXIS;
GRANT R_REPVENTAS , CONNECT TO SEBASTIAN;
GRANT R_REPVENTAS, R_DIRECTOR , CONNECT TO MARIA;


--------------------  VER CLIENTES ----------------------
select * from cliente;
column K_CODCLIENT format a10;        
column N_nombre format a10;   
column N_apellido format a10;
column I_direccion format a10;
column I_ciudad format a10;
column I_telefono format a10;
column k_repventas format a12;
column I_correo format a10;
/



