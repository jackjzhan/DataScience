# R Programming (JHU) Coursera
## Written by Jack Zhan
## 01/22/2018

# The first function, makeMaxtrix creates a special "matrix", which is really a list containing a function to
# set the value of the matrix
# get the value of the matrix
# set the value of the inverse matrix
# get the inverse matrix

makeMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


# The second function returns the inverse of the matrix. The function checks if
# the inverse has already been computed. If it has that it returns the result and
# skips the computation. Else it computes the inverse and sets the value in the cache
# This function uses solve with assumes that the matrix is invertible

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    # Returns the cached matrix of 'x'
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  # Return a matrix that is the inverse of 'x'
  m
}

