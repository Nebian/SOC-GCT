# Procedimiento de respuesta para un correo electrónico malicioso

## Información general

| Perfil | Descripción |
| ------ | ----------- |
| Propieatario del proceso | TUE |
| Autor | TUE |
| Procedimiento / Política | Procedimiento de respuesta para un correo electrónico malicioso |
| Fecha efectiva |  |
| Última actualización del documento | 22/05/2023 |
| Aprobación |  |

## Historial de versiones

| Versión | Revisión |
| ------- | -------- |
| 1.0 | Se crea el caso de uso |

## Definiciones

A continuación, se listan las definiciones de los conceptos utilizados en la redacción del presente caso de uso. Estos conceptos deben ser conocidos y comprendidos de forma previa a adentrarse en la lectura del documento, para asegurar una correcta comprensión de este:

- **Business Email Compromise:** El Business Email Compromise (BEC) es un tipo de fraude cibernético que implica el uso de tácticas de phishing, ingeniería social y suplantación para engañar a las personas y obtener información confidencial, como datos de inicio de sesión o para inducir a las víctimas a realizar transferencias de dinero a cuentas controladas por los ciberdelincuentes. En este tipo de ataques, los delincuentes suelen hacerse pasar por altos ejecutivos o socios comerciales de confianza.

- **Indicador de compromiso:** Un Indicador de Compromiso (IoC, por sus siglas en inglés) es una pieza de evidencia que sugiere que un sistema podría haber sido comprometido o afectado por una actividad cibernética maliciosa. Los IoCs pueden incluir valores como direcciones IP sospechosas, URL maliciosas, hashes de archivos de malware, o patrones de comportamiento de red anormal, entre otros. Son fundamentales en el campo de la ciberseguridad para detectar, prevenir y responder a ciberamenazas.

- **Ingenieria Social:** La ingeniería social es una estrategia que utilizan los ciberdelincuentes para manipular o engañar a las personas para que revelen información confidencial o sensible. Se basa en la manipulación psicológica y a menudo implica engaño, fraude o explotación de la confianza para obtener información, acceso o recursos.

- **Phishing:** Phishing es una táctica de ciberdelincuencia que se utiliza para engañar a las personas para que revelen información personal o financiera, como contraseñas o detalles de tarjetas de crédito. Esto se logra a menudo a través de mensajes de correo electrónico o sitios web fraudulentos que parecen ser de confianza, pero en realidad están controlados por los atacantes. Los ciberdelincuentes pueden usar esta información para realizar actividades fraudulentas, como realizar compras no autorizadas, robar identidades o introducir malware en los sistemas de las víctimas.

- **Respuesta a incidentes:** La respuesta a incidentes es el enfoque y manejo de situaciones que resultan de ataques cibernéticos o violaciones de seguridad. Incluye la identificación del incidente, su investigación, la limitación del daño, la eliminación de la causa del incidente y la recuperación a un estado seguro. También puede incluir actividades para prevenir futuros incidentes, como el análisis de la incidente para aprender de este y mejorar los procedimientos de seguridad y respuesta.


## Responsabilidades

El análisis de correos electrónicos puede ser hecho por diferentes roles dentro de la organización, la única diferencia es

- **Analista Nivel 1:** El **análisis de correos sospechosos siempre será una tarea inicialmente asignada a un analista de nivel 1**, debido a que no se trata de una actividad muy compleja y que se puede llevar a cabo con herramientas muy fáciles de usar. El objetivo es que este sea capaz de diferenciar de manera inicial si el correo es malicioso o no, y en caso positivo analizarlo de manera superficial para. Por este motivo, este caso de uso está diseñado para la comprensión y uso por parte de las personas designadas a este rol. 

- **Threat Hunter:** Un threat hunter puede analizar los correos de forma más profunda para detectar IOCs más complejos o patrones en el envío o redacción de estos, con el objetivo de detectar campañas de phishing en activo. De esta manera, poder indagar en estas y obtener más información para la prevención de ser afectados por su alcance. 

- **Analista de Respuesta a Incidentes:** En caso de respuesta a incidentes, un analista solo procederá al análisis de correo en aquellos escenarios donde el correo electrónico este implicado. Es decir, frente un posible Business Email Compromise, correo electrónico como vector de entrada, etc. 


## Detección y Análisis

En esta sección se detallan los aspectos principales que permiten determinar con precisión de que el correo recibido se trata de un email de phishing y no de un falso positivo. Por este motivo, se dividen los rasgos en externos, apreciables sin analizar el contenido técnico del correo, y los internos, apreciables cuándo se analiza el contenido técnico del correo (trace headers/headers/body).


### Primeras sospechas

Estos son los aspectos a tener en cuenta para detectar un correo electrónico malicioso sin analizar sus aspectos técnicos. Son los que podemos visualizar en la plataforma de buzón de correo electrónico y los principales son:

- **Direcciones de correo electrónico sospechosas**: La dirección de correo electrónico del remitente puede contener caracteres extraños, errores de ortografía, dominios desconocidos, es muy larga...

- **Solicitudes de información personal**: Los correos electrónicos de phishing a menudo solicitan que actualices tu información personal, incluyendo contraseñas, números de tarjeta de crédito y otros detalles financieros.

- **Urgencia**: Estos mensajes a menudo tienen un tono de urgencia, solicitando que se tomen medidas inmediatas para evitar algún tipo de consecuencia negativa.
    
- **Errores gramaticales y de ortografía**: Aunque no siempre es el caso, muchos correos electrónicos de phishing están mal escritos o contienen errores gramaticales evidentes.
    
- **Enlaces y adjuntos sospechosos**: Los correos electrónicos de phishing a menudo incluyen enlaces a sitios web fraudulentos o adjuntos que contienen malware.
    
- **Diseño de baja calidad**: Algunos correos electrónicos de phishing pueden tener un diseño de baja calidad, como logotipos mal formateados o que parecen falsos.

Si se detectan estos rasgos durante la observación del correo en el cliente de correo electrónico, se recomienda proceder a un estudio más profundo de sus cabeceras. Para hacer este estudio, se descarga el correo en formato .eml y se carga en un editor de texto cualquiera. 


### Análisis técnico

#### ¿Que son los headers?

Una vez abierto el fichero .eml se procede a analizar de forma manual el correo electrónico. Antes de iniciar el análisis, se debe diferenciar entre los Trace headers y los Main headers: 

1. **Trace headers:** Estos encabezados proporcionan información sobre el camino que el correo electrónico ha seguido desde el remitente hasta el destinatario. Estos encabezados incluyen "Received", que se añade cada vez que un servidor de correo procesa el mensaje. A través de estos encabezados, se puede rastrear el camino que un correo electrónico ha tomado a través de la red, lo que puede ser útil para el diagnóstico de problemas de entrega de correo o para investigar correos electrónicos sospechosos.

	Un encabezado "Received" típico podría verse así:

```
Received: from server1.example.com (server1.example.com [x.x.x.x])
by server2.example.com (Postfix) with ESMTP id 1234ABC
for <dest@example.com>; Fri, 18 May 2023 21:40:29 -0400 (EDT)
```

Este encabezado indica que el correo electrónico fue recibido por "server2.example.com" del servidor "server1.example.com". La dirección IP entre corchetes (x.x.x.x) es la dirección IP del servidor de envío. La línea también incluye el identificador del mensaje asignado por el servidor receptor ("1234ABC" en este caso), el destinatario del correo electrónico (dest@example.com) y la fecha y hora en que se recibió el correo.

Los campos Received se leen en orden inverso, de abajo a arriba, es decir que el último campo de Received es en verdad el primero que se debe leer. Al leer los encabezados "Received" de abajo hacia arriba, puedes seguir la ruta que un correo electrónico tomó desde el remitente hasta el destinatario. Esto puede ser útil para solucionar problemas de entrega de correo o para rastrear el origen de correos electrónicos sospechosos o no deseados.

2. **Main headers:** Estos encabezados proporcionan información esencial sobre el correo electrónico, como el remitente (From), el destinatario (To), el tema del correo electrónico (Subject), y la fecha y hora en que se envió el correo electrónico (Date). Otros encabezados importantes incluyen CC y BCC para copias de correo adicionales, y Reply-To para especificar una dirección de correo diferente para las respuestas.


#### Cómo analizar los headers

Para analizar los Main headers nos debemos fijar en los siguientes campos:

- **FROM:** Nos indica de que dirección se ha mandado el correo electrónico. Debería coincidir con la dirección del campo de **Reply-to** y con el dominio de la dirección del campo de **Return-Path**.

- **REPLY-TO:** Se trata de la dirección donde se escribirá la respuesta al correo, debe coincidir con la dirección de From.

- **RETURN-PATH:**  Indica la dirección a la que deben enviarse las respuestas automáticas del sistema, como los mensajes de error o de fallo en la entrega. Esta dirección debería tener el mismoo dominio que la dirección del From.

- **TO:** Dirección de correo a la que se le manda el correo electrónico (destinatario), en caso de no aparecer la dirección de la persona estudiada es porque esta se encuentra enlazada como copia oculta. 

- **TIMESTAMP:** Fecha de recepción del correo electrónico. Debe ser estudiada para encontrar anomalías como correos fuera del horario de oficina, durante la noche, los fines de semana, etc. 

- **MESSAGE-ID:** Identificador que pone el servidor del remitente al correo electrónico. Es importante confirmar que el identificador tiene el dominio de la dirección del From, en caso contrario se podría detectar un spoofing. 

- **X-HEADERS:** Algunos servidores de correo electrónico están configurados para añadir sus propias cabeceras. La finalidad de estas es aportar más riqueza a los correos por temas diversos como debugging, administración y configuración de correos, etc. Es importante fijarse en estos headers para obtener información útil adicional a la estándar. 


Una vez analizados los Main Headers, se pasará a los Trace Headers. De estos headers querremos obtener la dirección IP del servidor de correo donde el remitente ha entregado el correo y si puede ser obtener la dirección IP del cliente del remitente. Una vez obtenidas podemos realizar búsquedas con ellas. Las demás direcciones IP también son interesantes de estudiar al igual que el recorrido ejercido por el correo. 

También es interesante estudiar el valor del campo **Authenticated-Results**, que incluye los resultados de SPF, DKIM y DMARC. Este campo nos indica si alguno de estos tres protocolos ha fallado y nos da información sobre la posibilidad de un spoofing.


#### Análisis del body

El análisis del body se basa en investigar los posibles enlaces y ficheros adjuntos en el interior del correo. Nos interesa saber el comportamiento que tienen estos artefactos, si son malware, si descargan malware, a que dirección IP se conectan, redireccionan dominios, etc. Es importante determinar el comportamiento de estos artefactos para poder determinar con precisión la naturaleza del correo. 


## Herramientas

Existen muchas herramientas que pueden ser utilizadas para analizar los artefactos encontrados en un correo electrónico. A continuación, se adjunta una lista de las recomendadas según el campo que se quiera analizar: 

- **Dominios:** Se puede analizar la reputación del dominio remitente con Virus Total o Cisco Talos. Además, se recomienda buscar si la dirección de correo electrónico esta marcada como maligna en la base de datos de SpamHaus.

- **Direcciones IP:** Para obtener la reputación de la dirección IP existe Virus Total y Cisco Talos. Para obtener información sobre quién es el dueño de la dirección IP existe Whois Lookup de Domaintools o IPinfo. 

- **URLs:** Para anlizar el URL de forma completa existe URLSCAN.io. Para analizar posibles redirecciones y expandir Tiny URLs existe Tiny URL Expander. Para decodificar enlaces tenemos URL decoder. Por último existen dos herramientas URL2PNG y Wannabrowser que nos permiten obtener la imagen que se ve al abrir el enlace sin tener que abrirlo nosotros. De esta manera, podemos saber a que contenido se va a acceder antes de clickar el enlace.  

- **Headers:** Existen herramientas de análisis automáticos de headers. El uso de estas no es recomendable debido a que se desconoce como tratan los datos subidos. Un correo electrónico puede contener información confidencial en sus cabeceras, y por este motivo la recomendación es siempre analizar el correo mediante un editor de texto. Algunos de estos son Message Header Analyzer de Azurewebsites, el de Google Toolbox o mailheader.org.  

- **Archivos adjuntos:** Los archivos adjuntos deben ser investigados para descartar la posibilidad de que se traten de malware. Estos pueden ser analizados en Sandboxes o plataformas como VirusTotal. También se pueden realizar búsquedas de su hash en VirusTotal o Cisco Talos File Reputation para averiguar que si se tratan de malware conocido. 

- **Sandboxes:** Existen sandboxes online gratuitas que permite analizar el comportamiento de los correos electrónicos, sus enlaces y archivos adjuntos. Su uso facilita mucho el trabajo pero expone de forma pública el archivo, es decir, queda un registro público de que el archivo ha sido analizado. El atacante podría rastrear este registro y detectar si alguien ha encontrado su malware o lo está analizando. Esto podría hacer que el atacante acelerará su intrusión o por otro lado escapará del intento, ninguno de los dos es un escenario deseado. Algunas de estas son Joe Sandbox, Any.run o Hybrid Analysis. 

- **Otras Herramientas:** Para analizar contenido cifrado podemos utilizar Cyberchef que nos permitirá realizar una traducción de este a texto plano. 


## Evaluación y clasificación

En el caso que se haya notificado el análisis del correo debido a que un cliente ha caído en la trampa, se deberá informar de la gravedad del asunto y tomar las medidas necesarias según el impacto que esta amenaza pueda llegar a tener. 

En el caso que el correo sea analizado debido a temas de threat hunting o derivados, no se deberá escalar el asunto y básicamente se procederá con el bloqueo o reporte de los artefactos encontrados. 


## Respuesta 

La respuesta a un correo electrónico sospechoso se basa en el bloqueo de los artefactos encontrados. A continuación se explica como bloquear los diferentes artefactos:

- **Dirección IP:** Se bloquea la conexión para todos los clientes a esta dirección IP en el EDR.
- **URL:** Se bloquea la conexión para todos los clientes al dominio malicioso en Cisco Umbrella. En caso de compromiso de un dominio benigno, se bloquearía solo la conexión al subdominio. 
- **Dirección del remitente:** Se bloquea en el servidor de correos del cliente afectado el dominio utilizado para enviar el correo electrónico, en algunos casos bloquear el dominio no será óptimo y por tanto se bloqueará la dirección del remitente. 

Hay que tener en cuenta que a veces los atacantes utilizarán canales conocidos y respetados para ejercer su ataque. Por ejemplo, pueden hacer el phishing desde una dirección de correo electrónico de dominio gmail.com o enviar desde un servidor de correos compartido en el cloud. Por este motivo, hay que valorar si el bloqueo que se va a ejercer puede perjudicar el correcto rendimiento de la empresa afectada. Es decir, que si yo bloqueo el dominio gmail, voy a estar bloqueando más tráfico benigno que maligno y por tanto no beneficio al rendimiento de la empresa. Este tipo de situaciones deben estar en mente a la hora de ejercer bloqueos de artefactos. 


## Comunicación y Coordinación

Se deberán comunicar los resultados al cliente que ha recibido el correo electrónico y/o que ha solicitado el análisis de este. 

En caso de ser un caso de threat hunting, solo se notificaría al cliente en caso de tratarse de una amenaza muy grave o focalizada en su sector. 


## Análisis y Mejora

Una vez finalizada el análisis del correo se observan las técnicas utilizadas y en caso de descubrir una desconocida se investigará a fondo. Los resultados de esta investigación serán reflejados en este documento para garantizar que los miembros de Grail Cyber Tech estén formados para  comprender y dar respuesta frente este escenario. 

Por tanto, se actualizará este procedimiento en base a las lecciones aprendidas y a los cambios en el sector de la seguridad.

