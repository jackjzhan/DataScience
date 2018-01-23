# R Programming (JHU) Coursera
## Taken by Jack Zhan
## 01/22/2018

Question 1
----------
Suppose I define the following function in R
```R
cube <- function(x, n) {
        x^3
}
```
What is the result of running
```R
cube(3)
```
in R after defining this function?
* An error is returned because 'n' is not specified in the call to 'cube'
* The number 27 is returned
* A warning is given with no value returned.
* The users is prompted to specify the value of 'n'.

Solution: </br>
The number 27 is returned

Question 2
----------
The following code will produce a warning in R.
```R
x <- 1:10
if(x > 5) {
        x <- 0
}
```
Why?
* There are no elements in 'x' that are greater than 5
* 'x' is a vector of length 10 and 'if' can only test a single logical statement.
* The expression uses curly braces.
* The syntax of this R expression is incorrect.
* You cannot set 'x' to be 0 because 'x' is a vector and 0 is a scalar.

Solution: </br>
'x' is a vector of length 10 and 'if' can only test a single logical statement.

Question 3
----------
Consider the following function
```R
f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}
```
What value is returned?
* 16
* 4
* 10
* 7

Solution: </br>
10

Question 4
----------
Consider the following expression:
```R
x <- 5
y <- if(x < 3) {
        NA
} else {
        10
}
```
What is the value of 'y' after evaluating this expression?

Solution: </br>
10

Question 5
----------
Consider the following R function
```R
h <- function(x, y = NULL, d = 3L) {
        z <- cbind(x, d)
        if(!is.null(y))
                z <- z + y
        else
                z <- z + f
        g <- x + y / z
        if(d == 3L)
                return(g)
        g <- g + 10
        g
}
```
* f
* z
* d
* L
* g

Solution: </br>
f

Question 6
----------
What is an environment in R?
* a list whose elements are all functions
* a collection of symbol/value pairs
* a special type of function
* an R package that only contains data

Solution: </br>
a collection of symbol/value pairs

Question 7
----------
The R language uses what type of scoping rule for resolving free variables?
* global scoping
* dynamic scoping
* compilation scoping
* lexical scoping

Solution: </br>
lexical scoping

Question 8
----------
How are free variables in R functions resolved?
* The values of free variables are searched for in the global environment
* The values of free variables are searched for in the working directory
* The values of free variables are searched for in the environment in which the function was defined
* The values of free variables are searched for in the environment in which the function was called

Solution: </br>
The values of free variables are searched for in the environment in which the function was defined

Question 9
----------
What is one of the consequences of the scoping rules used in R?
* All objects must be stored in memory
* R objects cannot be larger than 100 MB
* All objects can be stored on the disk
* Functions cannot be nested

Solution: </br>
All objects must be stored in memory

Question 10
-----------
In R, what is the parent frame?
* It is the environment in which a function was called
* It is the package search list
* It is always the global environment
* It is the environment in which a function was defined

Solution: </br>
It is the environment in which a function was called