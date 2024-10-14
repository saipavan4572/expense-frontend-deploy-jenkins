pipeline {
    agent {
        label 'AGENT-1'
    }
    options {
        //timeout(time: 5, unit: 'SECONDS')
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()  // it will not allow concurrent builds
        ansiColor('xterm')
    }
    parameters {
        string(name: 'appVersion', defaultValue: '1.0.0', description: 'What is the application version?')
    }
    environment{
        def appVersion = '' //variable declaration
        nexusUrl = 'nexus.pspkdevops.online:8081'
        // region = "us-east-1"
        // account_id = "315069654700"
    }
    stages {

        stage('print the version'){
            steps{
                script{
                    echo "Application version: ${params.appVersion}"
                }
            }
        }
        stage('Inti'){
            steps{
                echo 'this is terraform init stage!!!'
                sh """
                    cd terraform
                    terraform init
                """
            }
        }
        stage('Plan'){
            steps{
                echo 'this is terraform plan stage!!!'
                sh """
                    cd terraform
                    terraform plan -var="app_version=${params.appVersion}"
                """
            }
        }
        stage('Deploy'){
            steps{
                echo 'this is terraform apply stage!!!'
                sh """
                    cd terraform
                    terraform apply -auto-approve -var="app_version=${params.appVersion}"
                """
            }
        }

    }

    post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir()     // workspace has to be deleted after every build to avoid issues for next builds
        }
        success { 
            echo 'I will say Hello only when it is success!'
        }
        failure { 
            echo 'I will say Bye when it is failed!'
        }
    }

}