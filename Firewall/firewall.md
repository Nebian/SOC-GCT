# Instalación y configuración Pfsense:
Install Pfsense --> Spanish Keymap --> Auto (UFS) BIOS --> Reboot
### Interfaces:
```bash
RED: DHCP 192.168.1.64
```
```bash
WAN: 212.0.0.1
```
```bash
LAN: 10.100.10.1
```
### Machines: 
```bash
PC1: 10.100.10.15
```
```bash
PC2: 10.100.10.16
```
```bash
Server: 10.100.10.2
```
Una vez configuradas las IP hay que crear el Nateo entre las dos redes privadas del PfSense, para ellos seguimos estos pasos:

1. Accede a la interfaz de administración web de pfSense utilizando un navegador web e inicia sesión con las credenciales de administrador 

2. En la barra de menú superior, haz clic en "Firewall" (Firewall) y selecciona "NAT" en el menú desplegable 

3. Asegúrate de estar en la pestaña "Port Forward" (Reenvío de puertos)

- WAN --> LAN
1. Haz clic en el botón "Add" (Agregar) para crear una nueva regla.
2. En la sección "General settings", establece la siguiente configuración:

> Interface (Interfaz): "WAN". (212.0.0.1)

> Protocol (Protocolo): "Any".

> Destination (Destino): (10.100.10.1)

> Destination port range "Any".

> En la sección "Redirect target IP" (212.0.0.1)

> Haz clic en "Save" para aplicar la nueva regla.

- LAN --> WAN
1. Haz clic en el botón "Add" (Agregar) para crear una nueva regla.
2. En la sección "General settings", establece la siguiente configuración:

> Interface (Interfaz): "LAN". (10.100.10.1)

> Protocol (Protocolo): "Any".

> Destination (Destino): (212.0.0.1)

> Destination port range "Any".

> En la sección "Redirect target IP" (10.100.10.1)

> Haz clic en "Save" para aplicar la nueva regla.

3. En la barra de menú superior, haz clic en "Firewall" y selecciona "Rules" en el menú desplegable.

- LAN --> WAN

1. Asegúrate de estar en la pestaña "LAN" y haz clic en el botón "Add" (Agregar) para crear una nueva regla.

2. En la sección "General settings" (Configuración general), establece la siguiente configuración:

> Action: "Pass".

> Interface: "LAN".

> Protocol: "Any".

> Source: "Any".

> Destination: "Any".

> En la sección "Extra Options", desplázate hacia abajo y marca la casilla "Log packets that are handled by this rule" si deseas registrar los paquetes afectados por esta regla.

> Haz clic en "Save" para aplicar la nueva regla.

- WAN --> LAN

1. Asegúrate de estar en la pestaña "WAN" y haz clic en el botón "Add" (Agregar) para crear una nueva regla.

2. En la sección "General settings" (Configuración general), establece la siguiente configuración:

> Action: "Pass".

> Interface: "WAN".

> Protocol: "Any".

> Source: "Any".

> Destination: "Any".

> En la sección "Extra Options", desplázate hacia abajo y marca la casilla "Log packets that are handled by this rule" si deseas registrar los paquetes afectados por esta regla.

> Haz clic en "Save" para aplicar la nueva regla.

Ahora vamos a Firewall --> Virtual IPs --> Add --> creamos la IP 212.0.0.1 en la interfaz LAN

# Suricata
Actualizarem







