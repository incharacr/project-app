pipeline{
    agent any
    tools {
        maven 'maven-3.8.6'
	    terraform 'terraform-1.3'
    }
    
    stages{
        stage('SCM Checkout'){
            steps{
                git ''
            }
        }
        
        stage('Maven Build'){
            steps{
                sh 'mvn clean package'
            }
         }
         
        stage('Docker Build'){
            steps{
                sh 'docker build -t incharacr/project-app:0.0.1 .'
            }
        }
        
        stage('DockerHub push'){
            steps{
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
                sh 'docker login -u incharacr -p ${dockerHubPwd}'
                }
                
                sh 'docker push incharacr/project-app:0.0.1'
            }
        }
        
        stage('Terraform Init'){
            steps{
                sh 'terraform init'
            }
        }
        
        stage('Terraform Apply'){
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
        
        
        
    }
}
