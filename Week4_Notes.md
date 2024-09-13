### Week 4 Instructions

#### Install Rancher via Helm

To keep a consistent public IP address when we start/stop our EC2 instance (I believe private IP address already stays the same for the EC2 instance? but need to double check), we obtain an Elastic IP from Amazon's pool and associate it with our RKE2 server EC2 instance.

I use GoDaddy for DNS hosting and assign a domain name to each team member. For the Rancher UI, it requires a domain name (e.g. stormystudy.org, internpass.com, etc.) for the hostname instead of just an IP address.

#### Code a Python application

Last week, we learned about Command Line Editors like vim to create the config.yaml file with server’s private IP address and token to install the agent. This week, use Visual Studio Code (VSCode), PyCharm, IntelliJ, or other IDE or editor like Sublime Text.

1. Understanding the code in quotes.py     

``` quotes.py
import requests
import time

def main():
    api_url = "https://zenquotes.io/api/quotes"

    for i in range(10):
        response = requests.get(api_url)

        if response.status_code == 200:
            data = response.json()
            if data:
                first_item = data[0]
                print(first_item['q'])
            else:
                print("No items in the response")
        else:
            print("API request failed with status code: ", response.status_code)
        time.sleep(10)

if __name__ == "__main__":
    main()
```    

+ In the code, we are making a loop that makes a HTTPS get request to the url that is providing the quotes, using “requests.get(api\_url)”. 
+ It then checks if it was successful, via “response.status\_code == 200”. If it is successful, it’ll parse the JSON content into a list: “data = response.json()”. If the status code is not “200”, it will print an error message. 
+ Then, it will check the data, if it’s not empty it’ll extract the first item from the list, then prints the quote. If it is empty it will print “No items in the response".
+ time.sleep(10) will pause the execution for 10 seconds, this prevents making requests too frequently.

> Essentially, the script repeatedly gets a list of quotes from the ZenQuotes API, prints the first quote, waits 10 seconds between requests, and ensures that the data is present before trying to print a quote. It will also give a message when the API request fails or the data is missing.

2. Test run the file on your local computer: $ python3 quotes.py
+ I’m running a MacBook Air, which runs python 3.9.6, and I kept getting the error that requirements didn’t exist. You have to install requests: $ pip3 install requests. This is why we have pip install of requirements.txt, which has requests, in our Dockerfile.

3. Create a requirements text file with said requirements: $ vim requirements.txt

Complete steps 1 and 2 for Python application code reference from Medium article at https://medium.com/@chroottech/how-to-deploy-python-application-in-docker-kubernetes-1d198f2af2c. Place your .py file and requirements.txt in a directory with your initials. Once complete, git add, commit, and push to your Git branch. Create a Pull Request (PR), also sometimes referred to as a merge request, and add me as a reviewer so I can approve and merge  your code into the main branch.

### Week 4 Notes

Learned that there is a limit of 5 Elastic IPs that can be released from Amazon's pool per AWS account. Therefore, we released or reassociated between team members.

Also learned that instance type matters for installing RKE2 and Rancher. Pods will fail to start (kubectl get pods -A) if there is not enough memory (e.g. t2.small instead of t2.medium).

We also learned about an error related to "Error: Unable to continue with install: PriorityClass "rancher-critical" in namespace "" exists ..." So, resolution was to view helm list, uninstall, and then reinstall. To Do: add more details about error and resolution to be updated.

### AWS Skillbuilder notes

#### Module 3: Global Infrastructure and Reliability
To Do: to be updated

#### Module 4: Networking
To Do: to be updated

### Troubleshooting

Q: I was making updates to Dockerfile but redeploying still didn't show stdout from python print statements when checking kubectl logs <pod name>. 

A: I saw in Rancher that this was because said already had the image. So was using cache instead of new one I pushed to docker hub. So I changed version from python-quotes:v0.0.1 to python-quotes:v0.0.2 to force new image pull.
