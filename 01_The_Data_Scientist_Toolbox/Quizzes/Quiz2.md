# The Data Scientist's Toolbox Quiz 2 (JHU) Coursera
## Taken by Jack Zhan
## 01/21/2018

Question 1
----------
Which of the following commands will create a directory called data in your current working directory?
* mkdir ../data
* mkdir data
* pwd data
* mkdir /Users/data

Solution: </br>
mkdir data

Question 2
----------
Which of the following will initiate a git repository locally?
* git merge
* git init
* git push
* git pull

Solution: </br>
git init

Question 3
----------
Suppose you have forked a repository called datascientist on Github but it isn't on your local computer yet. Which of the following is the command to bring the directory to your local computer?
(For this question assume that your user name is username)
* git clone https://github.com/username/datascientist.git
* git pull datascientist master
* git init
* git pull https://github.com/username/datascientist.git

Solution: </br>
git clone https://github.com/username/datascientist.git

Question 4
----------
Which of the following will create a markdown document with a secondary heading saying "Data Science Specialization" and an unordered list with the following for bullet points: Uses R, Nine courses, Goes from raw data to data products
```R
*h2 Data Science Specialization

* Uses R

* Nine courses

* Goes from raw data to data products
```

```R
## Data Science Specialization

* Uses R

* Nine courses

* Goes from raw data to data products
```

```R
*** Data Science Specialization

* Uses R

* Nine courses

* Goes from raw data to data products
```

```R
## Data Science Specialization

li Uses R

li Nine courses

li Goes from raw data to data products
```

```R
### Data Science Specialization

* Uses R

* Nine courses

* Goes from raw data to data products
```

Solution:
```R
## Data Science Specialization

* Uses R

* Nine courses

* Goes from raw data to data products
```

Question 5
----------
Install and load the KernSmooth R package. What does the copyright message say?

* Copyright KernSmooth 1997-2009
* Copyright M. P. Wand 1997-2013
* Copyright M. P. Wand 1997-2009
* Copyright Coursera 2009-2013

Solution: </br>
```R
install.packages("KernSmooth")
library("KernSmooth")

# Copyright M. P. Wand 1997-2009
```