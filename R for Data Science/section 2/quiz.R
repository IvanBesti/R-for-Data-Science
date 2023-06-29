N <- 10000
  counter <- 0
  for(i in rnorm(N)){
    if(i > 0){
      counter <- counter + 1
    }
  }
answer <- counter / N
answer

MyVector <- c(12L, 456L, 34L, 23L, 55L, "24")
typeof(MyVector)
