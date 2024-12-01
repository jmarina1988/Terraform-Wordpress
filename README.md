# AWS-Terraform-Wordpress-PostgreSQL-ASG
AWS-Terraform-Wordpress-PostgreSQL-ASG
Trabajo Final Bootcamp de Cloud Despliegue de un WordPress en Alta Disponibilidad con Terraform en AWS Este repositorio contiene un flujo de trabajo básico para desplegar un entorno de WordPress en alta disponibilidad en AWS utilizando Terraform. La configuración está orientada a facilitar la gestión y despliegue de recursos, permitiendo ejecutar los comandos de Terraform de forma más sencilla.

🚀 Funcionalidades Automatización con Terraform: Comandos para inicializar, validar, planificar, aplicar y destruir recursos en AWS con Terraform. Gestión de recursos en AWS: Configuración para despliegue de redes, bases de datos, almacenamiento y más.

Se utilizo Postgre SQL como medio de uso de la base de datos
Redist para gestion de la Cache
EFS para almacenamiento de archivos completamente elástico y sin servidor.

Despliegue de un WordPress en Alta Disponibilidad con Terraform en AWS
Este repositorio contiene un flujo de trabajo básico para desplegar un entorno de WordPress en alta disponibilidad en AWS utilizando Terraform y Makefile. La configuración está orientada a facilitar la gestión y despliegue de recursos, permitiendo ejecutar los comandos de Terraform de forma más sencilla.

🚀 Funcionalidades
Automatización con Makefile: Comandos para inicializar, validar, planificar, aplicar y destruir recursos en AWS con Terraform.
Gestión de recursos en AWS: Configuración para despliegue de redes, bases de datos, almacenamiento y más.
Reportes de costos: Generación de reportes de costos con Infracost para visualizar el impacto financiero de la infraestructura antes de su implementación.

Arquitectura

📋 Requisitos
Terraform instalado.
AWS CLI configurado con perfiles de autenticación.
AMI Configurada con los sgt comandos
yum install php-cli php-pdo php-fpm php-json php-mysqlnd php-pgsql php-xml php-gd php-curl php-zip php-mbstring -y 
wget https://github.com/PostgreSQL-For-Wordpress/postgresql-for-wordpress/archive/refs/tags/v3.3.1.zip
unzip v3.3.1.zip
wget https://es.wordpress.org/wordpress-6.6.2-es_ES.zip
unzip wordpress-6.6.2-es_ES.zip
cp -rp wordpress/* /var/www/html
rm -rf wordpress
rm -rf wordpress-6.6.2-es_ES.zip
cd postgresql-for-wordpress-3.3.1/
mv pg4wp /var/www/html/wp-content/
cd /var/www/html/wp-content/pg4wp
cp db.php /var/www/html/wp-content
cd /var/www/html
cp wp-config-sample.php wp-config.php
sudo chmod -R 755 /var/www/html

📂 Estructura del Repositorio
La estructura del repositorio organiza los recursos por tipo para una fácil navegación:

🔧 Configuración Inicial
1. Clonar el repositorio
Primero, clona el repositorio en tu máquina local:

git clone https://github.com/jmarina1988/Terraform-Wordpress.git

⚙️ Uso
Inicializar el entorno
Inicializa Terraform para configurar los plugins necesarios.


📢 ¡Sígueme y Apóyame!
Si encuentras útil este repositorio y quieres ver más contenido similar, ¡sígueme en LinkedIn para estar al tanto de más proyectos y recursos!

LinkedIn
https://www.linkedin.com/in/javier-manuel-mari%C3%B1a-alarc%C3%B3n-aa3866312/
Si deseas apoyar mi trabajo, puedes invitarme a un café. ¡Gracias por tu apoyo!



