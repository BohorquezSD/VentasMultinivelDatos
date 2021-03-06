--------------------------------DROPS INICIALES--------------------

DROP USER MARIA;
DROP USER DUVAN;
DROP USER SEBASTIAN;
DROP USER ALEXIS;
DROP USER JUAN;

DROP ROLE R_CLIENTE;
DROP ROLE R_REPVENTAS;
DROP ROLE R_DIRECTOR;

DROP VIEW V_REGION;
DROP VIEW V_CATEGORIA 

DROP TABLE CATEGORIA CASCADE CONSTRAINTS
;
DROP TABLE CLASIFICACION CASCADE CONSTRAINTS
;
DROP TABLE CLIENTE CASCADE CONSTRAINTS
;
DROP TABLE PAIS CASCADE CONSTRAINTS
;
DROP TABLE PRECIO CASCADE CONSTRAINTS
;
DROP TABLE PRODUCTO CASCADE CONSTRAINTS
;
DROP TABLE PRODUCTO_REGION CASCADE CONSTRAINTS
;
DROP TABLE PRODUCTO_VENTA CASCADE CONSTRAINTS
;
DROP TABLE REGION CASCADE CONSTRAINTS
;
DROP TABLE REP_VENTAS CASCADE CONSTRAINTS
;
DROP TABLE SUBCATEGORIA CASCADE CONSTRAINTS
;
DROP TABLE VENTA CASCADE CONSTRAINTS
;
DROP TABLE VENTA_REPVENTA CASCADE CONSTRAINTS
;

DROP PUBLIC SYNONYM CATEGORIA ;
DROP PUBLIC SYNONYM CLASIFICACION;
DROP PUBLIC SYNONYM CLIENTE;
DROP PUBLIC SYNONYM PAIS;
DROP PUBLIC SYNONYM PRECIO;
DROP PUBLIC SYNONYM PRODUCTO ;
DROP PUBLIC SYNONYM PRODUCTO_REGION ;
DROP PUBLIC SYNONYM PRODUCTO_VENTA ;
DROP PUBLIC SYNONYM REGION ;
DROP PUBLIC SYNONYM REP_VENTAS;
DROP PUBLIC SYNONYM SUBCATEGORIA;
DROP PUBLIC SYNONYM VENTA;
DROP PUBLIC SYNONYM VENTA_REPVENTA;
DROP PUBLIC SYNONYM V_REGION;
DROP PUBLIC SYNONYM V_CATEGORIA;
DROP PUBLIC SYNONYM SEQ_VENTA;
DROP PUBLIC SYNONYM SEQ_REGION;
DROP PUBLIC SYNONYM SEQ_CATEGORIA;
DROP PUBLIC SYNONYM SEQ_SUBCATEGORIA;
DROP PUBLIC SYNONYM SEQ_CALIFICACION;
DROP PUBLIC SYNONYM SEQ_PAIS;

DROP SEQUENCE SEQ_PAIS;
DROP SEQUENCE SEQ_REGION;
DROP SEQUENCE SEQ_CATEGORIA;
DROP SEQUENCE SEQ_SUBCATEGORIA;
DROP SEQUENCE SEQ_CALIFICACION;
DROP SEQUENCE SEQ_VENTA;



