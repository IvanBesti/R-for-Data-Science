z <- c(1,2,3,4,5) #combine
z
is.numeric(z)

x <- c(1L,2L,90L,100L)
x
is.numeric(x)
is.character(x)
is.double(x)
is.integer(x)

seq(1,50) #sequence
1:15
seq(1,50,8)
z <- seq(1,50,9)
z

rep(3,100) #replicate
j <- rep(5,90)
j

rep("kkk", 50)
k <- rep("kkk", 50)
k

x <- c(100, 90, 50)
y <- rep(x,15)
y