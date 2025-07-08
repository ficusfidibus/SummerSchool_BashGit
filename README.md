---
bibliography: ./references.bib
---

Summer\_School\_MDS\_UFZ

Trends in multi-omics data analysis for Microbial Ecology and Biotechnology
===========================================================================

### 1. Introduction
----------------------

The purpose of this repository is for the particpants of the Summer
School of Multi-omics, to have a template of a markdown file and some
examples of Command Line Interface (CLI) and GitHub guidelines.

So let's start with revising what Unix is.

**Unix** is a multi-user multi-tasking operating system developed in the
70' by Ken Thompson, Dennis Ritchie, and others in the AT&T
Laboratories. "The basic design philosophy of UNIX is to provide simple,
powerful tools that can be combined to perform complex tasks. It
features a command-line interface that allows users to interact with the
system through a series of commands, rather than through a graphical
user interface (GUI)":
[GeeksForGeeks](https://www.geeksforgeeks.org/introduction-to-unix-system/)

It's key features are:

-   **Multiuser support** --\> multiple users can simultaneously access
    the same system
-   **Multitasking** --\> can run multiple processes at the same time
-   **Shell scripting** --\> provides a powerful scripting language that
    allows for automation
-   **Security** --\> has a security model utilizing permissions (file,
    user, network)
-   **Portability** --\> can run on a variety of hardware platforms
-   **Process tracking** --\> maintains a record of jobs, that the user
    creates

For these reasons it is quite useful in the field of biology and
microbiology, especially for data analysis, data processing, genomic
alignment and automation.

The term Unix, however does not equal Linux. Linux is a Unix-like
operating system
[kernel](https://www.geeksforgeeks.org/kernel-in-operating-system/)
developed by Linus Torvalds. There are several other open-source
Unix-like kernels available online, for example FreeBSD, NetBSD, etc.

There are 4 main components of a Linux system:

1.  **Linux kernel** --\> Manages hardware and system resources
2.  **GNU** (GNU's Not Unix) software --\> system tools and utilities
    (free in terms of freedom of user to improve and change them)
3.  **Graphical user interface (GUI)** --\> For easier user interaction
4.  **Application software** --\> specific functionality for user tasks

#### Linux distributions

There are several Linux distributions available. They are compiled from
components developed by different organizations of programmers as
open-source projects.

![Figure 1 - Available Linux
Distributions](./01_figures/2024-07-08_Different_linux_distributions.png)

Source:
https://medium.com/swlh/a-perfect-linux-distribution-ca80fe8e443d

#### Bash - Bash Scripting

The term stands for a "Bourne Again Shell". It's a widely used CLI shell
and scripting language in Linux and Unix-like operating systems (OS).
With it, you can interact with the OS and execute various tasks.

#### How to Use Linux Effectively

Understanding Linux and its functionalities is crucial for any
superuser. For a comprehensive guide, refer to "How Linux works: What
every superuser should know" by Brian Ward [@ward2021]. To delve deeper
into command line and shell scripting, "Linux command line and shell
scripting bible" by Richard Blum is an excellent resource [@blum2008].
Additionally, the Guia Linux website offers valuable online resources
[@guialinux]. For kernel-level insights, see "Understanding the Linux
Kernel" by Daniel P. Bovet and Marco Cesati [@bovet2005].

### 2. List of Contents
--------------------------

1 [Introduction](#1-introduction)

2 [List of Contents](#2-list-of-contents)

3 [Example commands](#3-example-commands)

4 [Git Installation and Usage](#4-git-installation-and-usage)

4.1 [Creating a GitHub repository](#41-creating-a-gitHub-repository)

4.2 [Connecting to a remote
repository](#42-connecting-to-a-remote-repository)

4.3 [Pushing and Pulling remote
repositories](#43-pushing-and-pulling-remote-repositories)

4.4 [Branches](#44-branches)

4.5 [GitIgnore](#45-gitignore)

4.6 [Reverting changes](#46-reverting-changes)

5 [References](#references)

------------------------------------
### 3. Example commands

Here you can find some basic commands for interacting with a Linux OS.
Don't copy all the comands in the terminal directly, rather copy them
one by one, and try in practice, what they do.

``` {.sh}
pwd # show current directory
cd ~ # navigate to home directory
cd .. # navigate one directory up
cd ../.. # navigate two directories up, you can add as many as you want, but you might end up in root repository
htop # utility that displays information about the processes that are curently running
date # display date and time
free -m # display informaion about free and used memory
ls # list contents of directory
  -a --> lists all contents of directory, even hidden ones
  -r --> lists in reverse order
  -l --> lists permission on contents
man ls # display manual for ls command (list)
mkdir Summer_School_MSS_UDZ # Create a directory
rmdir Summer_School_MSS_UDZ # remove a directory
# or
rm -r Summer_School_MSS_UDZ # remove a directory
mkdir Summer_School_MDS_UDZ # Create a directory
mv Summer_School_MDS_UDZ/ Summer_School_MDS_UFZ/ # "move" a directory
cd Summer_School_MDS_UFZ # change directory
nano example_file.txt # create and edit a (text) file
history # display recent commands used in the terminal
find <location> <type_of_search> <pattern> # searches for files in a directory
find . -type f -iname "*ple_fi*.*" # find in this directoy, seach for a file, ignore lower and upper case, anything that had ple_fi somewhere in the name of the file
wc # counts lines, words, charachters and files
  -c: counts bytes
  -l: counts lines
  -L: shows the length of the longest line
  -m: counts characters
  -w: counts words
cat example_file.txt # send the contents of one or more files to the standard output or to another file
  less # less standard output
  more # more of the standard output
  head # display first 20 lines (default value) of file, additional usage -<integer_value_of_lines>, e.g. -100 to display first 100 lines
  tial # display last 20 lines (default value) of file, additional usage -<integer_value_of_lines>, e.g. -100 to display last 100 lines
grep # searches for a patter within a file
grep "test" example_file.txt # find "test" in example_file.txt
cp example_file.txt file_example.txt # creates a copy of the file
mv file_example.txt .file_example.txt # command that renames the file and makes it hidden (can be seen with ls -l)
rm .file_example.txt # remove the file
du # display information about disk usage
  -s # show total occupied space (summary)
  -h # display in human readable format
  -sh disk usage information by directory (summary) 
df # display information about free and used space on the system's partitions
clear # clear the terminal output
```

![Figure 2 - Permission
explanations](./01_figures/2024-07-08_permissions_explained.png)

Source:
https://www.digitalocean.com/community/tutorials/an-introduction-to-linux-permissions

-rw-------: A file that is only accessible by its owner

-rwxr-xr-x: A file that is executable by every user on the system. A “world-executable” file

-rw-rw-rw-: A file that is open to modification by every user on the system. A “world-writable” file

drwxr-xr-x: A directory that every user on the system can read and access

drwxrwx---: A directory that is modifiable (including its contents) by its owner and group

drwxr-x---: A directory that is accessible by its group

You can also combine commands using the pipe symbol "\|" in bash
scripting like this

``` {.sh}
find . -name "*.txt" | wc -l # number of files ending with .txt 
find . -name "*.txt" | grep "file" | wc -l # number of times "file" is found in files with .txt extension
find . -name "*.txt" -exec realpath {} + >> realpaths_to_file.txt # find all absolute paths of files with .txt extension, and write them out in a new file called realpaths_to_file.txt, each in a new line
cat <name_of_file> | head -30
cat <name_of_file> | wc -l
```

### 4. Git Installation and Usage
------------------------------------

Now, in preparation of creating a git repository, some steps need to be
taken, to avoid some fallbacks. Let's first clear out our directory.

``` {.sh}
cd ~ #navigate to home directory
cd Documents/Summer_School_MDS_UFZ # navigate to the directory you have created before
rm -r * # remove all contents of the directory, be careful that you are inded in the correct directory
```

So we have a completely empty directory to work with now. Let's install
Git.

``` {.sh}
sudo apt-get update # fetch updates
sudo apt-get upgrade # upgrade the system
sudo apt install git # install git to your local device
```

While Git is being installed, let's explain what it is. Git, in this
case GitHub, is a platform, that allows for collaborations and version
control of projects, mainly code and software development.

Key features are:

-   Version Control --\> keep track of versions and changes between
    versions of code, see history of changes
-   Collaboration --\> multiple contributors can work on the same code,
    suggest changes, and implement them, without overwritting each
    other's work
-   Reporistories --\> multiple "directories" to store code, data files,
    documentation,
-   Branches --\> create separate versrsions of a project, usually used
    for testing purposes, and then get's merged back to the main
    repository
-   Pull Requests --\> propose changes of code/software to
    collaborators, that can then accept, change or reject them
-   Issues --\> allow to track tasks, bugs and feature requests

Configure your username and email, which will be associated with your commits:

```{.sh}
git config --global user.name "Linus Torvalds"
git config --global user.email torvalds@osdl.org
```

#### 4.1. Creating a GitHub repository

Let's create a GitHub account! After this, do the following steps:

1.  Navigate to your "Your repositories" once you have sucesfully logged
    in to GitHub, and find the green button for "New".
2.  Give your repository a name and a short description of your choice.
3.  Click "Private" and "Add a README file", leave the rest as default
    settings
4.  Click "Create repository"
5.  You have sucessfuly created your first repo

#### 4.2. Connecting to a remote repository

Once you have created your remote repository, it would now make sense to
connect it to your local machine. There are several ways to do that, on
which you can read about in [About remote
repositories](https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories).
We are going to be using **SSH keys**, on which you can read
[here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/about-ssh).

To do that, you first need to generate an SSH key and add it to your GitHub account.
Generate a new SSH key pair:

```{.sh}
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Start the ssh-agent and add your private key:

```{.sh}
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

```{.sh}
cat ~/.ssh/id_ed25519.pub
```

After you have added the key, you can clone your repository via SSH:

```{.sh}
$ git clone git@github.com:<username>/<name_of_repository>.git
```

You should now be able to make changes to your remote repository from your local machine. You can check if you managed to succeed with:

```{.sh}
git status
```

Should give you the following output:

On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean

You can even sign your commit with your SSH key, making sure to other people that it is really you commiting to a repository.

Check for existing SSH keys in your GitHub account and add your public key there.

After this you can configure Git to use SSH to sign commits and tags like this:

```{.sh}
git config --global gpg.format ssh
```

To set your SSH signing key in Git, paste the text below, substituting /PATH/TO/.SSH/KEY.PUB with the path to the public key you'd like to use.

```{.sh}
git config --global user.signingkey /PATH/TO/.SSH/KEY.PUB
```

This would be enough to sign your commits in GitHub, but if you need to guarantee your commit are also signed locally, please check about the [allowed signers file](https://docs.gitlab.com/user/project/repository/signed_commits/ssh/)

Let's what our configuration looks like using the following command now:

```{.sh}
git config --list
```

#### 4.3. Pushing and Pulling remote repositories

Now, since you have the option, and we already created the file
README.md via the GitHub API, let's now edit the file localy and push it
to the remote repository:

```{.sh}
nano README.md # fill it with some lines
```

You can now directly type in the file, here is some example syntax for
markdown files. Copy the code bellow to your **README.md** file, you can
past the content in there with **Ctrl+Shift+V**.

```{.sh}
# This is a big title

## This is a slightly smaller title

### smaller

#### even smaller

This is how we make numbered lists:

1. Using
2. Git
3. Is
4. Useful

And this is how we make bulletpoints:

- and
- can
- be
- applicable
- in
- biology

This is how we can hyperlink in the text

1. [This is a big title](#this-is-a-bi-title)
2. [This is a slightly smaller title](#this-is-a-slightly-smaller-title)

You can also add links to external [websites](https://www.ufz.de/).

You can also make tables:
|Column 1|Column 2|Column 3|Column 4|
|:-----:|:--:|:-----:|:----:|
|just|cause|I|can|
|but|so|can|you|

We can also have figures in the text like this:

![Figure 1 - Name of figure](relative/location/of/the/figure/figure1.png)

We can also show lines of code like this:

```{.sh}
cd ~ #navigate to home directory
cd Documents/Summer_School_MDS_UFZ # navigate to the directory you have created before
rm -r # remove all contents of the directory, be careful that you are inded in the correct directory
/`/`/`
```

After you have ended your editing, press **Ctrl+O** and **Return** and
then **Ctrl+X**. Your file is now saved localy.

Now lets add and commit it, and then push it to the remote repository:

``` {.sh}
git status # check if there are already any changes ready for staging
git pull origin main # pull again from remote repository, to not have merge conflicts
git add README.md # stage a file for commit
git commit -m "Updating the README file" # commit a file with a message
git push origin main # push changes to remote repository
```

Now go to your repository and check out how it looks =) =).

#### 4.4. Branches

One of the main features of git is the branching system. With it, you
can "copy" your existing work into a separate branch, and work on your
code there, before pushing in to the main brach. This is used to not
interfere with any curretly working code while introducing improvements
and upgrades to it.

``` {.sh}
git branch # check what is the current working branch
git branch <new_branch_name> # create a new branch
git switch <new_branch_name> # switch to the new branch, should also be possible with git checkout
# or use oneliner
git switch -c <new_branch_name>
git branch # check that we have switched branches
```

Now that we have created a new branch, let's do some work in it. The
contets of the proposed script are [here](./02_scripts/food_script.sh)

``` {.sh}
#!/bin/bash

# Define an array of dishes with their ingredients
declare -A dishes
dishes=(
  ["Burrito"]="tortilla rice beans cheese salsa"
  ["Lasagna"]="pasta sheets tomato sauce ground beef creme cheese mozzarella cheese red wine basil"
  ["Pasta"]="pasta olive oil grana padano tomatoes basil red wine"
  ["Seafood_Pasta"]="pasta olive oil seafood tomatoes grana padano basil white wine optional garlic"
  ["Focaccia"]="flour yeast olive oil rosemary pine nuts grana padano basil garlic mozzarella cheese prosciutto arugula tomato"
  ["Thai_Curry"]="coconut milk bell peppers broccoli carrots rice ginger corn tomato tomato sauce"
  ["Ammunition_Soup"]="coconut milk white beans red beans chickpeas broccoli peas corn"
  ["Couscous_Pfanne"]="couscous mushrooms tomatoes carrots grana padano broccoli or zucchini"
  ["Buckwheat_Mushrooms"]="buckwheat mushrooms tomatoes carrots grana padano"
  ["Spinach_Pasta"]="pasta spinach grana padano fresh cheese or sheep cheese"
)

# Function to display a dish
display_dish() {
  local dish=$1
  echo "$dish: Ingredients are ${dishes[$dish]}."
}

# Function to get dishes for the week
get_dishes_for_the_week() {
  local n=$1
  local selected_dishes=()
  local shopping_list=()

  if (( n > ${#dishes[@]} )); then
    echo "Not enough unique dishes to cover all days, some dishes will be repeated."
    for ((i = 0; i < n; i++)); do
      selected_dishes+=($(echo ${!dishes[@]} | tr ' ' '\n' | shuf -n 1))
    done
  else
    selected_dishes=($(echo ${!dishes[@]} | tr ' ' '\n' | shuf -n $n))
  fi

  for dish in "${selected_dishes[@]}"; do
    display_dish "$dish"
    for ingredient in ${dishes[$dish]}; do
      shopping_list+=("$ingredient")
    done
  done

  echo -e "\nShopping List:"
  echo "${shopping_list[@]}" | tr ' ' '\n' | sort -u | while read item; do
    echo "- $item"
  done
}

# Main function
main() {
  local num_days
  while true; do
    read -p "Enter the number of days you need meals prepared for: " num_days
    if ! [[ "$num_days" =~ ^[0-9]+$ ]] || (( num_days <= 0 )); then
      echo "Please enter a valid positive number."
    else
      break
    fi
  done

  get_dishes_for_the_week "$num_days"
}

# Execute the main function
main
```

``` {.sh}
nano README.md # change the file a bit, play around with the titles and contents
nano food_script.sh # create a bash script file
git add *
git commit -m "Updating readme, adding a script file"
```

Since we now have a scipt, let's also briefly review how to run it.

``` {.sh}
chmod +x food_script.sh #change permission to execute
./food_script.sh #execute the script
```

We have commited the changes to our new brach, let's merge it back with
the main branch now.

``` {.sh}
git switch main # switch branches
git pull origin main # pull origin main
git merge <new_branch_name> # merge <new_branch_name> to the main branch, there should be no conflicts to resolve
git commit -m "Merging new branch into main branch"
git push origin main
```

Now even the changes that we have made to our new branch are included in
the remote repository.

#### 4.5. GitIgnore

Since we don't always want to share all the files, maybe because they
are to big, or they are not relavat to the code, we can exclude them
from the remote repository with a .gitignore file.

Example of contents of .gitignore file:

``` {.sh}
# Ignore all .pkl files
*.pkl

# Except these specific .pkl files
!Concatenated_dictionary.pkl
!Final_dict.pkl

# Ignore all .pdf files, except Graph_thoery_presentation.pdf 
*.pdf
!Graph_thoery_presentation.pdf 

# Ignore all json, graphml, 
*.json
*.graphml

# Ignore all zippped files
*.zip

# Ignore folders
path/to/directory/*
```

So let's grab some files around your computer (NOTHING THAT CAN BE OF
DANGER WHEN SHARED), move them to your git folder, and then compile the
.gitignore file

``` {.sh}
nano .gitignore # make the gitignore file, fill it with files that should be omited from pushes
git add .gitignore
git commit -m "added a gitignore file"
git pull origin main
git push origin main
```

#### 4.6. Reverting changes

So, once in a while, you forget to switch to your testing branch before
changing your code. After staging and commiting changes, and pushing
them to your remote repository, you realize, that the code does not work
as intended anymore. What can we do about that?

First, let's check how we can see the history of changes in git

``` {.sh}
git log # check the log of commits, there you can see the hash number of the commit and your commit messages
# navigate to the folder where you have the food_script.sh
# delete the last line of the script ( main )
git add food_script.sh
git commit -m "Making mistakes to revert them"
./food_script.sh # execute the script, which should now be an error
git push origin main
```

There are safe, and more dangerous ways to revert changes that you have
made in a repository. First the more manual, but we preserve the history
and is safer.

``` {.sh}
git log
git revert HEAD #we are here reverting one commit at a time, each time writing a commit message
git log # check the log of commits again
git push origin main
```

The other method involves a hard reset, but that also rewinds the
history, and can not be reverted. But it is quick and simple.

``` {.sh}
git checkout main
git reset --hard <hash-sum of commit>
git push origin main --force
```

References
----------

1.  **Brian Ward**. *How Linux works: What every superuser should know*.
    No Starch Press, 2021.
2.  **Richard Blum**. *Linux command line and shell scripting bible*.
    John Wiley & Sons, 2008.
3.  **Guia Linux**. *Guia Linux Website*. Available at:
    <https://guialinux.uniriotec.br/>. Accessed: 2024-07-08.
4.  **Daniel P. Bovet and Marco Cesati**. *Understanding the Linux
    Kernel: from I/O ports to process management*. O'Reilly Media,
    Inc., 2005.
