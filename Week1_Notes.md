# Week 1 Steps/Instructions
Summary: We got started with the project this week, by logging into AWS and explore the world of instances.

## Getting Started with AWS
1. Log into AWS and change the default password to your personal password. 
2. Explore the AWS Console, and locate the EC2 dashboard/instances.
3. Create a EC2 instance:
    - Name: Jy-rke2serverkf
    - Quick Start: Ubuntu 
    - Following the requirements for your project, adjust the AMI & instance type accordingly.

## Creating a Key pair
A Key Pair is a set of security credentials, consisting of public and private keys that prove your identity when connecting into an instance.

1. Make a name for your Key pair, this will be for the public and private key.
2. Pick the type according to your os
    - In this case, we are using RSA
3. Choose a private key file format:
    - For OpenSSH use .pem (this is what we are using)
    - For PuTTY use .ppk
4. Create the key Pair (Private key will download automatically)

## Using Security Groups
Security Groups control traffic using inbound and outbound rules.
1. You can use the existing security group (already created by Justin)
    - Make sure to change the source to your IPv4 address, /16 for security reasons 
2. Creating a security group
    - Create the name of your security group
    - Create the inbound/outbound rules, making sure to include your IPv4 address/16

## SSH Into the EC2 Instance
1. Open terminal, and make sure you can locate your .pem file.
    - You can move the .pem file into your home directory, or find the file path.
2. change the permissions of your .pem file via. $chmod 400 (Keypair name).pem
3. Locate public IPv4 of instance, and ssh into it.
    - If .pem file is in home: $ssh -i JYan9KeyPair.pem ubuntu@(Public IPv4)
    - If using file path: $ssh -i (file path).pem ubuntu@(Public IPv4)
4. Once you successfuly ssh into the instance, explore with different commands, exit, and stop the instance.

## GitHub
- Create a GitHub account.
- Accept the invite for "rke2-kubeflow" repo.

(This Concludes Week 1 Instructions)

# Week 1 Notes
**Kubernetes Cluster**      
A set of computing nodes (worker machines) that run containerized applications. 
- They allow for applications to be more easily developed, moved, & managed. They allow containers to run across multiple machines & environments. They aren’t restricted to a specific os (unlike VMs)
- Minimum of one master node & worker node for a Kubernetes cluster to operate.
- They are made up of one master node (server node), and a number of worker nodes. These nodes could be virtual or physical, depending on the cluster.
- Master node controls the state of the cluster, like which apps are running and their corresponding container images. It’s the origin for all task assignments: 
    - Scheduling/Scaling applications, Maintaining a cluster’s state, and Implementing updates
    - Worker nodes run these applications, and preform the tasks assigned by Master nodes (Can be VMs or physical computers). 

**Server nodes**        
Run services/back end applications that access data on shared external disks.

**Key Pair**        
Consisting of a public and private key, a key pair is a set of security credentials that prove your identity when connecting to an EC2 instance.
    - It allows you to securely SSH into your instance.
    - The public key can be used on multiple instances. While you have the private key on your computer.

**Security Groups**         
Controls the traffic that is allowed to reach and leave resources associated with it. 
- When Creating a VPC (Virtual Private Cloud) it has a default security group. However you can create your own security groups with their own inbound and outbound rules.
    - You can specify the source, port range, and protocol for each inbound rule; and specify the destination, port range, and protocol for each outbound rule.

