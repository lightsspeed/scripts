// Create a Jenkinsfile to build and deploy a Flask application. Include stages to: (1) clone the repository, (2) install Python dependencies from requirements.txt, (3) run unit tests with pytest, and (4) build a Docker image and push it to Docker Hub. Use a Python 3.11 Docker agent.



pipeline {
    agent {
        docker {
            image 'python:3.11'
            args '-u root'  // Run as root to install tools if needed
        }
    }

    environment {
        DOCKER_IMAGE = 'your-dockerhub-username/your-flask-app'
        DOCKER_TAG = 'latest'
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials' // Jenkins credentials ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                    python -m pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh 'pytest --maxfail=1 --disable-warnings -q'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
                    '''
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
