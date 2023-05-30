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

https://www.solvetic.com/tutoriales/article/10984-configurar-ip-estatica-en-ubuntu-server-22-04/
Realizamos la instalación de Wazuh dentro del servidor.
```bash
curl -sO https://packages.wazuh.com/4.4/wazuh-install.sh && sudo bash ./wazuh-install.sh -a
```




https://documentation.wazuh.com/current/installation-guide/wazuh-server/step-by-step.html