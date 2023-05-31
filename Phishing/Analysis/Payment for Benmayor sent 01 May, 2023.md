# Reporte - Payment for Benmayor sent 01 May, 2023
## Sospechas Iniciales
- Adjunto sospechoso: Detectamos que el adjunto es un HTML, un formato extraño para una factura. Normalmente las facturas se envían en formato pdf, excel o incluso formatos de imagen.
- Diseño de baja calidad: El diseño del correo es pobre, carece de plantilla, la firma es demasiado simple, no tiene logo.

## Análisis
Con las sospechas iniciales tenemos suficiente para decidirnos a seguir analizando el correo, en caso de que no encontremos nada, se hará una búsqueda más a fondo.

### VirusTotal
Enviamos el correo a VirusTotal y nos confirma que el adjunto es un archivo malicioso de tipo troyano / phishing.  
[Análisis - Payment for Benmayor sent 01 May, 2023 - By VirusTotal](https://www.virustotal.com/gui/file/6ce1a852baf7b88c7d03c15c501dc34d260a4721023262973864c1ae1fc3c48c)

## Conclusión
Como hemos interceptado este correo y ya hemos verificado que contiene un archivo malicioso, podemos marcarlo como phishing y bloquear el dominio que nos lo envía.