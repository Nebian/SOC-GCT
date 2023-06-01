# Reporte - Approved: See Completed Remmittance_Summary: Message for Benmayor on May 9, 2023 at 09:15:19 AM
## Sospechas Iniciales
- Direcciones de correo electrónico sospechosas: La dirección de correo del remitente contiene un dominio sospechoso.    
- Adjunto sospechoso: Detectamos que el adjunto es un HTML, un formato extraño para una factura. Normalmente las facturas se envían en formato pdf, excel o incluso formatos de imagen.
- Diseño de baja calidad: El correo no contiene cuerpo, es decir, sólo contiene asunto y un adjunto.

## Análisis
Con las sospechas iniciales tenemos suficientes hilos de los que tirar para empezar con el análisis, en caso de que no encontremos nada, se hará una búsqueda más a fondo.

### VirusTotal
Enviamos el correo a VirusTotal y nos confirma que el adjunto es un archivo malicioso de tipo troyano / phishing.  
[Análisis - Approved: See Completed Remmittance_Summary - By VirusTotal](https://www.virustotal.com/gui/file/7893bcff62f0672fc1d21dec0eb0df814e4b3c180cd0b3a5bda98d540de45d93)

### OSINT
Buscamos el domino del correo en internet, parece la web de una universidad, la web no está securizada, pues carece de certificado. Podría tratarse de una falsa universidad, una web clonada o, por la falta de securización, una web real que ha sido comprometida y están usando sus cuentas para enviar phishing.

## Conclusión
Como hemos interceptado este correo y ya hemos verificado que contiene un archivo malicioso, podemos marcarlo como phishing y bloquear el dominio que nos lo envía.

**Tiempo empleado: 10 min**