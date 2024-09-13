# Week 3 Notes
The top portion will be notes about the topics discussed in meetings and research from questions that pop up throughout the project. The bottom portion will be notes from modules 1 and 2 of the AWS Builder Course.

## Elastic IPs (EIP)
Designed for cloud computing, an elastic IP is a static IPv4 address for AWS
+ Just like how elastics return to its original shapes, an instance with a EIP will have the same IPv4 address even after being restarted or stopped.
+ Once you've attatched an EIP to a instance, you can access the instance over the internet.

## Instance Types: Horizontal v. Vertical Scaling
Horizontal & vertical scaling are two ways you can get more computing power or capacity.
+ Horizontal Scaling (scaling out)
    + You get additional capacity in a system by adding more instances to your environment. This is because you're sharing the processing & memory load accross devices.
+ Vertical Scaling (scaling up)
    +You're adding more computing power to pre-existing instances/nodes. 
> This is what we did in week 3 when we changed the instance type to: t2.medium  

## High Availability 
Meaning a system, component, or application can run at a high level and continuously for a given time. To have high availability, you have to:
+ Design the system so that it has no single point of failure
    + Ex. Having multiple instances/nodes and clusters, so if one fails the other can take over.
+ Correctly test availability: Running an application for a long, planned period of time. Then collect and assess the data to test system availability.
+ Preparing procedures to respond to, mitigate, and recover from failure.


# Week 3 - Module 1 & 2 Notes   
These are notes from Modules 1 & 2 of the AWS builder course. This is a summary of what was mentioned in the videos as well as the notes.

## client-server model  
Is a transaction between a client and a server. Where the client makes a request and the server evaluates the details of the request, then fulfills said request.
+ A client can we a web-browser, or a desktop application that you/others interact with to make request to computer servers.
+ A server can be services like Amazon Elastic Compute Cloud (EC2) a virtual server, or a physical server/computer.

Coffee Shop Example:    
A customer wants to order a coffee, the barista processes the request, takes payment, and goes to make the coffee. In this case the client is the customer, and the server is the barista. The client makes a request, which the server processes, validates the request (the payment), and executes the request by making the coffee. 

## Key Concept of AWS   
You only pay for what you use, meaning when you’re not using or don’t need any instances, you don’t have to pay for them. 
+ Applying the Coffee Shop example: We only need to pay the baristas when they are working, so if it’s a slow day at the coffee shop, you can just get rid of some baristas and don’t have to pay them. (Realistically I’m sure this wouldn’t happen, but for the sake of this example…)

## Amazon Cloud Computing   
Cloud computing means having IT resources that are easily accessible, whenever you want for whatever you want, over the internet; with pay as you go pricing. 
+ This makes AWS and any cloud computing service have a type of flexibility that would be very hard to manage on your own data center. You could start, stop, and terminate any of your instances whenever and wherever you want.

### Three cloud computing development models    
When picking a cloud strategy, a company needs to look at their needs:
+ What cloud application components are required?
+ What are the preferred resource management tools?
+ Are there any legacy infrastructure requirements?

**Cloud-Based Deployment**
Migrating existing applications, or designing & building new applications to/for the cloud. Where you can run all the parts of applications in the cloud. 
+ You can build the applications on low or high level infrastructures.
	+ low-level infrastructures requires the IT staff to manage the applications.
	+ high-level infrastructures reduces management, architecting, and scaling requirements of the core infrastructure.

> A good example of when to use this is when a company is creating an application consisting of virtual servers, databases, and networking components fully based in the cloud. 

**On-Premise Deployment**   
Also known as private cloud deployment, resources are deployed on premise via virtualization and resource management tools. 
+ This model of cloud deployment increases resource utilization by using application management and virtualization technologies.

> You would use on-premise deployment when you may have applications that run on technology that’s fully kept in an on-premise data center. 

**Hybrid Deployment**    
Where cloud-based resources are connected to on-premise infrastructures. Hybrid deployment also allows you to integrate cloud-based resources with legacy IT applications.

> This would be useful if you have legacy applications that are maintained on premise, or government regulations require you to keep certain records on premise. 
Another example would be if a company wants to use cloud services, however they have several legacy applications that are more suitable on premise and aren’t suitable for the cloud. With hybrid deployment, they would be able to keep legacy applications on premise, while also taking advantage of cloud services.

## Benefits of Cloud Computing      
+ Trading upfront expenses for variable expenses: Instead of investing in physical servers, databases, and data centers, before you know how you’re going to use them. You can just pay for the resources you actually use.     
+ Save money and time on running, maintaining, and managing data centers.
+ No need to guess or try to predict how much infrastructure capacity you’ll need. 
+ Increase speed and agility: Flexibility makes it easier to develop and deploy applications.
+ Global Access: You can deploy applications to customers around the world quickly, while providing low latency. 

## Amazon Elastic Compute Cloud (EC2)   
They are very flexible, cost effective, and quick, while building and getting your own data center started, gets pretty expensive, isn’t as flexible, and takes a pretty long time. While EC2 servers are already established, secure, and ready to use online. 

When starting an instance, you’re sharing the host machine with multiple other instances(VMs). A hypervisor running on the host machine is responsible for sharing the physical resources between the Virtual Machines (VM).

**Multitenancy**    
The idea of sharing underlying hardware between Virtual Machines, where a hypervisor running on the host machine is responsible for sharing the physical resources between the Virtual Machines (VM).
+ The hypervisor is responsible for isolating the VM from each other, meaning they are unaware of each other, despite sharing resources from the same host. This means the instances are secure.

## EC2 Configurations
When you provision an EC2 instance, you can configure and choose exactly what you want on your instance:    
+ The Operating system: Windows and Linux
+ What Software: Business Apps, Web Apps, Databases, or third-party softwares.
+ What Size/Resize: you can configure your instance size by vertically and horizontally scaling your instance.
+ Networking: You can decide what type of request make it to your server, and whether something is private or publicly accessible. 

## How EC2 Works
+ Launch: You launch your instance, selecting a template with basic configurations and adjusting them to your needs. You can also specify your security settings, deciding what traffic can flow in and out of your instance. 
+ Connect: You can connect to your instance in different ways. In this project, we are connecting to the instance via secure shell (SSH), which uses cryptography to encrypt connection between devices. 
+ Use: Once you’ve connected, you can begin using the instance; running commands, installing software, add storage, copy & Organize files, and many other functions. 

## EC2 Instance Types 
Using our coffee shop example from before, in order to run a coffee shop efficiently, you need workers with different skill sets. You can have an easier, a barista, someone great with latte art, or a worker focused on making sandwiches and pastries. Each employee skill set, suits their role. 

> Same way the coffee shop has different types of employees, there are different types of EC2 instances that you can deploy into your AWS environment.

## Instance Families
Instance types are sorted into instance families, which are optimized for certain types of tasks. 
Different Instance Families and what they are used for:
+ General Purpose Instances: Provide a balance of compute, memory, and networking resources, and can be used for diverse workloads such as:
    + web services
    + code repositories
    + application servers, gaming servers, backend servers for enterprise applications, and small-medium databases. 
+ Compute Optimized Instances: For compute-bound applications that benefit from high-performance processors like:
    + compute intensive tasks, gaming servers, high performance computing (HPC), or scientific modeling.
+ Memory Optimized Instances: Designed for fast performance, for workloads that process large datasets in the memory (temp. Storage area). You use memory optimized instances to: 
    + Perform real-time processing of large amounts of unstructured data
    + They also enable you to run workloads with high memory needs and provide great performance. 	
+ Accelerated Computing Instances: For floating point num. calculations, or graphics processing, data pattern matching, which all utilize hardware accelerators.
    + Hardware accelerators preform some functions more efficiently than software running on CPUs
    + Ideal for workloads like graphics applications, game streaming, and application streaming.
+ Storage Optimized Instances: For workloads that require high read and write access to large datasets on local storage, ie. high performance for locally stored data.
    + Input/output operations per second (IOPS) measures the performance of a storage device.
    + An input operation is data you put into a system. An Output operation is data generated by the server.

Going back to our coffee shop example. Cashiers are memory optimized instances, baristas are compute optimized instances, and the latte artists are accelerated computing instances.

## EC2 Pricing Options
+ On-Demand - Only pay for how long you run your instance. Not recommended for workloads that last more than a year.
+ Savings Plans - Low prices on EC2 usage (up to 72% off of usage), in exchange for a commitment to consistent amount of usage, measured by dollar amount per hour, for a 1 or 3 year term, regardless of the configurations.
    + Ex. $5 per hour, any usage beyond that will be charged a regular rate.
+ Reserved Instances - For steady state workloads or ones with predictable usage, offers up to 75% discount when you commit to a 1 or 3 year terms. With 3 different payment options. If not instances aren’t terminated or Reserved Instance term isn’t renewed, you will be charged on-demand rates.
    + However, unlike Savings plans, you will need to specify the configurations like instance type and size, OS, and Tenancy. Because of this there are Standard and Convertible reserved instances. 
    + Standard, you cannot change the instance configurations. Convertible you can for a lower discount)
+ Spot Instances - Request spare EC2 computing capacity for up to 90% off, but they can reclaim the instance whenever they need to, giving a 2 min warning.
+ Dedicated Host - Physical server host with EC2 instance capacity fully dedicated for your use.

## Instance Scalability and Elasticity  
Scalability means only using the resources you need, by responding to changing demand by vertically and horizontally scaling. 
+ Auto Scaling: AWS has Amazon EC2 Auto Scaling, which automatically adds or removes instances, to respond to the change in demand. There are two ways of auto scaling:
    + Dynamic scaling - responds to changing demand
    + Predictive scaling - automatically scheduled the right number of instances based on the predicted demand.

> You can use both dynamic and predictive scaling to scale faster.

+ Auto Scaling Group: You will have a minimum number of instances (Minimum capacity), you need at least one, and a maximum number of instances. You can scale out to the desired capacity, and once you no longer need said instances, you can scale back into the minimum.
    + Minimum Capacity - Number of EC2 instances that launch immediately after creating a Auto Scaling Group.
    + Maximum Capacity - You can scale out, but only to the preset max amount of instances.

## Elastic Load Balancing (ELB)
An AWS Service that automatically distributes incoming application traffic, to multiple resources (EC2 Instances). In short, to evenly split workload to the multiple instances.
+ Load Balancer - Single point of contact for all incoming web traffic to the auto scaling group
+ ELB is a regional construct, meaning since it runs on the region level rather than individual EC2 instances, it’s automatically highly available.
+ ELB is also automatically scalable. Meaning it’s designed to handle growing traffic with no change in cost.
+ EC2 Auto scaling works with ELB to communicate and adjust to the increase in traffic. 
    + When there are more instances from auto scaling out, it will communicate with ELB and ELB will adjust to the changes. 
+ When EC2 instances automatically scale in, ELB pauses all new traffic, and waits for existing request to complete before Auto scaling terminates the instances, then continues to distribute traffic to remaining instances.
+ ELB can also distribute requests from front end to back end instances, this makes to not only faster, but also simplifies communication between instances when auto scaling (decouple architecture)

Coffee shop Example for ELB     
During a low demand period, you only need one or a few registers to comply with the demands of customers. During High-demand periods, when there are a lot of customers, you’ll need more registers, and a host to direct them to go to which register, so there isn’t a long line at just one register. In this case, the instances are the registers, and load balancer (ELB) is the host.

## Monolithic Applications & Microservices
A monolithic application is an architecture with tightly coupled components (one fails they all fail). In order to maintain availability, you can design through a microservices approach; when the components are loosely coupled, where there are services and components that fulfill different functions. 
+ Applications send messages to each other to communicate. If an application is sending a message to another that isn’t available, it’s either stuck waiting there, or has to drop the request. This is the result of a tightly coupled architecture, where if a single component fails or changes it causes the whole system to fail.

## Amazon Simple Notification Service (Amazon SNS)
A publish/subscribe service, where publishers publishes messages to subscribers. 
+ coffee shop ex: Cashier gives orders to barista who makes the drink.What happens when the barista is busy making an order, and the cashier has to wait? The order either gets dropped, so the cashier can take care of customers or time is wasted waiting. 

## Amazon Simple Queue Service (Amazon SQS)
Allows you to send, store, and receive messages between software components at any volume without losing messages or require other services to be available. 
+ Payload is the Data contained within a message, which is protected until delivery. 
+ Amazon SNS queues are where messages are placed until processed

Coffee shop example for SQS         
Cashier sends orders to the board and it’s deleted once the barista has made it. In this case, the coffee orders are the messages, while the order board is the queue, and the order information being the payload.

## Amazon SNS topic 
SNS can also send notifications to end users using publish/subscribe service. You can create a Amazon SNS topic, which is a channel for messages to be delivered.
+ You can then configure subscribers to that topic and publish messages to be sent to all subscribed. 
+ In our coffee shop example, we could send notifications to let them know when their coffee is ready. 

## Additional Compute Services
Although EC2 is Flexible, Reliable, and Scalable, they require you to set up and manage your instances over time. Like setting up, updating, and managing your instances. 
+ Serverless Compute options. Your code runs on servers that you don’t need to provision or manage. You cannot see or access the underlying infrastructure hosting your applications, and all the managing components are already taken care of. 
+ AWS Lambda - Allows you to upload code to Lambda function, configure a trigger, and when the trigger is detected the code is automatically run in a managed environment. meaning you never have to deal with the environment at all, its auto scaled, highly available, and management is done by AWS.
+ Container Orchestration Tools - Tools to help you monitor and manage containers across a cluster of instances.
    + In this case this is a docker container. Docker uses OS level virtualization to deliver software in containers which is a package for your code. Containers run on top of EC2 instances (more about containers in Week 2)
    + Examples: Elastic Container Services (ECS) or Elastic Kubernetes Service (EKS)
    + ECS is designed to run containerized applications at scale, without having to manage your own Orchestration software. EKS does the same thing, with different tools and features.
+ AWS Margate - Serverless compute platform for ECS or EKS

**Which Do I Use?**     
EC2 when hosting traditional applications and want full access to the OS (Linux, Windows, ect). AWS Lambda when hosting short running functions, service oriented or event driven applications, and don’t want to worry about managing servers.
+ If you want to run docker container based workloads, do you wanna use ECS or EKS? Then what platform do you want to use to run containers on? EC2 instances that you manage or Fargate, which is managed for you.

