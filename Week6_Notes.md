# Week 6 Instructions   
This week, we deployed our python application on our RKE2 cluster on our EC2 server instance.

## GitHub: pulling an updated file from the main branch into your branch
1. Make sure you’re up to date: $ git pull
2. Make sure your branch is active: $ git checkout Jyan9
3. Checkout the folder/file you want to add to your branch: $ git checkout main Week4

## Installing Docker & Dockerizing the application
Create Dockerfile for this app (python code) to create docker container image. 
1. Install docker on your EC2 instance: $ sudo su - then install docker $ apt install docker.io
2. Create a docker file to dockerize the application: $ vim Dockerfile 

``` Dockerfile
FROM python:3.8
WORKDIR /code
COPY requirements.txt .
ENV PYTHONUNBUFFERED=1
RUN pip install -r requirements.txt
COPY quotes.py .
CMD [ "python", "./quotes.py" ]
```

3. Create Docker account.
4. Run docker build command to create docker image: $ docker build -t AwwJessica/python-quotes:v0.0.1 . 

>  Make sure to run the command in the directory where the Dockerfile is located. 

5. Login to the docker account you created: $ docker login 
    + If you had set up mfa on the docker account you will have to create a personal access token, and login with that as your password.
6. Upload the Docker image onto DockerHub: $ docker push awwjessica/python-quotes:v0.0.1
7. Run the application in docker: $ docker run -it --rm awwjessica/python-quotes:v0.0.1 

## Save your docker image and upload it to summer2024 AWS S3 bucket         
> Typically we would make this easier by using the aws command, however we ran into issues with using aws, so we will save the image on our instance, securely copy it onto our local computer and upload it from there. 
1. save your docker image: docker save awwjessica/python-quotes:v0.0.1 > jy-quotes.tar
+ It will take a while to save. If you were wondering, a .tar file is similar to a .zip file.       
2. In your local terminal/powershell/command prompt: 

> $ scp -i JYanEc2KeyPair.pem ubuntu@34.203.157.43:~/jy/jy-quotes.tar jy-quotes.tar         

+ Secure Copy Protocol (SCP) is a secure file transfer network protocol
+ The "~/jy/jy-quotes.tar" is the file path of the file you want to transfer (Use $pwd to find the current directory filepath). 
+ The jy-quotes.tar after that is the name of the file you want on your local computer.
+ If you want this file in a specific directory on your local computer, make sure to $cd into the desired directory before running the scp command.

3. Once it's done downloading to your local computer, go to AWS console, search for S3, and scroll towards the bottom of the list for "Summer2024-s3" bucket.
+ We won't have access to the other buckets becuase of principle of least privilage: we only need to access the resources we need to accomplish our task.

4. Go to upload and you can drag the .tar file into the bucket (This is going to take a minute to upload).  


## Run the application in kubernetes cluster, through pod deployment      
1. Create a manifest.yaml file to deploy:

``` manifest.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: summer2024-python-app
  labels:
    app: quotes
spec:
  replicas: 1
  selector:
    matchLabels:
      app: quotes
  template:
    metadata:
      labels:
        app: quotes
    spec:
      containers:
      - name: quotes
        image: awwjessica/python-quotes:v0.0.1
```

> in our manifest file, the line: "replicas: 1" is how many nodes we will be deploying our application on. 

2. Deploy the app in the kubernetes cluster: $ kubectl apply -f manifest.yaml

> Troubleshooting: If you see kubectl error “The connection to the server localhost:8080 was refused,” make sure environment variable set with export KUBECONFIG=/etc/rancher/rke2/rke2.yaml

3. Once you've successfully run the application, git add, commit, and push your files to your branch.
4. Then, create a pull request to merge your files to the main branch. 
 
# Troubleshooting and more
+ If you wanted to scp a file into your instance from your local computer:
> scp -i JyanEC2KeyPair.pem /localpath/my-file.txt ubuntu@34.203.157.43:/instancepath/


