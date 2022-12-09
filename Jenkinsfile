pipeline{
    agent any
    
    stages{
        stage('Git Checkout'){
            steps{
                git 'https://github.com/incharacr/project-app.git'
            }
        }
	
	stage('Docker Deploy'){
            steps{
                ansiblePlaybook credentialsId: 'dev-server', disableHostKeyChecking: true, installation: 'ansible', inventory: 'dev.inv', playbook: 'deploy-docker.yml'
            
            }
        }

stage('Email-notifications'){
            steps{
                emailext attachLog: true, body: 'Email sent from Jenkins', subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', to: 'incharacr.ramesh@gmail.com'
            }
        }
        
        
    }
}
