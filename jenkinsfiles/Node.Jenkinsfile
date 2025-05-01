// Write a Jenkinsfile for a Node.js application. The pipeline should have stages to: (1) check out the code from Git, (2) install dependencies with npm install, (3) run tests with npm test, and (4) build the app with npm run build. Use a Node.js Docker agent (node:20).


pipeline {
    agent {
        docker {
            image 'node:20'
            // Use container's /home/node as workspace
            args '-v /tmp:/tmp -u root'
        }
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Check out code from Git repository
                checkout scm
                
                // Show information about the environment
                sh 'node --version'
                sh 'npm --version'
                sh 'pwd'
                sh 'ls -la'
            }
        }
        
        stage('Install Dependencies') {
            steps {
                // Install dependencies using npm
                sh 'npm ci'
            }
        }
        
        stage('Test') {
            steps {
                // Run tests
                sh 'npm test'
            }
        }
        
        stage('Build') {
            steps {
                // Build the application
                sh 'npm run build'
            }
        }
    }
    
    post {
        always {
            // Clean up workspace
            cleanWs()
        }
        success {
            echo 'Build completed successfully!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}