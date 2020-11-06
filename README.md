# Cloud DevOps Nanodegree Capstone project (Arabity)

## Step 1 (Propose and scope the project)

### About the Project
A flask web application that store info about car services provider in Egypt (Arabity).

### Dependencies
#### 1. AWS account
You would require to have an AWS account to be able to build cloud infrastructure. Particularly, you will need to create S3 buckets, EC2 instances, and IAM users.

#### 2. Install Jenkins on Amazon Linux server
** sudo yum update
* sudo yum install java
* sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
* sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
* yum install jenkins
* sudo systemctl start jenkins
* sudo systemctl enable jenkins
* Install Tidy on linux server. (https://stackoverflow.com/questions/33267133/is-php-tidy-still-available-in-centos-7)
* Install Blue Ocean plugins and Amazon SDK
* Add github token

#### 3. Access S3 Bucket
* Create access key (Access ID & Access Key) on amazon S3 from user/security (https://console.aws.amazon.com/iam/home?region=us-west-2#/users/jenkinsUser?section=security_credentials)
* Add the access key (Access ID & Access Key) to jenkins (http://jenkinsIpAddress:8080/credentials/store/system/domain/_/)
* use the below stage in jenkinsfile:

stage('Upload to AWS') {
     steps {
         withAWS(region:'us-west-2',credentials:'jenkinsUser') {
         sh 'echo "Uploading content with AWS creds"'
             s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'index.html', bucket:'hany-jenk-bucket')
         }
     }
}

#### 4. 

### Choose deployment strategy (Blue/Green deployment)

Deployment strategy is an approach to roll out the updates/changes made in the "live" application. The idea is that the application must not be brought down to introduce the updates. There are a variety of strategies available. Let's assume that there are two versions of the software applications - version A and B. Version B is the updated version.

1. Rolling - Version B is gradually rolled out succeeding version A. This is suitable when the updates are very small, such as bug fixes.
2. Blue/Green - Version B is released alongside version A, then the traffic is switched to version B. This is the preferred model when there are major updates or releasing new features.
3. Canary - Version B is released to a specific subset of users for early feedback and testing, then proceed to a complete rollout.
4. A/B testing - Version B is released to a subset of users under particular conditions.
5. Recreate - Version A is terminated first, and then the version B is rolled out.
6. Shadow - Version B receives real-world traffic alongside version A and doesn’t impact the response.

Make sure that you checkout branches "blue" and "green" to see how blue/green deployment was performed.


### Supporting Links

https://pkg.jenkins.io/redhat/
https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html
