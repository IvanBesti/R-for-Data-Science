#packages in R
# Packages are collections of R functions, data, and compiled code in a well
#defined format.
#the directory where packages are stored is called the library

install.packages("ggplot2")
library(ggplot2)

?qplot()
?ggplot()
?diamonds()

qplot(data=diamonds, carat, price,
      colour=clarity, facets=.~clarity)
