# Load the data in csv
mydf <- read.csv("data.csv")
head(mydf)
tail(mydf)

# Filtering data year 1960
mydf
data1960 <- mydf[mydf$Year==1960,]
head(data1960)
tail(data1960)

# Filtering data year 2013
data2013 <- mydf[mydf$Year==2013,]
head(data2013)
tail(data2013)

# Create the 1960 data frame
df1960 <- data.frame(Region = data1960$Region, Fertility = data1960$Fertility.Rate, 
                     Year = data1960$Year,
                     Life_Expectancy = Life_Expectancy_At_Birth_1960)
head(df1960)
tail(df1960)

# Visualize the 1960 data 
library(ggplot2)
qplot(data = df1960, x=Fertility, y=Life_Expectancy, 
      color = Region, alpha = I(0.5),
      main = "Fertility vs. Life Expectancy 1960 FIX")

# Create the 2013 data frame
df2013 <- data.frame(Region = data2013$Region, Fertility = data2013$Fertility.Rate, 
                     Year = data2013$Year,
                     Life_Expectancy = Life_Expectancy_At_Birth_2013)
head(df2013)
tail(df2013)

# Visualize the 2013 data 
library(ggplot2)
qplot(data = df2013, x=Fertility, y=Life_Expectancy, 
      color = Region, alpha = I(0.5),
      main = "Fertility vs. Life Expectancy 2013 FIX")

