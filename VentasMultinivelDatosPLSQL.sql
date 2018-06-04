-- Calcula el precio total de la venta cada vez que agrega un nuevo producto
create or replace trigger preciototal
after insert on PRODUCTO_VENTA
    FOR EACH ROW
DECLARE
    V_TOTAL NUMBER(15,2);
    V_ANTERIOR NUMBER(15,2);
    V_IVA NUMBER(3,2);
    
BEGIN
	SELECT V.V_PRECIOFINAL INTO V_ANTERIOR FROM VENTA V WHERE :new.K_VENTA=V.K_CODVENTA;
	SELECT (P.V_PRECIO * :new.Q_CANTIDAD) INTO V_TOTAL FROM PRECIO P,VENTA V WHERE P.K_PRODUCTO=:new.K_PRODUCTO AND :new.K_VENTA=V.K_CODVENTA;
    select I.V_IVA INTO V_IVA from IVA I,VENTA V where V.K_IVA =I.K_IMPUESTO;
    V_TOTAL := V_ANTERIOR + (V_TOTAL * V_IVA);
    UPDATE VENTA SET V_PRECIOFINAL = V_TOTAL WHERE VENTA.K_CODVENTA = :new.K_VENTA;
    --La siguiente linea es para actualizar el stock de la region, el error que esta es que le resta
    --a cualquiera de las regiones
    UPDATE PRODUCTO_REGION SET Q_STOCK = Q_STOCK - :new.Q_CANTIDAD WHERE PRODUCTO_REGION.K_PRODUCTO = :new.K_PRODUCTO;
END;
/

--Realizar la calificación del representante de una venta
CREATE OR REPLACE PROCEDURE CALIFICAR_REPRESENTANTE(codRepresent IN VENTA.K_ID_REP_CLIENTE%TYPE,
                                                    calificacion IN VENTA.V_CALIFICACION%TYPE,venta IN VENTA.K_CODVENTA%TYPE) IS 
BEGIN
    update venta v set v.V_CALIFICACION = calificacion where v.K_ID_REP_CLIENTE = codRepresent and v.K_CODVENTA = venta;
END CALIFICAR_REPRESENTANTE;
/
