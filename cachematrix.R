# The goal of this file is to allow you to cache the inverse of certain matrices.
# For example, usage would be as follows:
#        x <- matrix(1:4, 2, 2)
#        customX <- makeCacheMatrix(x)
#        inverseOfX <- cacheSolve(customX)

# Note that customX is not a matrix itself. x$get() returns the matrix, but x is a list of functions
# This is useful if one needs the inverse of a matrix several times, as using these functions results in computing the
# inverse only once. The inverse is then cached, and returned from the cache on all future calls to the cacheSolve function


# The makeCacheMatrix takes a matrix as an argument, and returns a list of functions that allow you to access and update
# variables easily

makeCacheMatrix <- function(mat = matrix()) {
        # Upon being called, a new environment is formed. This is the parent environment to all the functions that follow.
        inv <- NULL
        get <- function() {
                # This returns the parent environment's "mat" variable.
                return(mat)
        }
        set <- function(newMatrix) {
                # Updates the parent environment's "mat" variable.
                # The <<- operator is important here, as the <- operator would simply update a variable mat, in the current
                # environment, which would be in the scope of the set function
                # If we did that, the get function would never be able to access this updated variable.
                mat <<- newMatrix
        }

        # The same logic follows here as it did for the previous 2 functions
        getInverse <- function() {
                return(inv)
        }
        setInverse <- function(newInverse) {
                inv <<- newInverse
        }

        list(set = set, get = get, getInverse = getInverse, setInverse = setInverse)
}



# The cacheSolve function requires an argument named customMatrix which is created using the makeCacheMatrix function
# The other arguments it takes are passed directly to the solve function when the function is called for the first time
# For an example, look at the comments at the top of this file
# It returns a matrix which is the inverse of the matrix stored in cachedMatrix$get() assuming the solution exists

cacheSolve <- function(customMatrix, ...) {
        # Return a matrix that is the inverse of 'x'
        cachedInverse <- customMatrix$getInverse()
        if (is.null(cachedInverse)) {
                originalMatrix <- customMatrix$get()
                solution <- solve(originalMatrix, ...)
                customMatrix$setInverse(solution)
                cachedInverse <- x$getInverse()
        }
        else {
                print('Getting cached data')
        }
        return(cachedInverse)

}
