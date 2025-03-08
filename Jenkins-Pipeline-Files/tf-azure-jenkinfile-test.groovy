pipeline {
    agent any

    environment {
        AZURE_CREDENTIALS = credentials('AZURE_CONNECTION')
    }

    stages {
        // working 
        stage('testing') {
            steps {
               script {
                    sh '''echo "My client id is $AZURE_CREDENTIALS_CLIENT_ID"
                          echo "My client Secret is $AZURE_CREDENTIALS_CLIENT_SECRET"
                          echo "My tenant id is $AZURE_CREDENTIALS_TENANT_ID"
                          echo "My subscription id is $AZURE_CREDENTIALS_SUBSCRIPTION_ID"'''
               }
        }
     }
     stage('Checkout') {
            steps {
               script {
                    git branch: 'master',
                        credentialsId: 'Github-connection',
                        url: 'https://github.com/Ramaraju-devops/test-repos-demo' 
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
    stage('Terraform PLAN') {
            steps {
              script {
                    sh '''cd RG-Creation
                          terraform plan
                          '''
              }
        }
    }
        stage('Terraform Apply') {
            steps {
              script {
                    sh '''cd RG-Creation
                          terraform apply --auto-approve
                          '''
              }
        }
    }
}
}