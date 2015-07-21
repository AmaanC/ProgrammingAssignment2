## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(mat = matrix()) {
        inv <- NULL
        get <- function() {
                return(mat)
        }
        set <- function(newMatrix) {
                mat <<- newMatrix
        }

        getInverse <- function() {
                return(inv)
        }
        setInverse <- function(newInverse) {
                inv <<- newInverse
        }

        list(set = set, get = get, getInverse = getInverse, setInverse=setInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        # Return a matrix that is the inverse of 'x'
        cachedInverse <- x$getInverse()
        if (is.null(cachedInverse)) {
                originalMatrix <- x$get()
                solution <- solve(originalMatrix, ...)
                x$setInverse(solution)
                cachedInverse <- x$getInverse()
        }
        else {
                print('Getting cached data')
        }
        cachedInverse

}
