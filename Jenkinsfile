pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                git 'https://github.com/tirush1245/Lara-V9.git'
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
                sh 'rsync -avz . root@ec2-3-111-168-44.ap-south-1.compute.amazonaws.com:/var/www/websites/Lara-V9'				
			}
		 }
    }        
}
