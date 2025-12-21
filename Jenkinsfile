pipeline {
    agent any

    tools {
        nodejs 'Node25.2.1'
    }

    environment {
        // Use backslashes for Windows paths
        CYPRESS_CACHE_FOLDER = "${WORKSPACE}\\.cypress-cache"
    }

    stages {
        stage('Verify Environment') {
            steps {
                // 'bat' works natively on Windows without extra configuration
                bat "node -v"
                bat "npm -v"
            }
        }

        stage('Install & Test') {
            steps {
                bat """
                    npm install
                    npx cypress install
                    npm run runtests
                """
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'cypress/videos/**/*.mp4', allowEmptyArchive: true
        }
    }
}