def batFile = 'kubernetes_deploy.bat'
pipeline{
    agent any
    environment { 
        groovyHome = tool name: 'Groovy', type: 'hudson.plugins.groovy.GroovyInstallation'
    }
    stages{
        stage('Initialize'){
            steps{
                script{
                    println "Initializing..."
                    withCredentials([usernamePassword(credentialsId: 'secret_test', passwordVariable: 'password', usernameVariable: 'user')]) {
                        bat groovyHome+'/groovy UpdateSecretFile.groovy my-secret.yaml '+user+' '+password
                    }
                    
                    //def batFile = 'kubernetes_deploy.bat'
                    def templateFileText = readFile 'kubernetes_deploy_template.bat'
                    def props = readProperties file:'kubernetes_deploy.properties'
                    
                    println 'Template File text:'
                    println templateFileText
                    println '---------------'
                    
                    props.each{entry -> 
                       println entry.key + ':'+entry.value
                       templateFileText = templateFileText.replaceAll(entry.key, entry.value)
                    }
                    
                    withCredentials([string(credentialsId: 'my_bluemix_apikey', variable: 'api_key')]) {
                        templateFileText = templateFileText.replaceAll('API_KEY', api_key)
                        
                    }
                    
                    //println templateFileText
                    bat 'del '+batFile
                    writeFile file: batFile, text: templateFileText

                    //bat batFile
                }
            }
        }
        stage('Deploy'){
            steps{
                echo 'Deploying...'
                bat batFile
            }
        }    
    }
}

