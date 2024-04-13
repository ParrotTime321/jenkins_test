pipeline {
    agent any
    stages {
        stage("docker login") {
            steps {
                echo " ============== docker login =================="
                withCredentials([usernamePassword(credentialsId: 'a272b958-4f28-87ef-cdd02b722f7d', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    script {
                        def loginResult = sh(script: "docker login -u $USERNAME -p $PASSWORD", returnStatus: true)
                        if (loginResult != 0) {
                            error "Failed to log in to Docker Hub. Exit code: ${loginResult}"
                        }
                    }
                }
                echo " ============== docker login completed =================="
            }
        }
        stage('Step1') {
            steps {
                echo " ============== docker APACHE =================="
                sh 'docker build -t eisgraus/apache:v3 .'
                sh 'docker run -d -p 8448:80 eisgraus/apache:v3'
                sh 'docker push eisgraus/apache:v3'
                echo " ============== docker APACHE completed ! =================="
            }
        }
    }
}
