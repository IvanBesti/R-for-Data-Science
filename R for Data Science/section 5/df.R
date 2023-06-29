# Method 1: select data manually
stats <- read.csv(file.choose())
stats

# Method 2: setting data directory manually
getwd()
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv")      # import data
stats


# ---------------------- Exploring the data
stats
ncol(stats)
nrow(stats)
head(stats, n = 9)
tail(stats, n = 15)
str(stats)
runif(stats)
rnorm(stats)
summary(stats)

#----------------------- Using the $ sign
stats
head(stats)
stats[5,5]
stats[6, "Internet.users"]
stats$Country.Name
stats$Country.Name[5]
stats[, "Income.Group"]
str(stats$Country.Name)
rnorm(stats$Country.Name)

#----------------------- Basic operation of DF
stats
head(stats, 5)
# subsetting
stats[,4, drop = F]
stats[9,]
stats[c(95, 195),]
stats[c(95, 195), 5]
stats[c(95, 195), c(3,5)]
# Remember how the [] work:
is.data.frame(stats[,3])
is.data.frame(stats[,3, drop = F])
is.data.frame(stats[1,])
# Multiply column
head(stats, 5)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users
# add column
stats$multiply <- stats$Birth.rate * stats$Internet.users
stats$blabla <- 11:15
# remove the column
head(stats, 5)
stats$multiply <- NULL
stats$blabla <- NULL

#----------------------- Filtering th dataset
stats
head(stats)
stats$ytta <- stats$Birth.rate > 10
stats[,"ytta"]
yppa <- stats$Internet.users < 5
stats[yppa, ]

stats[stats$Birth.rate < 10,]
stats[stats$Income.Group == " income",]
levels(stats$Country.Name)
f<-factor(stats$Country.Name)
f
str(stats)
stats$ytta <- NULL
stats[stats$Country.Name == "Malta",]

#----------------------- Introduction with qplot
# install.packages("ggplot2")
library(ggplot2)
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3), colour=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot", colour=I("violet"))

#----------------------- Visualizing what we need
qplot(data = stats, x=Internet.users, y=Birth.rate)
qplot(data = stats, x=Internet.users, y=Birth.rate, size=I(0.5))
qplot(data = stats, x=Internet.users, y=Birth.rate, color=I("red"), size=I(0.5))
qplot(data = stats, x=Internet.users, y=Birth.rate, color=Income.Group, size=I(2))

#----------------------- Creating Data Frames
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, 
                   Regions_2012_Dataset)
head(mydf)
colnames(mydf) <- c("Country", "Codes", "Regions")
head(mydf)
tail(mydf)
rm(mydf)

mydf <- data.frame(Country=Countries_2012_Dataset, Codes=Codes_2012_Dataset, 
                   Regions=Regions_2012_Dataset)
head(mydf)
tail(mydf)
summary(mydf)

#----------------------- Merging Data Frames
head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Codes")
head(merged)

merged$Country <- NULL
head(merged)
str(merged)
tail(merged)

#----------------------- Visualizing with new split
qplot(data=merged, x=Internet.users, y=Birth.rate)
qplot(data=merged, x=Internet.users, y=Birth.rate, color = Regions)

# 1. Changing the shape
qplot(data=merged, x=Internet.users, y=Birth.rate, color = Regions, 
      size=I(1), shape=I(17))

# 2. Transparency
qplot(data=merged, x=Internet.users, y=Birth.rate, color = Regions, 
      size=I(2), shape=I(19), alpha=(0.7))

# 3. Giving a title to the plot
qplot(data=merged, x=Internet.users, y=Birth.rate, color = Regions, 
      size=I(2), shape=I(19), alpha=I(0.6), 
      main = "Birth Rate vs Internet Users")

my <- mydf[mydf$Codes == "ABW",]
my
