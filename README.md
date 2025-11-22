# starfleet-prueba-competencial-juanluisbermejo
Repositorio para las activida competencial

# README MODULO DE INGENIERIA-USSR COMPETENTIAL

# PRIMERA MISION 

## 1 Registro de Entrada — Personalización del Sistema

### Pedia editar el mensaje de bienvenida (MOTD).

#### Se cambio el mensaje de bienvenida, no exactamente como se pedia, el mensaje de la hora actual no se cambio.

#### El resto se podia cambiar desde 

(sudo nano /etc/motd)

## 2 Instalación del Núcleo de Servicios

### Se instala apache

sudo apt install apache2

### Se instala mysql y se asegura la instalacion 

sudo apt intall mysql-server

mysql_secure_installation

#### En caso de que no deje ponerle contraseña a root

alter user 'root'@'localhost' identified with mysql_native_password by 'Largavidayprosperidad1*';

### Se instala PHP

sudo apt install php libapache2-mod-php php-mysql

### Para asegurarse que han sido instalados los servicios y la version

sytemctl status apache2
sytemctl status mysql

php -v



## 3 Configuracion de firewall

### UFW que permita ssh, http y https

sudo apt install ufw
sudo ufw enable
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw default deny incoming
sudo ufw default allow outgoing

### EL script, el json y el index para el status del firewall estan al final de  (esta en conjunto con la parte 4) 

## 5 Github

### *Este repositorio*



# SEGUNDA MISION 

## Instalar docker  

sudo apt install docker.io

## Hubo problemas con el internet el dia de la instalacion asi que hubo que eliminar algunas cosas de la instalacion, luego hacer un update y upgrade y continuar la instalacion otro dia

## Instalar las imagenes

### Las imagenes estan en la carpeta de secreto

### Seguir la guia de la carpeta secreto para instalar configurar y levantar la base de datos y el wordpress

## Hay una ultima imagen que hay que pullear de dockerhub que es la de apache2:latest

### una vez levantado hay que crear una imagen de ese apache al que le hemos metido el index

# MISION OCULTA

## Es una mision engañosa que te pide repetir todo lo anterior, y a parte hacer un readme de todo ello (este mismo readme).

### Si ya se ha hecho todo la mision esta cumplida

# Errores encontrados 

## no hacer sudo su para crear los scripts

### no se le dan los permisos correctos y por tanto cuando apache intenta pedir los datos a ufw no tiene los permisos correctos para ejecutar los comandos aun que se le den permisos con chmod 

## El script crea el json mal y en la segunda linea crea 2 'inactive' en vez de uno, solo hay que eliminar un y ya funcionara
