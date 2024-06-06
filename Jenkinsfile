pipeline {
    agent any
    stages {
        stage('Hello') { // testing if jenkins has a rights for changing dirs
            dir('/home/ubuntu/') {
                steps {
                    echo 'Hello World 2'
                }
            }
        }
        stage('Shell1') {
            steps {
                sh 'ls /etc/netplan'
            }
        }
        stage('Shell2') {
            steps {
                sh 'ls /home/'
            }
        }
    }
}
