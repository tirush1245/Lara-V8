pipeline {

    agent any 

    stages {
        stage('Checkout Codebase'){
            steps{
                checkout scm: [$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[credentialsId: 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMW6aWvm9NAfGZ+3yH7mBDLd699ZHryfe1+Sa2+tzXiJ tirush1245@gmail.com', url: 'git@github.com:tirush1245/lara8.git']]] 
            }
        }

        stage('Build') {
            steps {
                git 'https://github.com/tirush1245/lara8.git'
                sh 'composer install'
                sh 'cp .env.example .env'
                sh 'php artisan key:generate'                                 
                
            }
        }
        stage('Test') {
            steps {
                sh './vendor/bin/phpunit'
            }
        }
        stage('Deploy') {
            steps {
			    sh 'chmod -R 777 /var/lib/jenkins/workspace'							
                sh 'rsync -avz . root@ec2-3-111-168-44.ap-south-1.compute.amazonaws.com:/var/www/websites/Lara-V8'
			}
		 }
		
		
    }
}	
