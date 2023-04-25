pipeline {
    agent any
    tools{
        maven 'M2_HOME'
    }
    environment {
    registry = '706159635359.dkr.ecr.us-east-1.amazonaws.com/digital-currency'
    registryCredential = 'jenkins-ecr'
    dockerimage = ''
  }
    stages {
        stage('Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/rodkuitch/currencyapp.git'    
            }
        }
        stage('Code Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Build Image') {
            steps {
                script{
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy image') {
            steps{
                script{
                    docker.withRegistry("https://"+registry,"ecr:us-east-1:"+registryCredential) { 
                        dockerImage.push()
                    }
                }
            }
        }
    }
}