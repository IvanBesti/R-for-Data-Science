x <- rnorm()
x

for(i in x){
  print(i)
}

for(j in 1:5){
  print(x[j])
}

N <- 100000000
a <- rnorm(N)
b <- rnorm(N)

c <- a * b

d <- rep(NA, N)
for(i in 1:N) {
  d[i] <- a[i] * b[i]
}
