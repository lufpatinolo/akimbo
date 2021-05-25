# Fundación Bolivar Davivienda
Repositorio Iac Terraform FBD

├── backend.tf
├── develop.auto.tfvars
├── Jenkinsfile
├── lambda.zip
├── main.tf
├── outputs.tf
├── provider.tf
├── README.md
├── src
│   └── modules
│       ├── ec2
│       │   ├── bastion.tf
│       │   ├── output.tf
│       │   ├── security_groups.tf
│       │   └── variables.tf
│       ├── frontend
│       │   ├── cloudfront-dev.tf
│       │   ├── cloudfront-prod.tf
│       │   ├── lambda_edge_index.tf
│       │   ├── lambda_edge_redirect.tf
│       │   ├── lambda_edge_scHeaders.tf
│       │   ├── output.tf
│       │   ├── s3-dev.tf
│       │   ├── s3-prod.tf
│       │   └── variables.tf
│       ├── iam
│       │   ├── main.tf
│       │   └── output.tf
│       ├── network
│       │   ├── main.tf
│       │   ├── output.tf
│       │   └── variables.tf
│       └── route53
│           ├── output.tf
│           ├── route53.tf
│           └── variables.tf
└── variables.tf

Para crear o modificar un recurso se debe ubicar el archivo .tf en la carpeta /src/modules/ y allí en la subcarpeta correspondiente, teniendo en cuenta de crear o modificar las variables del recurso dentro de cada carpeta y dentro de las variables globales que están en la raíz del repositorio, estas variables globales las utiliza el main.tf y la definición de estas variables irá en los .tfvars 