pipeline {
    agent any

    tools {
        // Ensure this name matches what you configured in Global Tool Configuration
        nodejs 'Node25.2.1'
    }

    environment {
        // Use forward slashes for compatibility with the 'sh' step
        CYPRESS_CACHE_FOLDER = "${WORKSPACE}/.cypress-cache"
    }

    stages {
        stage('Verify Environment') {
            steps {
                // sh commands use the Unix-style syntax
                sh 'node -v'
                sh 'npm -v'
            }
        }

        stage('Install & Test') {
            steps {
                // We combine commands in one sh block for efficiency
                sh '''
                    npm install
                    npx cypress install
                    npm run runtests
                '''
            }
        }
    }
    
    post {
        always {
            // Good practice: archive reports even if tests fail
            archiveArtifacts artifacts: 'cypress/videos/**/*.mp4', allowEmptyArchive: true
        }
    }
}
