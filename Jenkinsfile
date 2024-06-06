pipeline {
    agent any
    environment {
        WORKDIR = '/home/ubuntu'
    }
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
                dir("${WORKDIR}") {
                    script {
                        try {
                            sh "git clone git@github.com:ParrotTime321/jenkins_test.git"
                        } catch (Exception e) {
                            echo "Git clone failed, but continuing the pipeline"
                        }
                    }
                }
            }
        }

        // stage('Step1'){
        //     steps {
        //         script {
        //             sh 'sudo chmod -R 755 /home/ubuntu/jenkins_test'
        //             sh 'sudo chown -R jenkins:jenkins /home/ubuntu/jenkins_test'
        //         }
        //     }
        // }
        stage('Step2') {
            steps {
                dir("${WORKDIR}/jenkins_test") {
                    script {
                        echo " ============== docker APACHE =================="
                            sh 'pwd'
                            // sh 'docker build -t ievolved/kindofteam:v${BUILD_NUMBER} .'
                            // sh 'docker run -d -p 8448:80 ievolved/kindofteam:v${BUILD_NUMBER}'
                            // sh 'docker push ievolved/kindofteam:v${BUILD_NUMBER}'
                        echo " ============== docker APACHE completed ! =================="
                    }
                }
            }
        }
    }
}
def dockerLogin() {
    withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
        sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin"
    }
}
