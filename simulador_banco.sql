/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 12.1 		*/
/*  Created On : 03-jun-2018 10:44:04 p.m. 				*/
/*  DBMS       : Oracle 						*/
/* ---------------------------------------------------- */
CONN SYSTEM/1234

CREATE USER BANCO IDENTIFIED BY banco;
GRANT CONNECT, RESOURCE, CREATE PUBLIC SYNONYM TO BANCO;

CONN BANCO/banco

/* Drop Tables */

begin
	EXECUTE IMMEDIATE 'DROP TABLE   "SIMULADOR_BANCO" CASCADE CONSTRAINTS';
	EXCEPTION WHEN OTHERS THEN NULL;
end;  
/

/* Create Tables */

CREATE TABLE  "SIMULADOR_BANCO"
(
	"K_CODTARJETA" NUMBER(12) NOT NULL,    -- C�digo de la cuenta bancaria, su identificador
	"N_BANCO" VARCHAR2(25) NOT NULL,    -- Nombre del banco a la que pertecene la cuenta bancaria
	"N_PROPIETARIO" NUMBER(11) NOT NULL,    -- C�digo del propietario de la cuenta bancaria, siendo este su n�mero de c�dula
	"V_SALDO" NUMBER(11,2) NOT NULL,    -- Cantidad de dinero disponible que tiene el cliente en su cuenta bancaria para gastar.
	"I_CODIGO" NUMBER(3) NOT NULL,    -- C�digo de verificaci�n de la tarjeta
	"I_CLAVE" NUMBER(4) NOT NULL,    -- Clave de la cuenta bancaria
	"I_ESTADO" VARCHAR2(10) NOT NULL,    -- Estado de la cuenta bancaria
	"F_FECHAVEN" DATE NOT NULL    -- Fecha en la que vence la cuenta bancaria
)
;

/* Create Comments, Sequences and Triggers for Autonumber Columns */

COMMENT ON TABLE  "SIMULADOR_BANCO" IS 'Tabla que tiene la funcionalidad de simular la informanci�n bancaria de los clientes inscritos a la empresa.'
;

COMMENT ON COLUMN  "SIMULADOR_BANCO"."K_CODTARJETA" IS 'C�digo de la cuenta bancaria, su identificador'
;

COMMENT ON COLUMN  "SIMULADOR_BANCO"."N_BANCO" IS 'Nombre del banco a la que pertecene la cuenta bancaria'
;

COMMENT ON COLUMN  "SIMULADOR_BANCO"."N_PROPIETARIO" IS 'C�digo del propietario de la cuenta bancaria, siendo este su n�mero de c�dula'
;

COMMENT ON COLUMN  "SIMULADOR_BANCO"."V_SALDO" IS 'Cantidad de dinero disponible que tiene el cliente en su cuenta bancaria para gastar.'
;

COMMENT ON COLUMN  "SIMULADOR_BANCO"."I_CODIGO" IS 'C�digo de verificaci�n de la tarjeta'
;

COMMENT ON COLUMN  "SIMULADOR_BANCO"."I_CLAVE" IS 'Clave de la cuenta bancaria'
;

COMMENT ON COLUMN  "SIMULADOR_BANCO"."I_ESTADO" IS 'Estado de la cuenta bancaria'
;

COMMENT ON COLUMN  "SIMULADOR_BANCO"."F_FECHAVEN" IS 'Fecha en la que vence la cuenta bancaria'
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  "SIMULADOR_BANCO" 
 ADD CONSTRAINT "PK_Simulador_banco"
	PRIMARY KEY ("K_CODTARJETA")
;

ALTER TABLE  "SIMULADOR_BANCO" 
 ADD CONSTRAINT "CK_I_ESTADO" CHECK (I_ESTADO IN ('ACTIVA','INACTIVA','BLOQUEADA'))
;

ALTER TABLE  "SIMULADOR_BANCO" 
 ADD CONSTRAINT "CK_V_SALDO" CHECK (V_SALDO>=0)
;

ALTER TABLE  "SIMULADOR_BANCO" 
 ADD CONSTRAINT "CK_I_CLAVE" CHECK (V_SALDO>=0)
;

ALTER TABLE  "SIMULADOR_BANCO" 
 ADD CONSTRAINT "CK_I_CODIGO" CHECK (I_CODIGO>0)
;

CREATE PUBLIC SYNONYM BANCO FOR BANCO.SIMULADOR_BANCO;

insert into banco values('123456789010','BANCOLOMBIA','400000','10200300,50','123','1234','ACTIVA',DATE'1996-03-01');

CONN SYSTEM/1234

GRANT SELECT ON BANCO TO JUAN;

CONN JUAN/juan

SELECT * FROM BANCO;

