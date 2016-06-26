GIT commands
============

Basic commands
--------------

To give username 
::

	git config --global user.name "username"

To give email 
::

	git config --global user.email "email@email.com"


To Start a project . 
::

	git init project_name 

To get status of project 
::

	git status

To add files into git 
::

	git add filename

To add all files into git 
::
	
	git add . 
	OR
	git add --all .

To remove files from git 
::

	git rm --cached filename

To recursively delete all files in a given folder :
::
	
	git rm --cached -r filename


To commit with message 
::
	
	git commit -m "Message OF Commit "

To get log information 
::

	git log 

To find difference in files 
::

	git diff

or see the cached changes 
::

	git diff --cached

To see changes in one line 
::

	git log --oneline

To do fast commit with addition of changes 
::

	git commit -a -m "message"

To see status in short 
::

	git status -s

To create SSH key 
::

	ssh-keygen -t rsa -C "email"

To check ssh key 
::
	
	ssh -T git@github.com


To connect to remote repository from local repository 
::

	git remote add origin git@github.com:upa8/test.git

.. note:: This is SSH address of your repository.


To push files into our remote repository 
::

	git push origin master 


To see the branches
::
	
	git branch 

To create new branch 
::

	git branch branch_name 

To change branch 
::

	git checkout branch_name 

To clone the remote repository 
::

	git clone (shh link )

To go to commit id 
::

	git reset 12344455555531

To use pull 
::

	git pull origin branch_name


Tagging 
-------
::

	git tag -a version_name -m "Comments"
	git tag 
	git show v1.0

To push tags
::

	git push github v1.0

To push all the tags 
::

	git push github --tag


Reverting & Reset 
-----------------

To go to particular commit 
::

	git checkout commid_id

To go back to current state 
::

	git checkout master


similar for tag 
::

	tag checkout tag_name

It will delete the previous commits 
::

	git reset --hard commit_id

It git revert 
::

	git revert commit_id commit_id
