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
        stage('Terraform init') {
            steps {
                sh '''terraform init \\
                    -input=false \\
                    -backend-config="bucket=develop-tf-states" \\
                    -backend-config="key=infra.tfstate" \\
                    -backend-config="region=us-east-1" \\
                    -backend-config="encrypt=true"'''
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -input=false -compact-warnings -var-file=develop.auto.tfvars -out=tfplan'
            }
        }
        stage('ApprovePlan') {
            steps {
                input "¿Approve Terraform Plan?"
            }
        }
        
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -input=false -compact-warnings -var-file=develop.auto.tfvars -auto-approve'
            }
        }
        stage('Terraform test') {
            when {
                branch 'master'
            }
            steps {
                sh 'echo Master job'
            }
        }
    }
}