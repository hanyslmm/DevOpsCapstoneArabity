# Cloud DevOps Nanodegree Capstone project (Arabity)

## Step 1 (Propose and scope the project)

### About the Project
A flask web application that store info about car services provider in Egypt (Arabity).

### Dependencies
#### 1. AWS account
You would require to have an AWS account to be able to build cloud infrastructure. Particularly, you will need to create S3 buckets, EC2 instances, and IAM users.

#### Install Jenkins on Linux server

* sudo yum update
* sudo yum install java
* sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
* sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
* yum install jenkins
* sudo systemctl start jenkins
* sudo systemctl enable jenkins
* Install Tidy on linux server.

### Choose wether Rolling Deployment or Blue/Green deployment

* Blue/Green branch corresponds to the Blue/Green deployment strategy. Make sure that you checkout branches "blue" and "green" to see how blue/green deployment was performed.


### Supporting Links

https://pkg.jenkins.io/redhat/
