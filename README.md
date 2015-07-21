### About

This repository contains the code for a programming assignment for the [R Programming Coursera course.](https://www.coursera.org/course/rprog)

### Usage Example

        > x <- matrix(1:4, 2, 2)
        > customX <- makeCacheMatrix(x)
        > inverseOfX <- cacheSolve(customX)
        > x
             [,1] [,2]
        [1,]    1    3
        [2,]    2    4
        > inverseOfX
             [,1] [,2]
        [1,]   -2  1.5
        [2,]    1 -0.5
        > inverseOfX %*% x
             [,1] [,2]
        [1,]    1    0
        [2,]    0    1
