pipeline {
     agent any
     stages {
         stage('Build') {
             steps {
                 sh 'echo "Hello Hany"'
                 sh '''
                     echo "Multiline shell steps works too"
                     ls -lah
                     pwd
                 '''
             }
         }
         stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e index.html'
              }
         }
         stage('Lint Docker file') {
              steps {
              sh 'hadolint Dockerfile'
              }
         }
         stage('Build Docker file') {
              steps {
              sh 'docker build --tag=flasksklearn-hon-capstone .'
              }
         }
         stage('Push Docker Image') {
         withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
             sh 'docker login'
             sh 'docker image tag flasksklearn-hon-capstone hanyslmm/flasksklearn-hon-capstone'  
             sh 'docker push hanyslmm/flasksklearn-hon-capstone'
           }
         }
         stage('Security Scan') {
              steps {
                 aquaMicroscanner imageName: 'hanyslmm/flasksklearn-hon', notCompliesCmd: 'exit 1', onDisallowed: 'success', outputFormat: 'html'
              }
         }
         stage('Upload to AWS') {
              steps {
                  withAWS(region:'us-west-2',credentials:'jenkinsUser') {
                  sh 'echo "Uploading content with AWS creds"'
                      s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'index.html', bucket:'hany-jenk-bucket')
                  }
              }
         }
     }
}
