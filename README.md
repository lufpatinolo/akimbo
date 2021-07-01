## Fundación Bolivar Davivienda
# Repositorio de la Infraestructura como Código para FBD (Terraform), configurado para la Infraestructura de AWS.


# Prerequisitos

- Terraform 0.12.19 installed (installation guide: https://learn.hashicorp.com/terraform/getting-started/install.html)

# Ejecutando el código

- Inicializando los módulos y providers en Terraform

terraform init \
   -input=false \
   -backend-config="bucket=develop-tf-states" \
   -backend-config="key=infra.tfstate" \
   -backend-config="region=us-east-1" \
   -backend-config="encrypt=true"
   
   
- Validar el código de la infraestructura

terraform validate



- Crear el plan en Terraform

terraform plan -input=false -compact-warnings -var-file=develop.auto.tfvars -out=tfplan



- Aplicar el plan de la infraestructura

terraform apply -input=false -compact-warnings -var-file=develop.auto.tfvars -auto-approve



# Estructura código
- __FBD_IAC__
   - [Jenkinsfile](Jenkinsfile)
   - [README.md](README.md)
   - [backend.tf](backend.tf)
   - [develop.auto.tfvars](develop.auto.tfvars)
   - [lambda.zip](lambda.zip)
   - [main.tf](main.tf)
   - [outputs.tf](outputs.tf)
   - [provider.tf](provider.tf)
   - [variables.tf](variables.tf)
   - __src__
     - __modules__
       - __ec2__
         - [alb.tf](src/modules/ec2/alb.tf)
         - [bastion.tf](src/modules/ec2/bastion.tf)
         - [output.tf](src/modules/ec2/output.tf)
         - [security\_groups.tf](src/modules/ec2/security_groups.tf)
         - [variables.tf](src/modules/ec2/variables.tf)
       - __ecs__
         - [ecs\_cluster.tf](src/modules/ecs/ecs_cluster.tf)
         - [variables.tf](src/modules/ecs/variables.tf)
       - __frontend__
         - [cloudfront\-dev.tf](src/modules/frontend/cloudfront-dev.tf)
         - [cloudfront\-prod.tf](src/modules/frontend/cloudfront-prod.tf)
         - [lambda\_edge\_index.tf](src/modules/frontend/lambda_edge_index.tf)
         - [lambda\_edge\_redirect.tf](src/modules/frontend/lambda_edge_redirect.tf)
         - [lambda\_edge\_scHeaders.tf](src/modules/frontend/lambda_edge_scHeaders.tf)
         - [output.tf](src/modules/frontend/output.tf)
         - [s3\-dev.tf](src/modules/frontend/s3-dev.tf)
         - [s3\-prod.tf](src/modules/frontend/s3-prod.tf)
         - [variables.tf](src/modules/frontend/variables.tf)
       - __iam__
         - [main.tf](src/modules/iam/main.tf)
         - [output.tf](src/modules/iam/output.tf)
       - __network__
         - [main.tf](src/modules/network/main.tf)
         - [output.tf](src/modules/network/output.tf)
         - [variables.tf](src/modules/network/variables.tf)
       - __route53__
         - [output.tf](src/modules/route53/output.tf)
         - [route53.tf](src/modules/route53/route53.tf)
         - [variables.tf](src/modules/route53/variables.tf)

Para crear o modificar un recurso se debe ubicar el archivo .tf en la carpeta /src/modules/ y allí en la subcarpeta correspondiente, teniendo en cuenta de crear o modificar las variables del recurso dentro de cada carpeta y dentro de las variables globales que están en la raíz del repositorio, estas variables globales las utiliza el main.tf y la definición de estas variables irá en los .tfvars 

Jenkins Akimbo:
http://34.200.93.230:8080/
User: admin
Pass: Akimbo*2021
