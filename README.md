
[![CircleCI](https://circleci.com/gh/hanyslmm/DevOpsCapstoneArabity.svg?style=svg)](https://circleci.com/gh/hanyslmm/DevOpsCapstoneArabity)

# Cloud DevOps Nanodegree Capstone project (Arabity)

## Step 1 (Propose and scope the project)
## Step 2: Use Jenkins, and implement blue/green
## Step 3: Pick AWS Kubernetes as a Service, or build your own Kubernetes cluster.
## Step 4: Build your pipeline
## Step 5: Test your pipeline

### About the Project
A flask web application that store info about car services provider in Egypt (Arabity).

#### Choose deployment strategy (Blue/Green deployment)

Deployment strategy is an approach to roll out the updates/changes made in the "live" application. The idea is that the application must not be brought down to introduce the updates. There are a variety of strategies available. Let's assume that there are two versions of the software applications - version A and B. Version B is the updated version.

1. Rolling - Version B is gradually rolled out succeeding version A. This is suitable when the updates are very small, such as bug fixes.
2. Blue/Green - Version B is released alongside version A, then the traffic is switched to version B. This is the preferred model when there are major updates or releasing new features.
3. Canary - Version B is released to a specific subset of users for early feedback and testing, then proceed to a complete rollout.
4. A/B testing - Version B is released to a subset of users under particular conditions.
5. Recreate - Version A is terminated first, and then the version B is rolled out.
6. Shadow - Version B receives real-world traffic alongside version A and doesn’t impact the response.

Make sure that you checkout branches "blue" and "green" to see how blue/green deployment was performed.

### Dependencies and Work details
#### 1. AWS account
You would require to have an AWS account to be able to build cloud infrastructure. Particularly, you will need to create S3 buckets, EC2 instances, and IAM users.

#### 2. Install Jenkins on Amazon Linux server
* sudo yum update
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

#### 4. Install Aqua MicroScanner on Jenkins linux server

* Install Aqua MicroScanner plugin
* Create Aqua MicroScanner access token from https://microscanner.aquasec.com/
* Docker must be installed on the same machine Jenkins is installed.
* Install Docker on Jenkins linux server (sudo yum install docker)
* sudo usermod -aG docker jenkins
* In Jenkins, select Manage Jenkins, then select Configure System.
*   steps {
     aquaMicroscanner imageName: 'hanyslmm/flasksklearn-hon', notCompliesCmd: 'exit 1', onDisallowed: 'success or fail', outputFormat: 'html'
  }

#### 5. Install Circleci:
* wget https://github.com/CircleCI-Public/circleci-cli/releases/download/v0.1.11458/circleci-cli_0.1.11458_linux_amd64.tar.gz
* gunzip circleci-cli_0.1.11458_linux_amd64.tar.gz
* cd circleci-cli_0.1.11458_linux_amd64/ | ./circleci | circleci update | alias circleci='/home/ec2-user/circlePath/circleci'

#### 6. Install Hadolint:
* wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
* sudo chmod 777 usr/bin/hadolint
#### 7. Create Docker ML App:
a Machine Learning Microservice API. We are given a pre-trained, sklearn model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on.
  1. Test project code using linting
  1. Complete a Dockerfile to containerize this application
  1. Deploy containerized application using Docker and make a prediction
  1. Improve the log statements in the source code for this application
  1. Configure Kubernetes and create a Kubernetes cluster
  1. Deploy a container using Kubernetes and make a prediction

#### 6. Create High Availability Web App Using AWS CloudFormation:
##### A. Develop Infrastructure Diagram
##### B.


### Supporting Links

https://pkg.jenkins.io/redhat/

https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html

https://github.com/jenkinsci/aqua-microscanner-plugin

https://docs.ansible.com/ansible/latest/index.html

https://www.lucidchart.com/pages/

https://stackoverflow.com/questions/8724939/how-to-move-jenkins-from-one-pc-to-another

https://linuxconfig.org/how-to-install-docker-in-rhel-8
