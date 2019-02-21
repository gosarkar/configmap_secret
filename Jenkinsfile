pipeline{
    agent any
    stages{
        stage('checkout'){
            steps{
                echo 'checkout'
                checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/gosarkar/configmap_secret.git']]]
            }
        }
        stage('update configmap secret'){
            steps{
                script{
                    withCredentials([usernamePassword(credentialsId: 'secret_test', passwordVariable: 'password', usernameVariable: 'user')]) {
                        def encodedUser = user.bytes.encodeBase64().toString()
                        def encodedPassword = password.bytes.encodeBase64().toString()
                        def str = readFile 'my-secret.yaml'
                        str = str.replace('USERNAME', encodedUser)
                        str = str.replace('PASSWORD', encodedPassword)
                        println '==>>'+str
                        bat 'del my-secret.yaml'
                        writeFile file: 'my-secret.yaml', text: str
                        println 'encoded user = '+encodedUser
                        println 'encoded password = '+encodedPassword
                    }
                    
                    def batFile = 'kubernetes_deploy.bat'
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

                    bat batFile
                }
            }
        }
    }
}
