# R Programming Quiz 3 (JHU) Coursera
## Taken by Jack Zhan
## 01/22/2018

Question 1
----------
R was developed by statisticians working at
* Bell Labs
* Harvard University
* StatSci
* The University of Auckland

Solution: </br>
The University of Auckland

Question 2
----------
The definition of free software consists of four freedoms (freedoms 0 through 3). Which of the following is NOT one of the freedoms that are part of the definition? Select all that apply.
* The freedom to restrict access to the source code for the software.
* The freedom to improve the program, and release your improvements to the public, so that the whole community benefits.
* The freedom to sell the software for any price.
* The freedom to prevent users from using the software for undesirable purposes.
* The freedom to study how the program works, and adapt it to your needs.
* The freedom to redistribute copies so you can help your neighbor.
* The freedom to run the program, for any purpose.

Solution: </br>
The freedom to restrict access to the source code for the software. </br>
The freedom to sell the software for any price. </br>
The freedom to prevent users from using the software for undesirable purposes.

Question 3
----------
In R the following are all atomic data types EXCEPT: (Select all that apply)
* complex
* data frame
* logical
* matrix
* array
* table
* character
* numeric
* list
* integer

Solution: </br>
data frame </br>
matrix </br>
array </br>
table </br>
list

Question 4
----------
If I execute the expression x <- 4L in R, what is the class of the object 'x' as determined by the 'class()' function?
* matrix
* character
* logical
* integer
* complex
* numeric

Solution: </br>
```R
class(x <- 4L)
#integer
```

Question 5
----------
What is the class of the object defined by the expression x <- c(4, "a", TRUE)?
* character
* mixed
* numeric
* integer
* logical

Solution: </br>
```R
class(x <- c(4, "a", TRUE))
#character
```

Question 6
----------
If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression rbind(x, y)?
* a 3 by 2 matrix
* a vector of length 3
* a vector of length 2
* a 3 by 3 matrix
* a 2 by 2 matrix
* a matrix with two rows and three columns

Solution: </br>
```R
x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x, y)
#a matrix with two rows and three columns
```

Question 7
----------
A key property of vectors in R is that
* elements of a vector can only be character or numeric
* elements of a vector can be of different classes
* elements of a vector all must be of the same class
* a vector cannot have have attributes like dimensions
* the length of a vector must be less than 32,768

Solution: </br>
elements of a vector all must be of the same class

Question 8
----------
Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[2]] give me? Select all that apply.
* a list containing a character vector with the elements "a" and "b".
* a character vector containing the letter "a".
* a list containing character vector with the letter "a".
* a character vector with the elements "a" and "b".
* a character vector of length 1.

Solution: </br>
```R
x <- list(2, "a", "b", TRUE)
x[[2]]
#a character vector containing the letter "a". </br>
#a character vector of length 1.
```

Question 9
----------
Suppose I have a vector x <- 1:4 and y <- 2:3. What is produced by the expression x + y?
* an numeric vector with the values 3, 5, 5, 7.
* an integer vector with the values 3, 5, 3, 4.
* a numeric vector with the values 1, 2, 5, 7.
* a warning
* an integer vector with the values 3, 5, 5, 7.
* a numeric vector with the values 3, 5, 3, 4.
* an error.

Solution: </br>
```R
x <- 1:4
y <- 2:3
x+y
class(x+y)
#an integer vector with the values 3, 5, 3, 4.
```

Question 10
-----------
Suppose I have a vector x <- c(3, 5, 1, 10, 12, 6) and I want to set all elements of this vector that are less than 6 to be equal to zero. What R code achieves this? Select all that apply.
* x[x == 0] < 6
* x[x %in% 1:5] <- 0
* x[x <= 5] <- 0
* x[x < 6] <- 0
* x[x > 6] <- 0
* x[x == 0] <- 6
* x[x >= 6] <- 0
* x[x > 0] <- 6
* x[x == 6] <- 0
* x[x != 6] <- 0
* x[x < 6] == 0

Solution: </br>
x[x %in% 1:5] <- 0 </br>
x[x <= 5] <- 0 </br>
x[x < 6] <- 0


Question 11
-----------
Use the Week 1 Quiz Data Set to answer questions 11-20.
In the dataset provided for this Quiz, what are the column names of the dataset?
* Month, Day, Temp, Wind
* Ozone, Solar.R, Wind
* 1, 2, 3, 4, 5, 6
* Ozone, Solar.R, Wind, Temp, Month, Day

Solution: </br>
```R
dat <- read.table("./Dataset/hw1_data.csv",header=T,sep=",")
colnames(dat)
#Ozone, Solar.R, Wind, Temp, Month, Day
```

Question 12
-----------
Extract the first 2 rows of the data frame and print them to the console. What does the output look like?

Solution: </br>
```R
head(dat,2)
#  Ozone Solar.R Wind Temp Month Day
#1    41     190  7.4   67     5   1
#2    36     118  8.0   72     5   2
```

Question 13
-----------
How many observations (i.e. rows) are in this data frame?
* 153
* 45
* 129
* 160

Solution: </br>
```R
nrow(dat)
#153
```

Question 14
-----------
Extract the last 2 rows of the data frame and print them to the console. What does the output look like?

Solution: </br>
```R
tail(dat,2)
#    Ozone Solar.R Wind Temp Month Day
#152    18     131  8.0   76     9  29
#153    20     223 11.5   68     9  30
```

Question 15
-----------
What is the value of Ozone in the 47th row?
* 63
* 21
* 18
* 34

Solution: </br>
```R
dat$Ozone[47]
#21
```

Question 16
-----------
How many missing values are in the Ozone column of this data frame?
* 9
* 78
* 37
* 43

Solution: </br>
```R
sum(is.na(dat$Ozone))
#37
```

Question 17
-----------
What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
* 42.1
* 18.0
* 53.2
* 31.5

Solution: </br>
```R
mean(dat$Ozone,na.rm = TRUE)
#42.1
```

Question 18
-----------
Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
* 205.0
* 334.0
* 185.9
* 212.8

Solution: </br>
```R
subset_dat <- dat[which(dat$Ozone>31 & dat$Temp>90),]
mean(subset_dat$Solar.R,na.rm = TRUE)
#212.8
```

Question 19
-----------
What is the mean of "Temp" when "Month" is equal to 6?
* 85.6
* 90.2
* 79.1
* 75.3

Solution: </br>
```R
mean(dat[which(dat$Month==6),]$Temp)
#79.1
```

Question 20
-----------
What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
* 18
* 115
* 100
* 97

Solution: </br>
```R
max(dat[which(dat$Month==5),]$Ozone,na.rm = TRUE)
#115
```