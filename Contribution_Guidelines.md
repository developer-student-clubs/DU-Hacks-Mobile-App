# Contributing Guidelines for DU-HACKS Mobile App 📱!

Below you will find the process and workflow used to review and merge your contributions.📝

### Step 1 : Find an issue ⚡

- Take a look at the existing Issues or create your **own issues** if you want to show your own creativity or you have some out-of the box ideas!

- Please wait until the issue has been assigned to you before you begin working on it.

- Imp Note : Every modification within this project ought to be accompanied by a related issue.

### Step 2 : Fork the Project to your Github. ⚙️

- Fork this Repository. This will create a Local Copy of this Repository on your Github Profile and then you can start doing changes in that following the below guidelines : 

Keep a reference to the original project in `upstream` remote.  
```bash
git clone https://github.com/<your-username>/<repo-name>  
cd <repo-name>  
git remote add upstream https://github.com/<upstream-owner>/<repo-name>  
```  
- If you have already forked the project, update your copy before working.
```bash
git remote update
git checkout <branch-name>
git rebase upstream/<branch-name>
```  
### Step 3 : Create a New Branch 

Establish a fresh branch and utilize its name to specify the issue you are contributing to.

```bash
# It will create a new branch with name Branch_Name and switch to that branch 
git checkout -b branch_name
```
### Step 4 : Work on the assigned issues. 💻

- Work on the issue(s) assigned to you.
- After you've made changes or made your contribution to the project add changes to the branch you've just created by:

```bash  
# To add all new files to branch Branch_Name  
git add .  

# To add only a few files to Branch_Name
git add <some files>
```
### Step 5 : Done with the changes ? Commit. 

- While making a commit make sure to add proper description of the changes you have made for ease of evaluation of your contribution:
```bash
git commit -m "message"  
```
### Step 6 : Work Remotely

- When your are done with the changes with respect to project conventions, upload your changes to your fork:

```bash  
git push -u origin Branch_Name
```
### Step 7 : Pull Request

- Go to your repository in browser and click on compare and pull requests.
Then add a title and description to your pull request that explains your contribution.  

### Still have doubts?🤔

You can refer to the cheat-sheets of Git and Github for basic commands and over-view and also you can directly contact to the Project Mentors / ask your doubts on GDSC-DDU discord server.

 <br>
Looking Forward to your awesome contributions ! 🚀
