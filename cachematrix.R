## Put comments here that give an overall description of what your
## functions do

## This function creates a special matrix object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
                  m <- NULL
                  
                  set <- function(y) {
                  x <<- y
                  m <<- NULL
                  }
  
                  get <- function() {
                          x
                  }
  
                  setInverse <- function(inverse) {
                            m <<- inverse
                  }
                  
                  getInverse <- function() {
                            m
                  }
                  
                  
                  list(set = set, get = get,
                  setInverse = setInverse,
                  getInverse = getInverse)
  }


## "cachesolve" computes the inverse of the matrix returned by "makeCacheMatrix"
## If the inverse has already been calculated (and the matrix has not changed), then the "cachesolve" retrieves the inverse from the cache.

cacheInverse <- function(x, ...) {
              m <- x$getInverse()
              
              if(!is.null(m)) {
              message("getting cached data")
              return(m)
              }
  
              data <- x$get()
              m <- inv(data)
              x$setInverse(m)
              m
}
  
  
  


