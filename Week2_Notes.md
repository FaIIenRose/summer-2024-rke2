# Week 2 Steps/Instructions
Summary: This week we explored using GitHub and git, specifically repositories and branches. We also set up MFA for our IAM users, as well as use commands to install updates.

+ Remote is refering to GitHub, and local refers to the os in your instance. 

## Setting Up MFA for IAM Users
Login as you usually do, and head to settings to set up MFA with an authenticator on your phone. 

## Create your branch in our repo: rke2-kubeflow
1. Navigate to branches from our repository page on GitHub.
2. Click New branch, name your branch, and Create new branch.
    + For examples, my branch is named Jyan9

## Connect to the remote repository
1. Make sure git is installed: $git --version
2. Create local repo: $git init 
3. Go to GitHub and get the Git URL of the repo
4. Connect to the remote repo: git remote add origin https://github.com/jawhster/rke2-kubeflow.git
    + Notice the .git after the Git URL

## Switch to your newly created branch
1. Fetch from the remote repository: $git fetch
    + This ensures that the latest changes are downloaded
2. Check for your branch: $git branch -a
3. Create a local branch and switch to it: $git switch -c Jyan9 origin/Jyan9
    + You only need to do this the first time, next time you need to switch to the branch, just do $git switch Jyan9

## Create a file with Week 1 instructions
1. Create a .md file: $vim Week1Notes.md
    + .txt vs .md - Both are plain text files, however .md allows text formating and can be converted to HTML, while .txt doesnt.
2. How to use vim:
    + Edit: "i"
    + Leave editor: press "esc"
    + Save: leave editor and ":w" 
    + Quit without saving: ":q"
    + Save & Quit: ":wq"

## Pushing the file into the repo/branch
1. Add your file/changes to the staging area: $git add Week1Notes.md
    + Staging area is a file in the git directory, and it stores info on what will go into the next commit.
2. commit your file/changes: $git commit -m "message on what changes were made"
    + Commit, captures a snapshot of the current staged changes.
    + $git reset --HEAD : will reset current branch to the most recent commit
3. Once you've done everything and made your changes, you can push the commited files from your local repo to the remote repo.
    + $git push -u origin Jyan9

## Running install commands
1. Exit and stop the instance.
2. Scale up the instance to t2.xlarge
3. Start and reconnect to the instance
4. Run the commands in RKE2 Rancher Setip v2.docx file
5. Once finished, exit and stop your instance.

(End of Week 2 Instructions)  

# Week 2 Notes
**Container**       
Is a package of software that contains all the necessary elements for an application to run in any environment. 
+ They are lightweight, portable, and can virtualize the os, allowing them to run on dev’s laptops, private data centers, or public clouds.

**Containerization**         
Is a type of visualization where an application’s components/code, are bundled into a small container image and can be run in an isolated user space on the same os.
