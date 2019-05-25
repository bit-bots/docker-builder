pipeline {
    agent any

    stages {
    stage('Build') {
        steps {
            sh 'docker build -t bitbots_builder --no-cache .'
        }
    }

    stage('Publish') {
        steps {
            sh 'docker tag bitbots_builder localhost:5000/bitbots_builder'
            sh 'docker push localhost:5000/bitbots_builder'
        }
    }
    }

    post {
        cleanup {
            sh 'docker container prune -f'
        }
    }
}