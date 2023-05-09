
Para trabajar con workspaces el primer paso es listar los workspaces con el comando: 
Terraform workspace list
este comando nos mostrara todos los workspaces de nuestro proyecto y resaltado con un asterisco (*) el workspace en el cual estamos trabajando.

Para seleccionar un workspace ejecutamos el comando terraform workspace select + el nombre del workspace. 
El workspace en el cual estamos ubicados se resalta por un asterisco 
 
Para ejecutar el terraform plan lo hacemos de la siguiente manera:
identificamos idenfificamos el workspace en el que nos encontramos con el comando terraform workspace show
 
Seguidamente identificamos el directorio y el archivo de variables que vamos a utilizar en la estructura de nuestro proyecto, para efectos de ejemplo utilizaremos UAT
 
Para ejecutar el terraform plan lo hacemos de la siguiente manera:
terraform plan -var-file="UAT/terraform-uat.tfvars" 

para el ambiente de desarrollo el comando seria el siguiente:
terraform plan -var-file="Dev/terraform-dev.tfvars"

y para producción utilizamos:
terraform plan -var-file="Production/terraform-prod.tfvars"
