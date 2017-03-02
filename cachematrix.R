## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##makeCacheMatrix function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
        invmat <- NULL
        set <- function(y) {
                x <<- y
                invmat <<- NULL
        }
        get <- function() x
        setinvmat <- function(invmat) invmat <<- invmat
        getinvmat <- function() invmat
        list(set = set, 
             get = get,
             setinvmat = setinvmat,
             getinvmat = getinvmat)
}


## Write a short comment describing this function
## The function will solve the created matrix object and return inverse matrix
## 1st will look for any solved inverse matrix exists and return from cache if exist, or it will solve the inverse
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        invmat <- x$getinvmat()
        if(!is.null(invmat)) {
                message("getting cached data")
                return(invmat)
        }
        data <- x$get()
        invmat <- solve(data,...)
        x$setinvmat(invmat)
        invmat
}
