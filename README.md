# Fundación Bolivar Davivienda
Repositorio Iac Terraform FBD

- __akimbo__
   - [Jenkinsfile](Jenkinsfile)
   - [README.md](README.md)
   - [backend.tf](backend.tf)
   - [develop.auto.tfvars](develop.auto.tfvars)
   - [lambda.zip](lambda.zip)
   - [main.tf](main.tf)
   - [outputs.tf](outputs.tf)
   - [provider.tf](provider.tf)
   - [read.md](read.md)
   - __src__
     - __modules__
       - __ec2__
         - [bastion.tf](src/modules/ec2/bastion.tf)
         - [output.tf](src/modules/ec2/output.tf)
         - [security\_groups.tf](src/modules/ec2/security_groups.tf)
         - [variables.tf](src/modules/ec2/variables.tf)
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
   - [variables.tf](variables.tf)

Para crear o modificar un recurso se debe ubicar el archivo .tf en la carpeta /src/modules/ y allí en la subcarpeta correspondiente, teniendo en cuenta de crear o modificar las variables del recurso dentro de cada carpeta y dentro de las variables globales que están en la raíz del repositorio, estas variables globales las utiliza el main.tf y la definición de estas variables irá en los .tfvars 