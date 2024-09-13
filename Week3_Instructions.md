# Week 3 Steps/Instructions
Summary: This week we re-touched on setting up MFA on our IAM accounts and setting up our GitHub accounts. We then intalled updates for the server node, and set up another instance for our agent node. We also tooked a look at modules 1 & 2 of the MWS Skillbuilder Course, "AWS Cloud Practitioner Essentials", in order to get a better understanding of the essentials.

> Note: When installing, you want to make sure you switch to the root user ($sudo su -)

## Get your commit contributions to display your GitHub  profile
1. Check your email in GitHub: Settings > Emails (on the left hand side) > check the box for “Keep my email addresses private” >  Copy the email they provide (ID#+Username@users.noreply.github.com)
2. Go to the instance and use the command: $git config —global user.email “(paste email)”
3. Check to see if it was done right: $git config —global user.email
+ If done right, the next time you commit to the repo, your GitHub account will be associated with it.

## Complete Installations/Updates For the Server Node
1. Update Existing EC2 instance type to t2.medium
2. SSH into the instance and switch to root user: $sudo su -
3. Complete Steps 1-4 on the "RKE2 Rancher Setup v2.docx"
4. Confirm status of the server node and open a new terminal/command line, while keeping the current one open.

## Complete Installations/Updates For the Agent Node
1. Start a new instance with the same settings as the server node:
+ Name it something that distinguishes it as an agent node.
+ Ubuntu
+ Instance Type: t2.medium
+ Same security group: rke2-security-group
+ Same key pair (for me it would be "JYanKeyPair")
+ Storage Config: 1x32 GiB gp3
2. SSH into the instance with the new terminal/command line window and switch to root user: $sudo su - 
3. Complete steps 1,2, & 6 of the "RKE2 Rancher Setup v2.docx"
+ Make sure you replace the brackets and the information within the brackets in step d. with the correct information.
4. Confirm status of agent node and the server node
5. Exit/Stop both instances.


