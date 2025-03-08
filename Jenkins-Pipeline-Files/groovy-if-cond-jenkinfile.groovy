pipeline {
agent any  
parameters {  
    booleanParam(name: 'INCLUDE_DEBUG', defaultValue: false, description: 'Include debug information in the deployment')  
}  
stages {  
    stage('Build') {  
        steps {  
            script {  
                if (params.INCLUDE_DEBUG) {  
                    echo 'Debug information will be included in the deployment.'  
                    // Add steps to include debug information  
                } else {  
                    echo 'Debug information will NOT be included in the deployment.'  
                    // Proceed without debug information  
                }  
            }  
        }  
    }  
}  
}