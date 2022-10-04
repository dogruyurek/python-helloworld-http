pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh "docker build -t getting-started .";
            }
        }
    }
}
