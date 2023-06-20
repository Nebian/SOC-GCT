# SIEM

# Wazuh
## Instalación de Wazuh:
Comenzamos actualizando el servidor.
```bash
sudo apt-get update
```
```bash
sudo apt-get upgrade
```
Cambiamos la Ip. Dejamos un adaptador de red de forma dinámica, cambiamos el otro adaptador de forma estática a 213.191.10.5

-Guia para la configuracion de la ip dentro de ubuntu

Realizamos la instalación de Wazuh dentro del servidor.
```bash
curl -sO https://packages.wazuh.com/4.4/wazuh-install.sh && sudo bash ./wazuh-install.sh -a
```

# Conectividad
En este punto encontramos problemas de conectividad debido a las diferentes subredes.

El servidor donde está ubicado Wazuh tiene la ip 212.0.0.2, el servidor pfsense que es donde conecta directamente tiene las ips 212.0.0.1 y 10.100.10.1.

Toda la red debe tener conectividad, esto significa que el Wazuh pueda ver al endpoint 10.100.10.15.

Para esto, debemos configurar correctamente las reglas en el pfsense para que haga de enrutador (explicado en la sección de "Firewall").

En los endpoints podemos hacer esto gracias a rutas estaticas. Podemos crear rutas en Windows de la siguiente manera:
```bash
route add [destino] mask [máscara de red] [puerta de enlace] metric [métrica]
```