pipeline {
    agent any

    stages {
        stage('Complie') {
            steps {
                sh "whoami";
            }
        }        
        stage('Build') {
            steps {
                sh "docker build -t getting-started .";
            }
        }
    }
}
