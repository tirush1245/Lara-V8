pipeline {
    agent any
	environment {
                DB_HOST = 'localhost'
		        DB_PORT = '3306'
                DB_DATABASE = 'laravel'
                DB_USERNAME = 'laravel'
                DB_PASSWORD = 'tiru@123'
            }
    stages {
        stage("Build") {            
            steps {
        		git 'https://github.com/tirush1245/lara8.git'
                sh 'php --version'
                sh 'composer install'
                sh 'composer --version'
                sh 'cp .env.example .env'
                sh 'echo DB_HOST=${DB_HOST} >> .env'
        		sh 'echo DB_PORT=${DB_PORT} >> .env'
                sh 'echo DB_USERNAME=${DB_USERNAME} >> .env'
                sh 'echo DB_DATABASE=${DB_DATABASE} >> .env'
                sh 'echo DB_PASSWORD=${DB_PASSWORD} >> .env'
                sh 'php artisan key:generate'
                sh 'cp .env .env.testing'
                sh 'composer require --dev nunomaduro/larastan'
            
            }
        }
		
        stage("Unit test") {
            steps {
                sh 'php artisan test'
            }
        }
		stage("Code coverage") {
            steps {
                sh "vendor/bin/phpunit --coverage-html 'reports/coverage'"
            }
        }
        stage("Static code analysis larastan") {
            steps {
                
                sh "vendor/bin/phpstan analyse --memory-limit=2G"
            }
        }
        stage("Static code analysis phpcs") {
            steps {
                sh "vendor/bin/phpcs"
            }
        }
                
// 		stage('Deploy') {
//             steps { 
                
// 		        sh 'chmod -R 777 /var/jenkins_home/workspace'					
//                 sh 'rsync -avz . root@ec2-43-204-19-233.ap-south-1.compute.amazonaws.com:/var/www/websites/Lara-V9'				

//                   }
// 		   }
    }
}

