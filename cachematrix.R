## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
##A pair of functions that cache the inverse


## I set the input x as a matrix
## and then set the solved value "i" as a null
## I then changed every reference from "mean" to "solve"

makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  ## This function creates a special "matrix" object that can cache its inverse.
  
  ## This function initialize the inverse property
  i <- NULL
  
  ## This function sets the matrix
  set <- function(y) {
    x <<- y
    i <<- NULL
  } 
  
  ## This function gets the matrix 
  get <- function() x
  setsolve <- function(solve) i <<- solve
  getsolve <- function() i
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
##
## I did the same here, I changed "mean" to "solve" and "m" to "i"
cacheSolve <- function(x, ...) {## This function computes the inverse of the special "matrix" returned by `makeCacheMatrix` above.
  
  ## Return a matrix that is the inverse of 'x'
  i <- x$getsolve()
  
  ## Return only the inverse if it is already set   
  if(!is.null(i)) {
    message("getting inversed matrix")
    return(i)
  }
  
  ## Get the matrix from object
  data <- x$get()
  
  ##  Calculate the inverse using matrix multiplication
  i <- solve(data, ...)
  
  ## Set the inverse to object  
  x$setsolve(i)
  
  ## return the matrix  
  i
}

## testing my function
s <- matrix(rnorm(16), 4, 4)
s1 <- makeCacheMatrix(s)
cacheSolve(s1)

    [,1]       [,2]       [,3]
    [1,]  1.5513216 -1.4646553 -1.1698355
    [2,] -0.2367045 -2.1341367 -0.9997087
    [3,]  1.7953839  1.2531364 -0.4052462
    [4,] -1.5129466  0.6695259  0.5916597
    [,4]
    [1,] -0.2571467
    [2,]  2.5146247
    [3,] -2.4339687
    [4,]  0.1134804

