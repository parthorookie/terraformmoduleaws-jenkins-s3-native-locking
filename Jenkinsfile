 pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
        AWS_DEFAULT_REGION    = "ap-south-1"
    }

    parameters {
        booleanParam(name: 'APPLY', defaultValue: false, description: 'Run Terraform Apply?')
    }

    stages {

        stage('Checkout Source Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/parthorookie/terraformmodule-aws.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                    terraform init
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                    terraform validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                    terraform plan -out=tfplan
                '''
            }
        }

        stage('Terraform Apply') {
            when {
                expression {
                    return params.APPLY == true
                }
            }
            steps {
                sh '''
                    terraform apply -auto-approve tfplan
                '''
            }
        }
    }
}