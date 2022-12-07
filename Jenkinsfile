pipeline{
    agent any
    tools {
        maven 'maven-3.8.6'
    }
    
    stages{
        stage('SCM checkout'){
            steps{
                git 'https://github.com/incharacr/addressbook.git'
            }
        }
        
        stage('Maven Build'){
            steps{
                sh 'mvn clean package'
            }
         }
         
        stage('Docker Build'){
            steps{
                sh 'docker build -t incharacr/newapp:0.0.1 .'
            }
        }
        
        stage('DockerHub push'){
            steps{
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
                sh 'docker login -u incharacr -p ${dockerHubPwd}'
                }
                
                sh 'docker push incharacr/newapp:0.0.1'
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
