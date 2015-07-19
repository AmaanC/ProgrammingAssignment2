## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(...) {
        set <- function(...) {
                args <- c(as.list(environment()), list(...))

                if (class(args[[1]]) == 'matrix') {
                        internalMatrix <<- args[[1]]
                }
                else {
                        internalMatrix <<- matrix(...)
                }
        }

        get <- function() {
                internalMatrix
        }
        
        getInverse <- function() {
                print('Getting inverse')
                if (exists('inv')) {
                        print('Inverse cached already')
                        return(inv)
                }
                else {
                        inv <<- solve(internalMatrix)
                        return(inv)
                }
        }

        set(...)
        list(set = set, get = get, getInverse = getInverse, inv=inv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        # Return a matrix that is the inverse of 'x'
        x$getInverse()
}
