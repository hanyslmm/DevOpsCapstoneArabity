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
           steps {
             withDockerRegistry([url: "", credentialsId: "hanyslmmDocker"]) {
             sh 'docker login'
             sh 'docker image tag flasksklearn-hon-capstone hanyslmm/flasksklearn-hon-capstone'
             sh 'docker push hanyslmm/flasksklearn-hon-capstone'
           }
         }
         }
         stage('Security Scan') {
              steps {
                 aquaMicroscanner imageName: 'hanyslmm/flasksklearn-hon-capstone', notCompliesCmd: 'exit 1', onDisallowed: 'success', outputFormat: 'html'
              }
         }

         stage('Deploy Container') {
              steps {
                  withAWS(region:'us-west-2',credentials:'jenkinsUser') {
                  sh 'aws eks update-kubeconfig --name flasksklearn-hon-capstone'
                  sh 'hostname'
                  sh 'which kubectl'
                  sh 'kubectl config use-context arn:aws:eks:us-east-2:796848775042:cluster/flasksklearn-hon-capstone'
                  sh 'kubectl apply -f deployment/deployment.yml'
                  }
              }
         }

         stage('Upload to AWS Bucket') {
              steps {
                  withAWS(region:'us-west-2',credentials:'jenkinsUser') {
                  sh 'echo "Uploading content with AWS creds"'
                      s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'index.html', bucket:'hany-jenk-bucket')
                  }
              }
         }


     }
}
