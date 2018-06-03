/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 12.1 		*/
/*  Created On : 19-May-2018 06:20:09 a.m. 				*/
/*  DBMS       : Oracle 						*/
/* ---------------------------------------------------- */

/* Drop Tables */

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "CATEGORIA" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "CLASIFICACION" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  	
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "CLIENTE" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "IVA" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "PAGO" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "PAIS" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "PRECIO" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "PRODUCTO" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "PRODUCTO_REGION" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "PRODUCTO_VENTA" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "PSE" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "REGION" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "REGION_REPRESENTANTE" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "REP_VENTAS" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "REPRESENTANTE_CLIENTE" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "TARJETA" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "VENTA" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "VENTA_REPVENTA" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/



/* Create Tables */

CREATE TABLE "REGION_REPRESENTANTE"
(
	"K_REGION_REP" NUMBER(11) NOT NULL,    -- Llave subrogada para identificar la tabla de rompimiento entre representante y region
	"K_REPVENTA" NUMBER(11) NOT NULL,    -- LLAVE FORÁNEA DEL REPRESENTANTE DE VENTAS
	"K_CODREGION" NUMBER(4) NOT NULL,    -- CÓDIGO DE LA REGIÓN
	"F_FECHA_INICO" DATE NOT NULL,	     -- FECHA EN LA QUE SE INSCRIBIÓ A ESA REGIONAL EL REPRESENTANTE
	"F_FECHA_FIN" DATE NULL	     -- FECHA EN LA QUE SALIO DE ESA REGIONAL
);

CREATE TABLE  "CATEGORIA"
(
	"K_CODCATEGORIA" NUMBER(5) NOT NULL,    -- CÓDIGO CATEGORÍA
	"N_NOMBRE" VARCHAR2(50 CHAR) NOT NULL,    -- NOMBRE DE LA CATEGORÍA
	"O_DESCRIPCION" VARCHAR2(150 CHAR) NOT NULL,    -- DESCRIPCIÓN DE LA CATEGORÍA
	"K_SUPERCATEGORIA" NUMBER(5) NULL -- CÓDIGO DE LA CATEGORIA A LA QUE PERTENECE
)
;

CREATE TABLE  "CLASIFICACION"
(
	"K_CODCLASI" NUMBER(3) NOT NULL,    -- CÓDIGO DE CLASIFICACIÓN DE LOS REPRESENTANTES DE VENTAS
	"N_NOMBRE" VARCHAR2(15 CHAR) NOT NULL,    -- NOMBRE DE LA CLASIFICACIÓN DE LOS REPRESENTANTES DE VENTAS (INACTIVO, BEGINNER, JUNIOR, SENIOR, MASTER, DIRECTOR)
	"V_PORCOMISION" NUMBER(3,2) NOT NULL    -- PORCENTAJE DE COMISIÓN QUE LE CORRESPONDE AL REPRESENTANTE DE VENTAS SEGÚN SU CLASIFICACIÓN
)
;

CREATE TABLE  "CLIENTE"
(
	"K_CODCLIENTE" NUMBER(11) NOT NULL,    -- CÓDIGO DEL CLIENTE QUE ES LA MISMA CÉDULA DEL CLIENTE
	"N_NOMBRE" VARCHAR2(50 CHAR) NOT NULL,    -- NOMBRE DEL CLIENTE
	"N_APELLIDO" VARCHAR2(50 CHAR) NOT NULL,    -- APELLIDO DEL CLIENTE
	"I_DIRECCION" VARCHAR2(75 CHAR) NOT NULL,    -- DIRECCIÓN DEL CLIENTE
	"I_CIUDAD" VARCHAR2(50 CHAR) NOT NULL,    -- CIUDAD DEL CLIENTE
	"I_TELEFONO" NUMBER(10) NOT NULL,    -- TELÉFONO DE CONTACTO DEL CLIENTE
	"I_CORREO" VARCHAR2(100 CHAR) NOT NULL    -- CORREO ELECTRÓNICO DEL CLIENTE
)
;

CREATE TABLE  "PAIS"
(
	"K_CODPAIS" NUMBER(3) NOT NULL,    -- CÓDIGO DEL PAÍS
	"N_NOMBRE" VARCHAR2(50 CHAR) NOT NULL    -- NOMBRE DEL PAÍS
)
;

CREATE TABLE  "PRECIO"
(
	"K_PRODUCTO" VARCHAR2(10 CHAR) NOT NULL,    -- LLAVE FORÁNEA QUE IDENTIFICA EL PRODUCTO
	"F_FECHA" DATE NOT NULL,    -- FECHA EN LA QUE EL PRODUCTO CAMBIO DE PRECIO
	"V_PRECIO" NUMBER(15,3) NOT NULL    -- PRECIO DEL PRODUCTO
)
;

CREATE TABLE  "PRODUCTO"
(
	"K_CODPRODUCTO" VARCHAR2(10 CHAR) NOT NULL,    -- CÓDIGO DEL PRODUCTO
	"N_NOMBRE" VARCHAR2(50 CHAR) NOT NULL,    -- NOMBRE DEL PRODUCTO
	"O_DESCRIPCION" VARCHAR2(150 CHAR) NOT NULL,    -- DESCRIPCIÓN DEL PRODUCTO
	"K_CATEGORIA" NUMBER(5) NOT NULL    -- LLAVE FORÁNEA DE LA CATEGORÍA
)
;

CREATE TABLE  "PRODUCTO_REGION"
(
	"K_PRODUCTO" VARCHAR2(10 CHAR) NOT NULL,    -- LLAVE FORÁNEA DEL PRODUCTO
	"K_REGION" NUMBER(4) NOT NULL,    -- LLAVE FORÁNEA DE LA REGION
	"Q_STOCK" NUMBER(7) NOT NULL    -- CANTIDAD DEL PRODUCTO EN EL INVENTARIO
)
;

CREATE TABLE  "PRODUCTO_VENTA"
(
	"K_PRODUCTO" VARCHAR2(10 CHAR) NOT NULL,    -- LLAVE FORÁNEA DEL PRODUCTO
	"K_VENTA" NUMBER(15) NOT NULL,    -- LLAVE FORÁNEA DE LA VENTA
	"Q_CANTIDAD" NUMBER(7) NOT NULL    -- CANTIDAD POR PRODUCTO QUE LLEVARÁ EL CLIENTE
)
;

CREATE TABLE  "REGION"
(
	"K_CODREGION" NUMBER(4) NOT NULL,    -- CÓDIGO DE LA REGIÓN
	"N_NOMBRE" VARCHAR2(50 CHAR) NOT NULL,    -- NOMBRE DE LA REGIÓN
	"K_PAIS" NUMBER(3) NOT NULL    -- LLAVE FORÁNEA DEL PAÍS
)
;

CREATE TABLE  "REP_VENTAS"
(
	"K_CODREPVENTAS" NUMBER(11) NOT NULL,    -- CÓDIGO REPRESENTANTE DE VENTAS, QUE ES LA MISMA CÉDULA DEL REPRESENTANTE DE VENTAS
	"N_NOMBRE" VARCHAR2(50 CHAR) NOT NULL,    -- NOMBRE REPRESENTANTE DE VENTAS
	"N_APELLIDO" VARCHAR2(50 CHAR) NOT NULL,    -- APELLIDO DEL REPRESENTANTE DE VENTAS
	"I_CORREO" VARCHAR2(100 CHAR) NOT NULL,    -- CORREO ELECTRÓNICO DEL REPRESENTANTE DE VENTAS
	"I_GENERO" VARCHAR2(50 CHAR) NOT NULL,    -- GÉNERO DEL REPRESENTANTE DE VENTAS (F=FEMENINO, M=MASCULINO )
	"F_FECHANAC" DATE NOT NULL,    -- FECHA DE NACIMIENTO DEL REPRESENTANTE DE VENTAS
	"F_FECHACON" DATE NOT NULL,    -- FECHA DEL CONTRATO DEL REPRESENTANTE DE VENTAS
	"I_TELEFONO" NUMBER(10) NOT NULL,    -- TELÉFONO DE CONTACTO DEL REPRESENTANTE DE VENTAS
	"I_DIRECCION" VARCHAR2(75 CHAR) NOT NULL,    -- DIRECCIÓN DE RESIDENCIA DEL REPRESENTANTE DE VENTAS
	"K_REGION" NUMBER(4) NOT NULL,    -- REGIONAL A LA CUAL ESTÁ INSCRITO EL REPRESENTANTE DE VENTAS
	"K_CODREPREGIS" NUMBER(11) NULL,    -- CÓDIGO DEL REPRESENTANTE DE VENTAS QUE LO INTRODUJO
	"K_CLASIFICACION" NUMBER(3) NOT NULL    -- LLAVE FORÁNEA DE CLASIFICACIÓN DE REPRESENTANTE DE VENTAS
)
;

CREATE TABLE  "REPRESENTANTE_CLIENTE"
(
	"K_CODREPVENTAS" NUMBER(11) NULL,	-- LLAVE FORÁNEA DEL REPRESENTANTE DE VENTAS
	"K_CODCLIENTE" NUMBER(11) NULL,		-- LLAVE FORÁNEA DEL CLIENTE
	"F_FECHA_INICO" DATE NOT NULL,		-- FECHA EN LA QUE INICIA EL REPRESENTANTE DE VENTAS A ATENDER AL CLIENTE
	"F_FECHA_FIN" DATE NULL,		-- FECHA EN LA QUE FINALIZA EL REPRESENTANTE DE VENTAS A ATENDER AL CLIENTE
	"K_ID_REP_CLIENTE" NUMBER(11) NOT NULL    -- LLAVE SUBROGADA PARA IDENTIFICAR LA TABLA DE ROMPIMIENTO ENTRE REPRESENTANTE Y CLIENTE
);

CREATE TABLE  "VENTA"
(
	"K_CODVENTA" NUMBER(15) NOT NULL,    -- CÓDIGO DE LA VENTA
	"F_FECHA" DATE NOT NULL,    -- FECHA EN LA QUE SE HIZO LA VENTA
	"V_PRECIOFINAL" NUMBER(15,2) NOT NULL,    -- PRECIO FINAL DE LA VENTA
	"I_ESTADO" CHAR(15 CHAR) NOT NULL,    -- ESTADO DE LA VENTA (ACTIVO,CANCELADO,TERMINADO)
	"K_FORMA_PAGO" VARCHAR2(7) NOT NULL,	--CÓDIGO DE LA FORMA DE PAGO
	"V_CALIFICACION" NUMBER(2,1) NULL,	--CALIFICACIÓN DEL CLIENTE AL REPRESENTANTE POR LA VENTA
	"V_COMISION" NUMBER(15,2) NOT NULL,	--COMISIÓN POR LA VENTA PARA EL REPRESENTANTE DE VENTAS
	"K_ID_REP_CLIENTE" NUMBER(11) NOT NULL,	  --IDENTIFICADOR DEL CLIENTE
	"K_IVA" NVARCHAR2(10) NOT NULL    	-- INDICADOR DE LA TABLA IMPUESTO QUE CONTIENE EL VALOR DEL IVA PARA LA VENTA
)
;

CREATE TABLE  "VENTA_REPVENTA"
(
	"K_REPVENTA" NUMBER(11) NOT NULL,    -- LLAVE FORÁNEA DEL REPRESENTANTE DE VENTAS
	"K_VENTA" NUMBER(15) NOT NULL,    -- LLAVE FORÁNEA DE LA VENTA
	"V_CALIFICACION" NUMBER(2,1) NULL,    -- CALIFICACIÓN QUE DA EL CLIENTE AL REPRESENTANTE DE VENTAS, DONDE CERO ES  PÉSIMO Y CINCO  ES EXCELENTE
	"V_COMISION" NUMBER(15,2) NOT NULL    -- VALOR QUE GANA EL REPRESENTANTE DE VENTAS POR LA VENTA
)
;

CREATE TABLE  "IVA"
(
	"K_IMPUESTO" NVARCHAR2(10) NOT NULL,    -- Identificador de la tabla impusto
	"F_FECHA" DATE NOT NULL,    -- Fecha en la que se cambió el valor del impuesto
	"V_IVA" NUMBER(3,2) NOT NULL    -- Valores que ha tenido el IVA y el actual también
)
;

CREATE TABLE  "PAGO"
(
	"K_PAGO" VARCHAR2(7) NOT NULL,    -- Identificador del modo pago
	"F_FECHAPAGO" DATE NOT NULL,    -- Fecha en la que se pago la venta
	"K_PSE" NUMBER(13),    -- Código de el pago por PSE
	"K_TARJETA" NUMBER(12)    -- Número de la tarjeta
)
;

CREATE TABLE  "PSE"
(
	"K_PSE" NUMBER(13) NOT NULL    -- Identificador del pago por PSE
)
;

CREATE TABLE  "TARJETA"
(
	"K_TARJETA" NUMBER(12) NOT NULL,    -- Identificador de la tarjeta, el cual es el número de la tarjeta
	"I_CODIGO" NUMBER(3) NOT NULL    -- Código de verificación del a tarjeta
)
;

/* Create Comments, Sequences and Triggers for Autonumber Columns */

COMMENT ON TABLE  "CATEGORIA" IS 'TABLA DE LAS CATEGORÍAS DE LOS PRODUCTOS'
;

COMMENT ON COLUMN  "CATEGORIA"."K_CODCATEGORIA" IS 'CÓDIGO DE LA CATEGORÍA DE LOS PRODUCTOS'
;

COMMENT ON COLUMN  "CATEGORIA"."N_NOMBRE" IS 'NOMBRE DE LA CATEGORÍA'
;

COMMENT ON COLUMN  "CATEGORIA"."O_DESCRIPCION" IS 'DESCRIPCIÓN DE LA CATEGORÍA'
;

COMMENT ON TABLE  "CATEGORIA" IS 'TABLA DE CATEGORÍAS DE LOS PRODUCTOS'
;

COMMENT ON COLUMN  "CATEGORIA"."K_CODCATEGORIA" IS 'CÓDIGO SUBCATEGORÍA'
;

COMMENT ON COLUMN  "CATEGORIA"."N_NOMBRE" IS 'NOMBRE DE LA SUBCATEGORÍA'
;

COMMENT ON COLUMN  "CATEGORIA"."O_DESCRIPCION" IS 'DESCRIPCIÓN DE LA SUBCATEGORÍA'
;

COMMENT ON TABLE  "CLASIFICACION" IS 'TABLA DE CLASIFICACIÓN DE LOS REPRESENTANTES DE VENTAS'
;

COMMENT ON COLUMN  "CLASIFICACION"."K_CODCLASI" IS 'CÓDIGO DE CLASIFICACIÓN DE LOS REPRESENTANTES DE VENTAS'
;

COMMENT ON COLUMN  "CLASIFICACION"."N_NOMBRE" IS 'NOMBRE DE LA CLASIFICACIÓN DE LOS REPRESENTANTES DE VENTAS (INACTIVO, BEGINNER, JUNIOR, SENIOR, MASTER, DIRECTOR)'
;

COMMENT ON COLUMN  "CLASIFICACION"."V_PORCOMISION" IS 'PORCENTAJE DE COMISIÓN QUE LE CORRESPONDE AL REPRESENTANTE DE VENTAS SEGÚN SU CLASIFICACIÓN'
;

COMMENT ON TABLE  "CLIENTE" IS 'TABLA DONDE SE ALMACENAN LOS CLIENTES'
;

COMMENT ON COLUMN  "CLIENTE"."K_CODCLIENTE" IS 'CÓDIGO DEL CLIENTE QUE ES LA MISMA CÉDULA DEL CLIENTE'
;

COMMENT ON COLUMN  "CLIENTE"."N_NOMBRE" IS 'NOMBRE DEL CLIENTE'
;

COMMENT ON COLUMN  "CLIENTE"."N_APELLIDO" IS 'APELLIDO DEL CLIENTE'
;

COMMENT ON COLUMN  "CLIENTE"."I_DIRECCION" IS 'DIRECCIÓN DEL CLIENTE'
;

COMMENT ON COLUMN  "CLIENTE"."I_CIUDAD" IS 'CIUDAD DEL CLIENTE'
;

COMMENT ON COLUMN  "CLIENTE"."I_TELEFONO" IS 'TELÉFONO DE CONTACTO DEL CLIENTE'
;

COMMENT ON COLUMN  "CLIENTE"."I_CORREO" IS 'CORREO ELECTRÓNICO DEL CLIENTE'
;

COMMENT ON TABLE  "IVA" IS 'Tabla de histórico del IVA como el actual'
;

COMMENT ON COLUMN  "IVA"."K_IMPUESTO" IS 'Identificador de la tabla impusto'
;

COMMENT ON COLUMN  "IVA"."F_FECHA" IS 'Fecha en la que se cambió el valor del impuesto'
;

COMMENT ON COLUMN  "IVA"."V_IVA" IS 'Valores que ha tenido el IVA y el actual también'
;

COMMENT ON TABLE  "PAGO" IS 'Tabla donde estan los diferentes modos de pago que recibe la aplicación'
;

COMMENT ON COLUMN  "PAGO"."K_PAGO" IS 'Identificador del modo pago'
;

COMMENT ON COLUMN  "PAGO"."F_FECHAPAGO" IS 'Fecha en la que se pago la venta'
;

COMMENT ON COLUMN  "PAGO"."K_PSE" IS 'Código de el pago por PSE'
;

COMMENT ON COLUMN  "PAGO"."K_TARJETA" IS 'Número de la tarjeta'
;
COMMENT ON TABLE  "PAIS" IS 'TABLA DONDE SE ALMACENAN LOS PAÍSES'
;

COMMENT ON COLUMN  "PAIS"."K_CODPAIS" IS 'CÓDIGO DEL PAÍS'
;

COMMENT ON COLUMN  "PAIS"."N_NOMBRE" IS 'NOMBRE DEL PAÍS'
;

COMMENT ON TABLE  "PRECIO" IS 'TABLA DE PRECIOS DE LOS PRODCUTOS Y SU HISTORIAL DE PRECIOS'
;

COMMENT ON COLUMN  "PRECIO"."K_PRODUCTO" IS 'LLAVE FORÁNEA QUE IDENTIFICA EL PRODUCTO'
;

COMMENT ON COLUMN  "PRECIO"."F_FECHA" IS 'FECHA EN LA QUE EL PRODUCTO CAMBIO DE PRECIO'
;

COMMENT ON COLUMN  "PRECIO"."V_PRECIO" IS 'PRECIO DEL PRODUCTO'
;

COMMENT ON TABLE  "PRODUCTO" IS 'TABLA DE PRODUCTOS CON SU INFORMACIÓN'
;

COMMENT ON COLUMN  "PRODUCTO"."K_CODPRODUCTO" IS 'CÓDIGO DEL PRODUCTO'
;

COMMENT ON COLUMN  "PRODUCTO"."N_NOMBRE" IS 'NOMBRE DEL PRODUCTO'
;

COMMENT ON COLUMN  "PRODUCTO"."O_DESCRIPCION" IS 'DESCRIPCIÓN DEL PRODUCTO'
;

COMMENT ON COLUMN  "PRODUCTO"."K_CATEGORIA" IS 'LLAVE FORÁNEA DE LA CATEGORÍA'
;

COMMENT ON TABLE  "PRODUCTO_REGION" IS 'TABLA DE ROMPIMIENTO PARA MANTENER LA RELACIÓN DE UN PRODUCTO EN LAS DIFERENTES REGIONES'
;

COMMENT ON COLUMN  "PRODUCTO_REGION"."K_PRODUCTO" IS 'LLAVE FORÁNEA DEL PRODUCTO'
;

COMMENT ON COLUMN  "PRODUCTO_REGION"."K_REGION" IS 'LLAVE FORÁNEA DE LA REGION'
;

COMMENT ON COLUMN  "PRODUCTO_REGION"."Q_STOCK" IS 'CANTIDAD DEL PRODUCTO EN EL INVENTARIO'
;

COMMENT ON TABLE  "PRODUCTO_VENTA" IS 'TABLA DE DETALLE DE LA VENTA'
;

COMMENT ON COLUMN  "PRODUCTO_VENTA"."K_PRODUCTO" IS 'LLAVE FORÁNEA DEL PRODUCTO'
;

COMMENT ON COLUMN  "PRODUCTO_VENTA"."K_VENTA" IS 'LLAVE FORÁNEA DE LA VENTA'
;

COMMENT ON COLUMN  "PRODUCTO_VENTA"."Q_CANTIDAD" IS 'CANTIDAD POR PRODUCTO QUE LLEVARÁ EL CLIENTE'
;

COMMENT ON TABLE  "PSE" IS 'Datos del pago por PSE'
;

COMMENT ON COLUMN  "PSE"."K_PSE" IS 'Identificador del pago por PSE'
;

COMMENT ON TABLE  "REGION" IS 'TABLA DONDE SE ALMACENAN LAS REGIONES'
;

COMMENT ON COLUMN  "REGION"."K_CODREGION" IS 'CÓDIGO DE LA REGIÓN'
;

COMMENT ON COLUMN  "REGION"."N_NOMBRE" IS 'NOMBRE DE LA REGIÓN'
;

COMMENT ON COLUMN  "REGION"."K_PAIS" IS 'LLAVE FORÁNEA DEL PAÍS'
;

COMMENT ON TABLE  "REP_VENTAS" IS 'TABLA DE REPRESENTANTES DE VENTAS'
;

COMMENT ON COLUMN  "REP_VENTAS"."K_CODREPVENTAS" IS 'CÓDIGO REPRESENTANTE DE VENTAS, QUE ES LA MISMA CÉDULA DEL REPRESENTANTE DE VENTAS'
;

COMMENT ON COLUMN  "REP_VENTAS"."N_NOMBRE" IS 'NOMBRE REPRESENTANTE DE VENTAS'
;

COMMENT ON COLUMN  "REP_VENTAS"."N_APELLIDO" IS 'APELLIDO DEL REPRESENTANTE DE VENTAS'
;

COMMENT ON COLUMN  "REP_VENTAS"."I_CORREO" IS 'CORREO ELECTRÓNICO DEL REPRESENTANTE DE VENTAS'
;

COMMENT ON COLUMN  "REP_VENTAS"."I_GENERO" IS 'GÉNERO DEL REPRESENTANTE DE VENTAS (F=FEMENINO, M=MASCULINO )'
;

COMMENT ON COLUMN  "REP_VENTAS"."F_FECHANAC" IS 'FECHA DE NACIMIENTO DEL REPRESENTANTE DE VENTAS'
;

COMMENT ON COLUMN  "REP_VENTAS"."F_FECHACON" IS 'FECHA DEL CONTRATO DEL REPRESENTANTE DE VENTAS'
;

COMMENT ON COLUMN  "REP_VENTAS"."I_TELEFONO" IS 'TELÉFONO DE CONTACTO DEL REPRESENTANTE DE VENTAS'
;

COMMENT ON COLUMN  "REP_VENTAS"."I_DIRECCION" IS 'DIRECCIÓN DE RESIDENCIA DEL REPRESENTANTE DE VENTAS'
;

COMMENT ON COLUMN  "REP_VENTAS"."K_REGION" IS 'REGIONAL A LA CUAL ESTÁ INSCRITO EL REPRESENTANTE DE VENTAS'
;

COMMENT ON COLUMN  "REP_VENTAS"."K_CODREPREGIS" IS 'CÓDIGO DEL REPRESENTANTE DE VENTAS QUE LO INTRODUJO'
;

COMMENT ON COLUMN  "REP_VENTAS"."K_CLASIFICACION" IS 'LLAVE FORÁNEA DE CLASIFICACIÓN DE REPRESENTANTE DE VENTAS'
;

COMMENT ON COLUMN  "REPRESENTANTE_CLIENTE"."K_ID_REP_CLIENTE" IS 'Llave subrogada para identificar la tabla de rompimiento entre representante y cliente'
;

COMMENT ON TABLE  "TARJETA" IS 'Datos de la tarjeta por si se paga con el modo tarjeta'
;

COMMENT ON COLUMN  "TARJETA"."K_TARJETA" IS 'Identificador de la tarjeta, el cual es el número de la tarjeta'
;

COMMENT ON COLUMN  "TARJETA"."I_CODIGO" IS 'Código de verificación del a tarjeta'
;

COMMENT ON TABLE  "VENTA" IS 'TABLA DE LAS VENTAS'
;

COMMENT ON COLUMN  "VENTA"."K_CODVENTA" IS 'CÓDIGO DE LA VENTA'
;

COMMENT ON COLUMN  "VENTA"."F_FECHA" IS 'FECHA EN LA QUE SE HIZO LA VENTA'
;

COMMENT ON COLUMN  "VENTA"."V_PRECIOFINAL" IS 'PRECIO FINAL DE LA VENTA'
;

COMMENT ON COLUMN  "VENTA"."I_ESTADO" IS 'ESTADO DE LA VENTA (ACTIVO,CANCELADO,TERMINADO)'
;

COMMENT ON TABLE  "VENTA_REPVENTA" IS 'TABLA QUE IDENTIFICA EL REPRESENTANTE DE VENTAS CON LA VENTA'
;

COMMENT ON COLUMN  "VENTA_REPVENTA"."K_REPVENTA" IS 'LLAVE FORÁNEA DEL REPRESENTANTE DE VENTAS'
;

COMMENT ON COLUMN  "VENTA_REPVENTA"."K_VENTA" IS 'LLAVE FORÁNEA DE LA VENTA'
;

COMMENT ON COLUMN  "VENTA_REPVENTA"."V_CALIFICACION" IS 'CALIFICACIÓN QUE DA EL CLIENTE AL REPRESENTANTE DE VENTAS, DONDE CERO ES  PÉSIMO Y CINCO  ES EXCELENTE'
;

COMMENT ON COLUMN  "VENTA_REPVENTA"."V_COMISION" IS 'VALOR QUE GANA EL REPRESENTANTE DE VENTAS POR LA VENTA'
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  "CATEGORIA" 
 ADD CONSTRAINT "PK_CATEGORIA"
	PRIMARY KEY ("K_CODCATEGORIA") 
 USING INDEX
;

CREATE INDEX "IXFK_CATEGORIA_CATEGOR04"   
 ON  "CATEGORIA" ("K_SUPERCATEGORIA") 
;

ALTER TABLE  "CLASIFICACION" 
 ADD CONSTRAINT "PK_CLASIFICACION"
	PRIMARY KEY ("K_CODCLASI") 
 USING INDEX
;

ALTER TABLE  "CLASIFICACION" 
 ADD CONSTRAINT "CK_N_NOMBRE" CHECK (N_NOMBRE IN ('INACTIVO','BEGINNER','JUNIOR','SENIOR','MASTER','DIRECTOR'))
;

ALTER TABLE  "CLASIFICACION" 
 ADD CONSTRAINT "CK_V_PORCOMISION" CHECK (V_PORCOMISION>=0)
;

ALTER TABLE  "CLIENTE" 
 ADD CONSTRAINT "PK_CLIENTE"
	PRIMARY KEY ("K_CODCLIENTE") 
 USING INDEX
;

ALTER TABLE  "CLIENTE" 
 ADD CONSTRAINT "CK_K_CODCLIENTE" CHECK (K_CODCLIENTE>0)
;

ALTER TABLE  "CLIENTE" 
 ADD CONSTRAINT "CK_I_TELEFONO" CHECK (I_TELEFONO>0)
;

ALTER TABLE  "PAIS" 
 ADD CONSTRAINT "PK_PAIS"
	PRIMARY KEY ("K_CODPAIS") 
 USING INDEX
;

ALTER TABLE  "PRECIO" 
 ADD CONSTRAINT "UQ_K_PRODUCTO_F_FECHA" UNIQUE ("K_PRODUCTO","F_FECHA") 
 USING INDEX
;

ALTER TABLE  "PRECIO" 
 ADD CONSTRAINT "CK_V_PRECIO" CHECK (V_PRECIO>=0)
;

CREATE INDEX "IXFK_PRECIO_PRODUCTO"   
 ON  "PRECIO" ("K_PRODUCTO") 
;

ALTER TABLE  "PRODUCTO" 
 ADD CONSTRAINT "PK_PRODUCTO"
	PRIMARY KEY ("K_CODPRODUCTO") 
 USING INDEX
;

CREATE INDEX "IXFK_PRODUCTO_CATEGORIA"   
 ON  "PRODUCTO" ("K_CATEGORIA") 
;

ALTER TABLE  "PRODUCTO_REGION" 
 ADD CONSTRAINT "CK_Q_STOCK" CHECK (Q_STOCK>=0)
;

CREATE INDEX "IXFK_PRODUCTO_REGION_PRODUCTO"   
 ON  "PRODUCTO_REGION" ("K_PRODUCTO") 
;

CREATE INDEX "IXFK_PRODUCTO_REGION_REGION"   
 ON  "PRODUCTO_REGION" ("K_REGION") 
;

ALTER TABLE  "PRODUCTO_VENTA" 
 ADD CONSTRAINT "CK_Q_CANTIDAD" CHECK (Q_CANTIDAD>0)
;

CREATE INDEX "IXFK_PRODUCTO_VENTA_PRODUCTO"   
 ON  "PRODUCTO_VENTA" ("K_PRODUCTO") 
;

CREATE INDEX "IXFK_PRODUCTO_VENTA_VENTA"   
 ON  "PRODUCTO_VENTA" ("K_VENTA") 
;

ALTER TABLE  "REGION" 
 ADD CONSTRAINT "PK_REGION"
	PRIMARY KEY ("K_CODREGION") 
 USING INDEX
;

CREATE INDEX "IXFK_REGION_PAIS"   
 ON  "REGION" ("K_PAIS") 
;

ALTER TABLE  "REP_VENTAS" 
 ADD CONSTRAINT "PK_REP_VENTAS"
	PRIMARY KEY ("K_CODREPVENTAS") 
 USING INDEX
;

ALTER TABLE  "REP_VENTAS" 
 ADD CONSTRAINT "CK_I_GENERO" CHECK (I_GENERO IN ('F','M'))
;

ALTER TABLE  "REP_VENTAS" 
 ADD CONSTRAINT "CK_K_CODREPVENTAS" CHECK (K_CODREPVENTAS>0)
;

ALTER TABLE  "REP_VENTAS" 
 ADD CONSTRAINT "CK_I_TELEFONOREP" CHECK (I_TELEFONO>0)
;

CREATE INDEX "IXFK_REP_VENTAS_CLASIFICACION"   
 ON  "REP_VENTAS" ("K_CLASIFICACION") 
;

CREATE INDEX "IXFK_REP_VENTAS_REGION"   
 ON  "REP_VENTAS" ("K_REGION") 
;

CREATE INDEX "IXFK_REP_VENTAS_REP_VENTAS"   
 ON  "REP_VENTAS" ("K_CODREPREGIS") 
;

ALTER TABLE  "REPRESENTANTE_CLIENTE" 
 ADD CONSTRAINT "PK_REPRESENTANT_01"
	PRIMARY KEY ("K_ID_REP_CLIENTE") 
 USING INDEX
;

ALTER TABLE  "REPRESENTANTE_CLIENTE" 
 ADD CONSTRAINT "CH_FECHA_FIN" CHECK (F_FECHA_INICO < F_FECHA_FIN)
;

ALTER TABLE  "VENTA" 
 ADD CONSTRAINT "PK_VENTA"
	PRIMARY KEY ("K_CODVENTA") 
 USING INDEX
;

ALTER TABLE  "VENTA" 
 ADD CONSTRAINT "CK_I_ESTADO" CHECK (I_ESTADO IN ('ACTIVO','CANCELADO','TERMINADO'))
;

ALTER TABLE  "VENTA" 
 ADD CONSTRAINT "CK_V_PRECIOFINAL" CHECK (V_PRECIOFINAL>=0)
;

ALTER TABLE  "VENTA" 
 ADD CONSTRAINT "CK_O_FORMA_PAGO" CHECK (O_FORMA_PAGO IN ('PSE', 'TARJETA'))
;

ALTER TABLE  "VENTA" 
 ADD CONSTRAINT "CK_CALIFICACION" CHECK (V_CALIFICACION>=0 AND V_CALIFICACION<=5)
;

ALTER TABLE  "VENTA" 
 ADD CONSTRAINT "CK_COMISION" CHECK (V_COMISION>=0)
;

ALTER TABLE  "VENTA_REPVENTA" 
 ADD CONSTRAINT "CK_V_CALIFICACION" CHECK (V_CALIFICACION>=0 AND V_CALIFICACION<=5)
;

ALTER TABLE  "VENTA_REPVENTA" 
 ADD CONSTRAINT "CK_V_COMISION" CHECK (V_COMISION>=0)
;

ALTER TABLE "REGION_REPRESENTANTE"
 ADD CONSTRAINT "PK_REGION_REP"
	PRIMARY KEY ("K_REGION_REP")
USING INDEX
;

ALTER TABLE  "IVA" 
 ADD CONSTRAINT "PK_IVA"
	PRIMARY KEY ("K_IMPUESTO")
;

ALTER TABLE  "IVA" 
 ADD CONSTRAINT "CK_V_IVA" CHECK (V_IVA>=0)
;

ALTER TABLE  "PAGO" 
 ADD CONSTRAINT "PK_MODO_PAGO"
	PRIMARY KEY ("K_PAGO")
;

CREATE INDEX "IXFK_PAGO_PSE"   
 ON  "PAGO" ("K_PSE") 
;

CREATE INDEX "IXFK_PAGO_TARJETA"   
 ON  "PAGO" ("K_TARJETA") 
;

ALTER TABLE  "PSE" 
 ADD CONSTRAINT "PK_PSE"
	PRIMARY KEY ("K_PSE")
;

ALTER TABLE  "TARJETA" 
 ADD CONSTRAINT "PK_TARJETA"
	PRIMARY KEY ("K_TARJETA")
;

/* Create Foreign Key Constraints */

ALTER TABLE  "PRECIO" 
 ADD CONSTRAINT "FK_PRECIO_PRODUCTO"
	FOREIGN KEY ("K_PRODUCTO") REFERENCES  "PRODUCTO" ("K_CODPRODUCTO")
;

ALTER TABLE  "PRODUCTO" 
 ADD CONSTRAINT "FK_PRODUCTO_CATEGORIA"
	FOREIGN KEY ("K_CATEGORIA") REFERENCES  "CATEGORIA" ("K_CODCATEGORIA")
;

ALTER TABLE  "PRODUCTO_REGION" 
 ADD CONSTRAINT "FK_PRODUCTO_REGION_PRODUCTO"
	FOREIGN KEY ("K_PRODUCTO") REFERENCES  "PRODUCTO" ("K_CODPRODUCTO")
;

ALTER TABLE  "PRODUCTO_REGION" 
 ADD CONSTRAINT "FK_PRODUCTO_REGION_REGION"
	FOREIGN KEY ("K_REGION") REFERENCES  "REGION" ("K_CODREGION")
;

ALTER TABLE  "PRODUCTO_VENTA" 
 ADD CONSTRAINT "FK_PRODUCTO_VENTA_PRODUCTO"
	FOREIGN KEY ("K_PRODUCTO") REFERENCES  "PRODUCTO" ("K_CODPRODUCTO")
;

ALTER TABLE  "PRODUCTO_VENTA" 
 ADD CONSTRAINT "FK_PRODUCTO_VENTA_VENTA"
	FOREIGN KEY ("K_VENTA") REFERENCES  "VENTA" ("K_CODVENTA")
;

ALTER TABLE  "REGION" 
 ADD CONSTRAINT "FK_REGION_PAIS"
	FOREIGN KEY ("K_PAIS") REFERENCES  "PAIS" ("K_CODPAIS")
;

ALTER TABLE  "REP_VENTAS" 
 ADD CONSTRAINT "FK_REP_VENTAS_CLASIFICACION"
	FOREIGN KEY ("K_CLASIFICACION") REFERENCES  "CLASIFICACION" ("K_CODCLASI")
;

ALTER TABLE  "REP_VENTAS" 
 ADD CONSTRAINT "FK_REP_VENTAS_REGION"
	FOREIGN KEY ("K_REGION") REFERENCES  "REGION" ("K_CODREGION")
;

ALTER TABLE  "REP_VENTAS" 
 ADD CONSTRAINT "FK_REP_VENTAS_REP_VENTAS"
	FOREIGN KEY ("K_CODREPREGIS") REFERENCES  "REP_VENTAS" ("K_CODREPVENTAS")
;

ALTER TABLE  "REPRESENTANTE_CLIENTE" 
 ADD CONSTRAINT "FK_REPRESENTANTE_CL_CLIENTE_01"
	FOREIGN KEY ("K_CODCLIENTE") REFERENCES  "CLIENTE" ("K_CODCLIENTE")
;

ALTER TABLE  "REPRESENTANTE_CLIENTE" 
 ADD CONSTRAINT "FK_REPRESENTANTE_REP_VENTAS_01"
	FOREIGN KEY ("K_CODREPVENTAS") REFERENCES  "REP_VENTAS" ("K_CODREPVENTAS")
;

ALTER TABLE "VENTA"
ADD CONSTRAINT "FK_ID_REP_CLIENTE"
FOREIGN KEY ("K_ID_REP_CLIENTE") REFERENCES "REPRESENTANTE_CLIENTE" ("K_ID_REP_CLIENTE")
;

ALTER TABLE "REGION_REPRESENTANTE"
 ADD CONSTRAINT "FK_REPVENTA"
	FOREIGN KEY ("K_REPVENTA") REFERENCES "REP_VENTAS" ("K_CODREPVENTAS")
;

ALTER TABLE "REGION_REPRESENTANTE"
 ADD CONSTRAINT "FK_CODREGION"
	FOREIGN KEY ("K_CODREGION") REFERENCES "REGION" ("K_CODREGION")
;

ALTER TABLE  "PAGO" 
 ADD CONSTRAINT "FK_PAGO_PSE"
	FOREIGN KEY ("K_PSE") REFERENCES  "PSE" ("K_PSE")
;

ALTER TABLE  "PAGO" 
 ADD CONSTRAINT "FK_PAGO_TARJETA"
	FOREIGN KEY ("K_TARJETA") REFERENCES  "TARJETA" ("K_TARJETA")
;

ALTER TABLE  "VENTA" 
 ADD CONSTRAINT "FK_VENTA_IVA"
	FOREIGN KEY ("K_IVA") REFERENCES  "IVA" ("K_IMPUESTO")
;

ALTER TABLE  "VENTA" 
 ADD CONSTRAINT "FK_VENTA_PAGO"
	FOREIGN KEY ("K_FORMA_PAGO") REFERENCES  "PAGO" ("K_PAGO")
;


/* creacion secuencias */
CREATE SEQUENCE SEQ_PAIS
INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE SEQ_REGION
INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE SEQ_CATEGORIA
INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE SEQ_SUBCATEGORIA
INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE SEQ_CALIFICACION
INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE SEQ_VENTA
INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE SEQ_REPRESENTANTE_CLIENTE
INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE SEQ_IVA
INCREMENT BY 1
START WITH 1;

/* creacion sinonimos */
CREATE PUBLIC SYNONYM CATEGORIA FOR MULTINIVEL.CATEGORIA;
CREATE PUBLIC SYNONYM CLASIFICACION FOR MULTINIVEL.CLASIFICACION;
CREATE PUBLIC SYNONYM CLIENTE FOR MULTINIVEL.CLIENTE;
CREATE PUBLIC SYNONYM PAIS FOR MULTINIVEL.PAIS;
CREATE PUBLIC SYNONYM PRECIO FOR MULTINIVEL.PRECIO;
CREATE PUBLIC SYNONYM PRODUCTO FOR MULTINIVEL.PRODUCTO;
CREATE PUBLIC SYNONYM PRODUCTO_REGION FOR MULTINIVEL.PRODUCTO_REGION;
CREATE PUBLIC SYNONYM PRODUCTO_VENTA FOR MULTINIVEL.PRODUCTO_VENTA;
CREATE PUBLIC SYNONYM REGION FOR MULTINIVEL.REGION;
CREATE PUBLIC SYNONYM REP_VENTAS FOR MULTINIVEL.REP_VENTAS;
CREATE PUBLIC SYNONYM VENTA FOR MULTINIVEL.VENTA;
CREATE PUBLIC SYNONYM VENTA_REPVENTA FOR MULTINIVEL.VENTA_REPVENTA;
CREATE PUBLIC SYNONYM SEQ_PAIS FOR MULTINIVEL.SEQ_PAIS;
CREATE PUBLIC SYNONYM SEQ_REGION FOR MULTINIVEL.SEQ_REGION;
CREATE PUBLIC SYNONYM SEQ_CATEGORIA FOR MULTINIVEL.SEQ_CATEGORIA;
CREATE PUBLIC SYNONYM SEQ_SUBCATEGORIA FOR MULTINIVEL.SEQ_SUBCATEGORIA;
CREATE PUBLIC SYNONYM SEQ_CALIFICACION FOR MULTINIVEL.SEQ_CALIFICACION;
CREATE PUBLIC SYNONYM SEQ_VENTA FOR MULTINIVEL.SEQ_VENTA;
CREATE PUBLIC SYNONYM SEQ_IVA FOR MULTINIVEL.SEQ_IVA;

