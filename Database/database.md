# Database

## PostgreSQL
Instalación de PostgreSQL:

Estamos usando un Windows Server 2019 para la base de datos, así que haremos una instalación con interfaz gráfica, detallaré los enlaces de descarga y pasos importantes.

[Descarga de PostgreSQL](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)

Ejecutamos el instalador. 

En la pantalla de selección de componentes dejamos todos seleccionados, pgAdmin será útil para administrar la base de datos y las Command Line Tools para la securización.

Introduciremos una contraseña segura para el ususario postgres, pues será el usuario administrador de la base de datos, esta contraseña es la más importante. 

Seguimos los pasos del instalador, dejando todo con la configuración por defecto. 

Abriremos el complemento **PgAdmin 4**, que nos ayudará a gestionar la base de datos.
Desde aquí podemos hacer operaciones de administración de la base de datos sin tener que usar la línea de comandos. Pero en este caso para importar los datos y poder hacer consultas y otras operaciones, usaré DBeaber.

[Descarga de DBeaver](https://dbeaver.io/download/)

## Creación de la base de datos
```sql
create role admingrail superuser createdb createrole inherit login replication;
alter user admingrail with password '**********';
```

```sql
create database graildb with owner admingrail;
alter database graildb owner to admingrail;
```