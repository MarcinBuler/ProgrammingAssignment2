## I very closely followed the functions described in the assigment. 
## Basically I´ve only changed them from making  vector to matrix. 
## cacheMatrix makes the matrix and gets inverse. 

cacheMatrix<- function(x = matrix()) {
     inve <- NULL                         #sets the inve to 0
     set <- function(y) {
      x <<- y                            #checks for x in higher enviroment
      inve <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inve <<- inverse #solves matrix
    getinverse <- function() inve
    list(set = set, get = get,               #makes a list
         setinverse = setinverse,
         getinverse = getinverse)	
}

m1<-matrix(rnorm(1:9), nrow=3, ncol=3) #makes a matrix so I dont have to type it while testing

## cacheSolve checks if inverse has been calculated, otherwise it solves the matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

    inve <- x$getinverse()    #gets the inverse
    if(!is.null(inve)) {      #if inverse is not avalible it prints the message and returns inve
      message("getting cached matrix")
      return(inve)
    }
    mmm <- x$get()          #gets matrix
    inve <- solve(mmm, ...) #solves matrix
    x$setinverse(inve)  # and caches the result in the object inve
    inve    
  }
