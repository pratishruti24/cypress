pipeline {
    agent {
        dockerfile {
            // Jenkins will automatically look for the 'Dockerfile' in your repo,
            // build it, and run these stages inside the resulting container.
            filename 'Dockerfile'
            // Optional: If your Docker daemon is on a different server/port
            // args '-u root' 
        }
    }

    environment {
        // Linux paths use forward slashes /
        CYPRESS_CACHE_FOLDER = "${WORKSPACE}/.cypress-cache"
    }

    stages {
        stage('Verify Environment') {
            steps {
                // We use 'sh' because Docker containers are typically Linux
                sh "node -v"
                sh "npm -v"
            }
        }

        stage('Run Tests') {
            steps {
                // Since your Dockerfile already does 'npm install', 
                // you only need to run the tests here.
                sh "npm run runtests"
            }
        }
    }

    post {
        always {
            // Keep the results even if tests fail
            archiveArtifacts artifacts: 'cypress/videos/**/*.mp4', allowEmptyArchive: true
        }
    }
}