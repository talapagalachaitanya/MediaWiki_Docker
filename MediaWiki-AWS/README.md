# Deploy MediaWiki on AWS 


The scripts are to assist in deploying MediaWiki on AWS EC2 and RDS. Mediawiki deployment is done using Elastic Beanstalk.

The deployment scripts create a complete dedicated VPC, and RDS service, S3 storage and the deployment in Elastic Beanstalk (EB).

## Summary
In the VPC 4 subnets are created and spread over 2 Availability Zones. 2 subnets are public internet facing and will be used by Elastic Beanstalk to deploy the Load Balancer and the web server instance(s). 2 subnets are private and used for RDS to provision the MySQL database. The source code is uploaded to S3 as zip file, EB is able to use this zip file on S3 to deploy the application in the instances it creates.




