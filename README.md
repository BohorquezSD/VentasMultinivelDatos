# VentasMultinivelDatos
Al correr el script de llenado, si se genera error con los valores numéricos con punto flotante como "6,3" comprobar
que delimitador de decimal está utilizando el moto, para comprobarlo hacer la consulta:
select value
from nls_session_parameters
where parameter = 'NLS_NUMERIC_CHARACTERS';
el primer caracter que aparezca es el que se utiliza como delimitador de decimal
y haciendo NLS_NUMERIC_CHARACTERS = ', ' se cambia no el delimitador a coma
