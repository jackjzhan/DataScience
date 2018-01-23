# The Data Scientist's Toolbox Quiz 3 (JHU) Coursera
## Taken by Jack Zhan
## 01/21/2018

Question 1
----------
Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code:
```R
library(datasets)
data(iris)
```
A description of the dataset can be found by running
```R
?iris
```
There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' for the species virginica? Please round your answer to the nearest whole number.
(Only enter the numeric result and nothing else.)

Solution: </br>
```R
round(mean(iris[which(iris$Species=="virginica"),]$Sepal.Length),0)
#7
```

Question 2
----------
Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
* apply(iris, 2, mean)
* apply(iris[, 1:4], 1, mean)
* apply(iris, 1, mean)
* colMeans(iris)
* rowMeans(iris[, 1:4])
* apply(iris[, 1:4], 2, mean)

Solution: </br>
apply(iris[, 1:4], 2, mean)

Question 3
----------
Load the 'mtcars' dataset in R with the following code
```R
library(datasets)
data(mtcars)
```
There will be an object names 'mtcars' in your workspace. You can find some information about the dataset by running
```R
?mtcars
```
How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.
* sapply(split(mtcars$mpg, mtcars$cyl), mean)
* split(mtcars, mtcars$cyl)
* lapply(mtcars, mean)
* mean(mtcars$mpg, mtcars$cyl)
* sapply(mtcars, cyl, mean)
* apply(mtcars, 2, mean)
* with(mtcars, tapply(mpg, cyl, mean))
* tapply(mtcars$cyl, mtcars$mpg, mean)
* tapply(mtcars$mpg, mtcars$cyl, mean)

Solution: </br>
sapply(split(mtcars$mpg, mtcars$cyl), mean) </br>
with(mtcars, tapply(mpg, cyl, mean)) </br>
tapply(mtcars$mpg, mtcars$cyl, mean) </br>

Question 4
----------
Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

(Please round your final answer to the nearest whole number. Only enter the numeric result and nothing else.)

Solution: </br>
```R
x <- with(mtcars, tapply(hp, cyl, mean))
round(abs(x[3]-x[1]),0)
#127
```

Question 5
----------
If you run
```R
debug(ls)
```
what happens when you next call the 'ls' function?

Solution: </br>
The price and difficulty of collecting and storing data has dramatically dropped.