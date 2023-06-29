my_duit <- 1:60
my_duit

# matrix()
matriks <- matrix(my_duit, 6, 10, byrow = T)
matriks
matriks[4,9]

# rbind()
r1 <- c("I", "Love", "You")
r2 <- c("Sorry", "I Have", "Boyfriend")
r3 <- c(13, 4, 13)
C <- rbind(r1,r2,r3)
C

# cbind()
c1 <- 1:8
c2 <- 3:10
C <- cbind(c1,c2)
C[1,"c2"]
