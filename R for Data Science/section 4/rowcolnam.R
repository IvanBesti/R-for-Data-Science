Ayven <- 1:5
Ayven

# give name
names(Ayven) <- c("NAMA", "NAMA", "NAMA", "NAMA", "NAMA")
Ayven

# delete name
names(Ayven)
names(Ayven) <- NULL
Ayven

#-------------

# naming matrix dimension
temp.vec <- rep(c("aa", "bb", "Zz"), each=3)
temp.vec

mat <- matrix(temp.vec, 3, 3)
mat

colnames(mat) <- c("DE", "DF", "FF")
mat

rownames(mat) <- c("WK", "WW", "ZW")
mat

mat["ZW", "DE"] <- "KNTL"
mat

rownames(mat) <- NULL
mat
