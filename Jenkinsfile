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
         stage('Security Scan') {
              steps {
<<<<<<< HEAD
                 aquaMicroscanner imageName: 'aquasec/microscanner', notCompliesCmd: 'exit 1', onDisallowed: 'fail', outputFormat: 'html'
=======
                 aquaMicroscanner imageName: 'hanyslmm/flask_arabity', notCompliesCmd: 'exit 1', onDisallowed: 'fail', outputFormat: 'html'
>>>>>>> dce0fc32971f1945a5a6d4cec61bd8b7e6b24128
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
