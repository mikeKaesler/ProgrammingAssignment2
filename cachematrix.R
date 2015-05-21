## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { #creating the chacheable matrix object
                                 # essentially an object thats a list of funcitons
  i <- NULL #inverse is nothing
  
  set <- function(y) { #the set element, y is input from outside function
    x <<- y # x is scoped to where set is defined, in makeCacheMatrix
    i <<- NULL
  }
  get <- function(){ #sets the get function to the matrix itself
    x
  }
  setInverse <- function(inverse){ #setting the inverse
    i <<- inverse
  }
  getInverse <- function(){ #returning the inverse, i
    i
  }
  #creating the output of the function, the list of functions, and defining by name
  list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getInverse() #checking list i for inverse
  if (!is.null(i)){ #if the list isnt null.. so if the inverse is actually there, get
    message("inverse cached")
    return(i)
    data <- x$get() #otherwise compute the inverse of x and store it
    i <- solve(x)
    x$setInverse(i)
    i #return the inverse
  }
}
