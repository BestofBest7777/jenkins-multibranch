pipeline {
    agent any

    tools {
        nodejs "node-18"
    }

    environment {
        PORT = "${env.BRANCH_NAME == 'main' ? '3000' : '3001'}"
        IMAGE_NAME = "${env.BRANCH_NAME == 'main' ? 'nodemain' : 'nodedev'}:v1.0"
        CONTAINER_NAME = "react-container-${env.BRANCH_NAME}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo "Tests would run here"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                script {
                    sh """
                        if [ \$(docker ps -q -f name=$CONTAINER_NAME) ]; then
                            docker stop $CONTAINER_NAME || true
                            docker rm $CONTAINER_NAME || true
                        fi
                    """
                }
            }
        }

        stage('Run New Container') {
            steps {
                sh "docker run -d -p $PORT:$PORT --name $CONTAINER_NAME $IMAGE_NAME"
            }
        }
    }
}

