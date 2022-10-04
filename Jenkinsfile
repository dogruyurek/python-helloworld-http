pipeline {
    agent any

    stages {
        stage('Complie') {
            steps {
                echo "compile not required...";
            }
        }        
        stage('Build') {
            steps {
                sh "docker build -t my-python-http .";
            }
        }
        stage('Test') {
            steps {
                sh "docker run -it -p 6666:6666 -e PORT=6666 --name=my-ptyhon-http-server -d my-python-http:latest";
                sh "curl -v http://localhost:6666";
                sh "docker stop my-ptyhon-http-server";
                sh "docker remove my-ptyhon-http-server";
            }
        }
        stage('Push') {
            steps {
                sh "docker login -u alidogruyurek -p dckr_pat_OuFUmfPwTbw0b3iGymNDNVWpL20";
                sh "docker tag my-python-http:latest alidogruyurek/python-httpserver:latest";
                sh "docker push alidogruyurek/python-httpserver:latest";
            }
        }        
    }
}
