pipeline {
    agent any

    // environment {
    //     AZURE_CREDENTIALS = credentials('AzureServicePrincipal2')
    //     ARM_CLIENT_ID = credentials('azure-client-id')
    //     ARM_CLIENT_SECRET = credentials('azure-client-secret')
    //     ARM_SUBSCRIPTION_ID = credentials('azure-subscription-id')
    //     ARM_TENANT_ID = credentials('azure-tenant-id')
    // }

    stages {
        // stage('Checkout') {
        //     steps {
        //        script {
        //             git branch: 'master',
        //                 credentialsId: 'Github-connection',
        //                 url: 'https://github.com/Ramaraju-devops/test-repos-demo' 
        //        }
        // }
        // }
        
        // stage('az login'){
        //     steps{
        //     azureCLI commands: [[exportVariablesString: '', script: 'az login --service-principal -u $AZURE_CREDENTIALS_CLIENT_ID -p $AZURE_CREDENTIALS_CLIENT_SECRET --tenant $AZURE_CREDENTIALS_TENANT_ID'], [exportVariablesString: '', script: '']], principalCredentialId: 'AzureServicePrincipal2'
        //     }
        // }

        // working block
        // stage('testing') {
        //     steps {
        //        script {
        //             sh '''az login --service-principal -u $AZURE_CREDENTIALS_CLIENT_ID -p $AZURE_CREDENTIALS_CLIENT_SECRET --tenant $AZURE_CREDENTIALS_TENANT_ID
        //                   az account show
        //                   cd RG-Creation
        //                   terraform init'''
        //        }
        // }
        // }
    

        stage('Terraform Init') {
            steps {
                sh '''pwd
                    cd RG-Creation
                    ls -l'''
            }
        }

        // stage('Terraform Plan') {
        //     steps {
        //         sh '''cd RG-Creation
        //             terraform plan -out=tfplan'''
        //     }
        // }

        // stage('Terraform Apply') {
        //     steps {
        //         sh '''pwd
        //             cd RG-Creation
        //             terraform apply tfplan'''
        //     }
        // }
    }

    post {
        always {
            cleanWs()
        }
    }
}

