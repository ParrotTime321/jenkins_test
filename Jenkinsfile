pipeline {
    agent any
    stages {
        stage('Docker Login') { 
            steps {
                script {
                    dockerLogin()
                }
            }
        }

        stage('Git clone') {
            steps {
                script {
                    sh "git clone git@github.com:ParrotTime321/jenkins_test.git"
                }
            }
        }
        
        stage('Step1') {
            steps {
                echo " ============== docker APACHE =================="
                sh 'cd /jenkins_test'
                sh 'docker build -t ievolved/kindofteam:v${BUILD_NUMBER} .' 
                sh 'docker run -d -p 8448:80 ievolved/kindofteam:v${BUILD_NUMBER}'
                sh 'docker push ievolved/kindofteam:v${BUILD_NUMBER}'
                echo " ============== docker APACHE completed ! =================="
            }
        }
    }
}
def dockerLogin() {
    withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
        sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin"
    }
}
