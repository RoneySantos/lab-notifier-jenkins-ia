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
                script {
                    try {
                        sh '''
                        cat /etc/os-release
                        echo Building
                        '''

                        sh '''
                        echo Segunda parte do step Build
                        '''
                    }catch (err) {
                        echo err.getMessage()
                    } 
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    try {
                        sh 'ls -la'
                    }catch (err) {
                        echo err.getMessage()
                    } 
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    try {
                        sh 'ls -la'
                        echo 'Deploying....'
                    }catch (err) {
                        echo err.getMessage()
                    } 
                }
            }
        }
    }
    post{
        always {
            script {
                // Default values to Build status
                // def colorName = 'RED'
                // def colorCode = '#FF0000'
                // def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
                def summary = "The pipeline ${currentBuild.fullDisplayName} completed successfully."

                // Override default values based on build status
                if (currentBuild.result == 'STARTED') {
                    color = 'YELLOW'
                    colorCode = '#FFFF00'
                } else if (currentBuild.result == 'SUCCESS') {
                    color = 'GREEN'
                    colorCode = '#00FF00'
                } else {
                    color = 'RED'
                    colorCode = '#FF0000'
                }

                try {
                // slackSend(channel: "notificacoes", message: "Teste @joseroneysilvasantos", sendAsText: true)
                // slackSend (color: 'good', message: "The pipeline ${currentBuild.fullDisplayName} completed successfully.")
                slackSend (color: colorCode, message: summary)
                }
                catch(err) {
                    echo err.getMessage()
                }
                finally{
                    slackSend ( message: "${currentBuild.result}" )
                }  
            }
         }
    }
}