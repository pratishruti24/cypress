pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            // We pass an empty custom entrypoint because Jenkins needs to 
            // inject its own shell to run the 'sh' steps.
            args '-u root --entrypoint=""'
        }
    }

    environment {
        CYPRESS_CACHE_FOLDER = "${WORKSPACE}/.cypress-cache"
    }

    stages {
        stage('Verify Environment') {
            steps {
                sh "node -v"
                sh "npm -v"
            }
        }

        stage('Run Tests') {
            steps {
                // Option A: If you want to run the shell script exactly as it is:
                sh "/app/entrypoint.sh"
                
                // Option B: If you just want to run the npm command directly:
                // sh "npm run runtests"
            }
        }
    }

    post {
        always {
            // Updated to include screenshots which are very helpful for debugging
            archiveArtifacts artifacts: 'cypress/videos/**/*.mp4, cypress/screenshots/**/*.png', allowEmptyArchive: true
        }
    }
}