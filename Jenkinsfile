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
                        currentBuild.result = "UNSTABLE"
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

                def summary = "The pipeline ${currentBuild.fullDisplayName} completed with status ${currentBuild.result}."

                // Override default values based on build status
                if (currentBuild.result == 'UNSTABLE') {
                    color = 'YELLOW'
                    colorCode = '#FFFF00'
                } else if (currentBuild.result == 'ABORTED') {
                    color = 'YELLOW'
                    colorCode = '#FFFF00'
                }else if (currentBuild.result == 'SUCCESS') {
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
                // finally{
                //     slackSend ( message: "${currentBuild.result}" )
                // }  
            }
         }
    }
}