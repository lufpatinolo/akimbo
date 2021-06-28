pipeline {
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')        
    }    
    agent any
        triggers {
            githubPush()
        }
    options {
        ansiColor('xterm')
    }
    stages {
        stage('Git Checkout') {
            steps {
                git credentialsId: 'git_token', 
                url: 'https://github.com/lufpatinolo/akimbo.git'
            }
        }
        stage('Terraform init Prod') {
            when {
                branch 'master'
            }
            steps {
                sh '''terraform init \\
                    -input=false \\
                    -backend-config="bucket=develop-tf-states" \\
                    -backend-config="key=infra.tfstate" \\
                    -backend-config="region=us-east-1" \\
                    -backend-config="encrypt=true"'''
            }
        }
        stage('Terraform init Stg') {
            when {
                branch 'staging'
            }
            steps {
                sh '''terraform init \\
                    -input=false \\
                    -backend-config="bucket=develop-tf-states" \\
                    -backend-config="key=infra.tfstate" \\
                    -backend-config="region=us-east-1" \\
                    -backend-config="encrypt=true"'''
            }
        }
        stage('Terraform init Dev') {
            when {
                branch 'develop'
            }
            steps {
                sh '''terraform init \\
                    -input=false \\
                    -backend-config="bucket=develop-tf-states" \\
                    -backend-config="key=infra.tfstate" \\
                    -backend-config="region=us-east-1" \\
                    -backend-config="encrypt=true"'''
            }
        }
        stage('Terraform Plan Prod') {
            when {
                branch 'master'
            }
            steps {
                sh 'terraform plan -input=false -compact-warnings -var-file=develop.auto.tfvars -out=tfplan'
            }
        }
        stage('Terraform Plan Stg') {
            when {
                branch 'staging'
            }
            steps {
                sh 'terraform plan -input=false -compact-warnings -var-file=develop.auto.tfvars -out=tfplan'
            }
        }
        stage('Terraform Plan Dev') {
            when {
                branch 'develop'
            }
            steps {
                sh 'terraform plan -input=false -compact-warnings -var-file=develop.auto.tfvars -out=tfplan'
            }
        }
        stage('ApprovePlan') {
            steps {
                input "¿Approve Terraform Plan?"
            }
        }
        
        stage('Terraform Apply Prod') {
            when {
                branch 'master'
            }
            steps {
                sh 'terraform apply -input=false -compact-warnings -var-file=develop.auto.tfvars -auto-approve'
            }
        }
        stage('Terraform Apply Stg') {
            when {
                branch 'staging'
            }
            steps {
                sh 'terraform apply -input=false -compact-warnings -var-file=develop.auto.tfvars -auto-approve'
            }
        }
        stage('Terraform Apply Dev') {
            when {
                branch 'develop'
            }
            steps {
                sh 'terraform apply -input=false -compact-warnings -var-file=develop.auto.tfvars -auto-approve'
            }
        }
    }
    post { 
        always { 
            cleanWs()
        }
    }
}

