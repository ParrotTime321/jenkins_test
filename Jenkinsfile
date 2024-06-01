pipeline {
    agent any
    stages {
        stage("docker login") {
            steps {
                echo " ============== docker login ==================" // credentialsId = name of your credentials id in Jenkins
                withCredentials([usernamePassword(credentialsId: 'xxxxxx', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
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
                sh 'docker build -t xxxxxx .' 
                sh 'docker run -d -p 8448:80 xxxxxx' // change "xxxxxx"
                sh 'docker push xxxxxx'
                echo " ============== docker APACHE completed ! =================="
            }
        }
    }
}
