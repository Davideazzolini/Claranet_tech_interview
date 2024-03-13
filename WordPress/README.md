# Wordpress webapp Infrastructure

Since the cloud provider is AWS, the simplest and best choice to have a uniform configuration management system for the production environment comes up with the suite of cloud managed services from AWS. 

The <em>*["lift and shift"](https://www.ibm.com/topics/lift-and-shift)*</em> strategy is ideal for ensuring one of the fundamental requirements, namely to make the application easily deployable when the workload increases and there is no evidence of load variation. Below the suggested configuration:

## Front-end
<ul>
    <li><em>Elastic Beanstalk</em> to delegate the creation of EC2 instances of Red Hat on which WordPress engine will run. Since it is a ready-made platform it's easy to deploy artifacts. Behind the scenes, takes care of creating load balancers, store app's artifact on <em>S3</em> bucket and manages security groups and key pairs to acces instances.</li>
    <li><em>ELB</em> to take care of forward the requests to the app properly respect to the instances.</li>
    <li><em>S3</em> bucket for upload and store the application's files and bundle artifacts.</li>
    <li><em>Cloud Watch</em>to provide easy rules through alarms to scale in and out based on requirements.
</ul>

The choice of using *[Red Hat Entrerprise Linux instances](https://www.redhat.com/it/technologies/linux-platforms/enterprise-linux/why-choose-red-hat-enterprise-linux-on-aws)* as AMI is necessary for a production environment and for its scalability on AWS.

## Back-end
<ul>
    <li><em>RDS</em>, since it is a PAAS we can easily configure it to manage a <em>MYSQL</em> DB to be up-and-ready at the moment.</li>
    <li><em>ElastiCache</em> service to host a Memcached instances cluster. This helps to retrieve data and associated media accounts faster.</li>
    <li><em>Route 53</em> as DNS to resolve the webapp URL searched by the users to the CloudFront endpoint which will cache the webapp contents.</li>
    <li><em>CLOUDFRONT</em> as content delivery network due to it's conveninience with global audience. This helps to reduce latency and distribute the app around the world.</li>
</ul>
