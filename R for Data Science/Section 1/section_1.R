

mydata <- read.csv("/Users/ivanbesti/Documents/S1/SEMESTER 2/UDEMY/R for Data Science/Section 1/P2-Mispriced-Diamonds.csv")

install.packages("ggplot2")


ggplot(data=mydata[mydata$carat<2.5,], 
       aes(x=carat, y=price, colour=clarity)) +
  geom_point(alpha=0.1) +
  geom_smooth()