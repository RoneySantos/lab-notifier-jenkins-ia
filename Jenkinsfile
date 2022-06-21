#!groovy
// Jenkinsfile (Declarative Pipeline)
DOCKER_IMAGE = 'hub.docker.com/_/nginx'
pipeline {
    agent any

    options { 
          skipDefaultCheckout()
          disableConcurrentBuilds()
          parallelsAlwaysFailFast()
    }
    stages {
        stage('Build') {
            steps {
                sh '''
                cat /etc/os-release
                echo Building
                '''

                sh '''
                echo Segunda parte do step Build
                '''
            }
        }
        stage('Test') {
            steps {
                sh 'ls -la'             
            }
        }
        stage('Deploy') {
            steps {
                sh 'ls -la'
                echo 'Deploying....'
            }
        }
    }
    post{
        always {
            // slackSend(channel: "notificacoes", message: "Teste @joseroneysilvasantos", sendAsText: true)
            try{
            notifyBuild(currentBuild.result)
            }

            def notifyBuild(String buildStatus = 'STARTED') {
            // build status of null means successful
            buildStatus =  buildStatus ?: 'SUCCESSFUL'

            // Default values
            def colorName = 'RED'
            def colorCode = '#FF0000'
            def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
            def summary = "${subject} (${env.BUILD_URL})"

            // Override default values based on build status
            if (buildStatus == 'STARTED') {
                color = 'YELLOW'
                colorCode = '#FFFF00'
            } else if (buildStatus == 'SUCCESSFUL') {
                color = 'GREEN'
                colorCode = '#00FF00'
            } else {
                color = 'RED'
                colorCode = '#FF0000'
            }

            // Send notifications
            slackSend (color: colorCode, message: summary)
            }
        }
    }
}

