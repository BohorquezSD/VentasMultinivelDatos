-- Calcula el precio total de la venta cada vez que agrega un nuevo producto
create or replace trigger preciototal
after insert on PRODUCTO_VENTA
    FOR EACH ROW
DECLARE
    V_TOTAL NUMBER(15,2);
    V_ANTERIOR NUMBER(15,2);
    V_IVA NUMBER(3,2);
    K_REGION NUMBER(4);
    
BEGIN
	
	SELECT V.V_PRECIOFINAL INTO V_ANTERIOR FROM VENTA V WHERE :new.K_VENTA=V.K_CODVENTA;
	SELECT (P.V_PRECIO * :new.Q_CANTIDAD) INTO V_TOTAL FROM PRECIO P,VENTA V WHERE P.K_PRODUCTO=:new.K_PRODUCTO AND :new.K_VENTA=V.K_CODVENTA;
    	select I.V_IVA INTO V_IVA from IVA I,VENTA V where V.K_IVA =I.K_IMPUESTO;
	select RP.K_CODREGION INTO K_REGION from REPRESENTANTE_CLIENTE RC, VENTA V, REGION_REPRESENTANTE RP where V.K_ID_REP_CLIENTE=RC.K_ID_REP_CLIENTE AND V.K_CODVENTA = :NEW.K_VENTA AND RP.K_REPVENTA=RC.K_CODREPVENTAS;
	V_TOTAL := V_ANTERIOR + (V_TOTAL * V_IVA);
	UPDATE VENTA SET V_PRECIOFINAL = V_TOTAL WHERE VENTA.K_CODVENTA = :new.K_VENTA;
	UPDATE PRODUCTO_REGION PR SET Q_STOCK = Q_STOCK - :new.Q_CANTIDAD WHERE PR.K_PRODUCTO = :new.K_PRODUCTO AND PR.K_REGION = K_REGION;
END;
/
--Realizar la calificación del representante de una venta
CREATE OR REPLACE PROCEDURE CALIFICAR_REPRESENTANTE(codRepresent IN VENTA.K_ID_REP_CLIENTE%TYPE,
                                                    calificacion IN VENTA.V_CALIFICACION%TYPE,venta IN VENTA.K_CODVENTA%TYPE) IS 
BEGIN
    update venta v set v.V_CALIFICACION = calificacion where v.K_ID_REP_CLIENTE = codRepresent and v.K_CODVENTA = venta;
END CALIFICAR_REPRESENTANTE;
/

CREATE OR REPLACE PROCEDURE PROMEDIO_PERIODICO(K_CODREPVENTAS IN REP_VENTAS.K_CODREPVENTAS%TYPE) IS
  CURSOR c1 IS SELECT TO_CHAR(V.F_FECHA,'YY/MM') , AVG(V.V_CALIFICACION)  FROM VENTA V, REP_VENTAS RV 
	WHERE V.K_ID_REP_CLIENTE = RV.K_CODREPVENTAS AND RV.K_CODREPREGIS = K_CODREPVENTAS GROUP BY F_FECHA;
	FECHA c1%ROWTYPE;
	PROMEDIO c1%ROWTYPE;
BEGIN

	OPEN c1;
		LOOP
			FETCH c1 INTO FECHA,PROMEDIO;
			DBMS_OUTPUT.put_line (PROMEDIO);
			EXIT WHEN c1%NOTFOUND;
		END LOOP;
	CLOSE c1;
END PROMEDIO_PERIODICO;
/
