# Reporte - Pago
## Sospechas Iniciales
- Direcciones de correo electrónico sospechosas: La dirección de correo del remitente está en nuestro dominio, pero la dirección de la respuesta es a un dominio distinto, además un dominio de una empresa privada de la que se cree, es un honeypot federal.
- Urgencia: Muestra cierta urgencia al decir que si el pago puede ser "ahora".
- Diseño de baja calidad: La cantidad a ingresar es muy específica, pero que no especifique el nombre de la empresa es sospechoso, ¿cómo que se supone que va  a saber a qué empresa hacer el pago?

## Análisis
Las sospechas iniciales inducen una posible infiltración en la cuenta del empleado que envía el mensaje. 

### Ingeniería Social
El atacante está usando la cuenta víctima para envíar correos y pone como correo de respuesta otro distinto para que la víctima suplantada no se percate al recibir una contestación. 

## Conclusión
Seguramente la estrategia trate de enviar un mensaje que pueda parecer real sobre un pago pero sin especificar detalles, entonces cuando la víctima que recibe el mensaje contesta preguntando por la dirección bancaria se le envía una cuenta bancaria que no pertenece a la supuesta empresa.

**Tiempo empleado: 15 min**