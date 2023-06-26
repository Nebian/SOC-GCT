# Active Directory

## Servidor Windows
Instalación del Servidor:

En este caso, nosotros contamos con un Windows 11 Server de 2022, dónde alojaremos nuestro servidor activo.

Primero vamos a configurar las interfaces de red. Nos encontramos con dos:

- La primera interfaz con IP estática (10.100.10.2) con puerta de enlace al servidor.
- La segunda la encontramos con IP dinámica.

Una vez instalado y configurado el sistema operativo, procedemos con la instalación de los roles y características que queramos instalar en nuestro servidor.

Pasos:
- Paso 1. Procedemos con la instalación basada en características o en roles.

- Paso 2. Seleccionamos el servidor del grupo de servidores, donde queremos instalar los roles y características.

- Paso 3. Instalamos los roles correspondientes. En nuestro caso, hemos instalado los servicios de dominio, de certificados, DHCP, DNS y de Escritorio Remoto.

- Paso 4. Instalamos las características correspondientes. En nuesto caso, hemos instalado la administración de directivas de grupo, las copias de seguridad de Windows Server, herramientas de administración de roles y de migración de Windows Server.

- Paso 5. En los servicios de rol del escritorio remoto, Instalamos la Administración de licencias de Escritorio remoto, el agente de conexión y el Remote Desktop Session Host.

- Paso 6. Instalamos la entidad de certificación.

- Paso 7. Vamos a los resultados y finalizamos la instalación.

Ahora vamos a ascender el servidor a Controlador del dominio. Para ello tenemos que asignar algunos apartados de la configuración:

- Agregamos un nuevo bosque y le asignamos el nombre del domínio raíz (grail.tech).

- Escribimos la contraseña de restauración.

- El nombre de dominio NETBIOS (GRAIL).

- Instalamos y reiniciamos el servidor.

Lo siguiente será configurar el sistema de credenciales y certificaciones del dominio.

- Especificamos las credenciales para configurar los servicios de rol, en este caso lo he hecho con el usuario Administrador.

- Especificamos el tipo de CA como raíz.

- Encriptamos la clave con SHA512 con una longitud de clave de 2048.

- Asignamos un nombre común para la entidad.

- Especificamos un periodo de validez.

- Asignamos la ruta donde se almacenara la base de datos de los certificados.

- Confirmamos y terminamos la configuración de los certificados del Active Directory.