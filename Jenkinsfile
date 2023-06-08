pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                git 'https://github.com/tirusoma/lara8.git'
//                 sh 'composer install'
                sh 'cp .env.example .env'
//                 sh 'php artisan key:generate'                                 
                
            }
        }
        stage('Test') {
            steps {
                sh './vendor/bin/phpunit'
            }
        }
//         stage('Deploy') {
//             steps {
			    
//                 sh 'chmod -R 777 /var/lib/jenkins/workspace'					
//                 sh 'rsync -avz . root@ec2-3-111-168-44.ap-south-1.compute.amazonaws.com:/var/www/websites/Lara-V9'				
// 			}
// 		 }        
//     }
    
//     post{
//         success {
//            emailext (
//             subject: "Build Successful",
//             body: "Laravel build succeeded! See $BUILD_URL for details.",
//             to: "tirusoma84@gmail.com,tirush.cherry@gmail.com",
//             mimeType: 'text/html',
//             attachLog: true,
//             compressLog: true,
//             replyTo: 'tirush.cherry@gmail.com'
//           )
//         }
//         failure {
//           emailext (
//             subject: "Build Failed",
//             body: "Laravel build failed! See $BUILD_URL for details.",
//             to: "tirusoma84@gmail.com,tirush.cherry@gmail.com",
//             mimeType: 'text/html',
//             attachLog: true,
//             compressLog: true,
//             replyTo: 'tirush.cherry@gmail.com'
//           )
//         }
//      } 
    
}
