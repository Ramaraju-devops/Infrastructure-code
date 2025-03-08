pipeline {
    agent any

    environment {
        AZURE_CREDENTIALS = credentials('AZURE_CONNECTION')
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                        url: 'https://github.com/Ramaraju-devops/test-repos-demo.git',
                        git branch: 'master',
                        credentialsId: 'Github-Auth'
                }
            }

        }
        stage('Terraform INIT') {
                steps {
                    script {
                            sh '''az login --service-principal -u $AZURE_CREDENTIALS_CLIENT_ID -p $AZURE_CREDENTIALS_CLIENT_SECRET --tenant $AZURE_CREDENTIALS_TENANT_ID
                                az account show
                                cd RG-Creation
                                terraform init
                                '''
                    }
            }
        }
        stage('Terraform Validate') {
                steps {
                    script {
                            sh '''
                                cd RG-Creation
                                terraform validate
                                '''
                    }
            }
        }
        stage('Terraform Plan') {
                steps {
                    script {
                            sh '''
                                cd RG-Creation
                                terraform plan
                                '''
                    }
            }
        }
    }


}