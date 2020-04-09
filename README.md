# cobranza2.0

Repositorio de transformaciones del  sistema cobranza 2.0.

Para ejecurar las trnasformaciones: 

*Se debe reemplazar en la instalación de Pentaho Data Integration del servidor el archivo <data-integration-intalation>/simple-jndi/jdbc.properties  por el archivo existente en este repositorio en la ruta config/jdbc.properties 

La linea de ejecucion de la trasformacion con los parametros:

Linux:

$ ./pan.sh -file="<source_code_path>/generaArchivoBOD.ktr" -level=basic "'<co_banco>'" "'<fe_ejecucion>'" "'<fe_envio>'" <co_dia_cobro> "'<nu_cuenta_abadia>'" "<nb_archivo_destino>"

ejemplo:
./pan.sh -file="/home/portilloga/work/sources/cobranza2.0/generaArchivoBOD.ktr" -level=basic "'0116'" "'28-04-2019'" "'30-04-2019'" 0 "'XXXXXXXXXXXX'" "bod15y30"
