#------------------------------------ Prepare your data
getwd()
setwd("/Users/ivanbesti/Documents/S1/SEMESTER 2/UDEMY/R for Data Science/section 6")
getwd()

# import data
movies <- read.csv("movie.csv")
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillion", "Year")

# view the data
head(movies)
tail(movies)
str(movies)
summary(movies)

# change the data type into Factor
movies$Year <- factor(movies$Year)
movies$Film <- factor(movies$Film)
movies$Genre <- factor(movies$Genre)
str(movies)

#------------------------------------ Plotting using GGplot2 library
library(ggplot2)
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) 

# add geom point
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) +
  geom_point()

# add color
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color = Genre)) +
  geom_point()

# add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                        color = Genre, size = BudgetMillion)) +
  geom_point()

# This #1 we will improve it

#------------------------------------ Plotting with layer
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             color = Genre, size = BudgetMillion))
# add point
p + geom_point()

# add line
p + geom_line()

# add both
p + geom_line() + geom_point()
p + geom_point() + geom_line()

# add antoher variaton
p + geom_boxplot()

#------------------------------------ Overriding aesthetics
q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             color = Genre, size = BudgetMillion))

# add geom_point
q + geom_point()

# ex1
q + geom_point(aes(size=CriticRating))

# ex2 
q + geom_point(aes(color=BudgetMillion)) 

# ex3
q + geom_point(aes(x=BudgetMillion))

# renaming 
q + geom_point(aes(x=BudgetMillion)) +
  xlab("Budget Million $$$$")

# add both
q + geom_line(size=0.5) + geom_point()
q + geom_point(size=1) + geom_line()

#------------------------------------ Mapping vs. Setting
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

# 1. Mapping
r + geom_point(aes(color=Genre))

# 2. Setting
r + geom_point(color="blue")

# ERROR
r + geom_point(aes(color="cyan")) # R identify that "cyan" as a factor

# 1. Mapping
r + geom_point(aes(x=Genre)) +
  xlab("Genre")

# 2. Setting
r + geom_point(alpha=0.5)

#------------------------------------ Histograms & Density Charts
s <- ggplot(data=movies, aes(x=BudgetMillion))

# make an histogram
s + geom_histogram(binwidth = 10)

# add colour
s + geom_histogram(binwidth = 10, aes(fill= Genre), color="black")

# make a density chart
s + geom_density(aes(fill=Genre))
                 
# add position
s + geom_density(aes(fill=Genre), position = "stack")

#------------------------------------ Starting Layer Tips
t <-  ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10)

# do it in another way
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10, 
                   aes(x=AudienceRating),
                   fill="white",
                   color="blue")

# 4 
t + geom_histogram(binwidth = 10, 
                   aes(x=CriticRating),
                   fill="white",
                   color="blue")

# 5
t <- ggplot()
t + geom_histogram(data=movies,binwidth = 10, 
                   aes(x=CriticRating),
                   fill="white",
                   color="blue")

#------------------------------------ Statistical Transformation
?geom_smooth

u <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
u + geom_point() + geom_smooth(orientation = "x", fill=NA)

# boxplots
u <- ggplot(data = movies, aes(x=Genre, y=AudienceRating, color=Genre))
u + geom_boxplot() 
u + geom_boxplot(size=1) 
u + geom_boxplot(size=1) + geom_point()

# tip & hack
u + geom_boxplot(size=1) + geom_jitter()
u + geom_jitter() + geom_boxplot(size=1, alpha=0.5)

# challange
u <- ggplot(data = movies, aes(x=Genre, y=CriticRating, color=Genre))
u + geom_jitter() + geom_boxplot(size=1, alpha=0.5)

#------------------------------------ Using Facets
v <- ggplot(data=movies, aes(x=BudgetMillion))
v + geom_histogram(binwidth = 10, aes(fill=Genre), color="black")

# facets
v + geom_histogram(binwidth = 10, aes(fill=Genre), 
                   color="black") +
  facet_grid(Year~.)

v + geom_histogram(binwidth = 10, aes(fill=Genre), 
                   color="black") +
  facet_grid(Genre~., scales = "free")

v + geom_histogram(binwidth = 10, aes(fill=Genre), 
                   color="black") 
  facet_grid(Genre~., scales = "free")
  
# facets & scatterplot
w <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, color=Genre))
w + geom_point()

# facets
w + geom_point() + facet_grid(Year~.)

w + geom_point(aes(size=BudgetMillion)) + facet_grid(.~Year)

w + geom_point() + geom_smooth() 

w + geom_point(size=1) + geom_smooth() +
  facet_grid(Genre~.)

w + geom_point(size=1) + geom_smooth() +
  facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillion)) + geom_smooth() +
  facet_grid(Genre~Year)

w + geom_point(size=1) + geom_smooth() +
  facet_grid(Genre~Year)


#------------------------------------ Coordinates

# Today:
# limits
# zoom

m <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, size=BudgetMillion, color=Genre))
m + geom_point()
m + geom_point() +
  xlim(50, 100) +
  ylim(50, 100)

# histogram plot
n <- ggplot(data = movies, aes(x=BudgetMillion, fill=Genre))
n + geom_histogram(color="black")
n + geom_histogram(color="black") +
  ylim(0,50)

# call other function coord_cartesian
n + geom_histogram(binwidth=10,color="black") +
  coord_cartesian(ylim = c(0,50))

w + geom_point(aes(size=BudgetMillion)) + geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(xlim = c(0,100), ylim = c(0,100))

#------------------------------------ Theme
o <- ggplot(data = movies, aes(x = BudgetMillion))
h <- o + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "black")

# axes labels
h +
  xlab("Money Axes") +
  ylab("Number of Movies")

# label formatting
h +
  xlab("Money Axes") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "DarkGreen", size = 30)) 
  
# tick formatiing
h +
  xlab("Money Axes") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "DarkGreen", size = 30),
        axis.title.y = element_text(color = "red", size = 30)) 

# legend formattin
h +
  xlab("Money Axes") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "DarkGreen", size = 30),
        axis.title.y = element_text(color = "red", size = 30),
        axis.text = element_text(size = 15),
        legend.title = element_text(size = 20),
        legend.text = element_text(size = 15),
        legend.position = c(1,1),
        legend.justification = c(1,1)) 

# give a title and change it
h +
  xlab("Money Axes") +
  ylab("Number of Movies") +
  ggtitle("Movies Budget Distribution") +
  theme(axis.title.x = element_text(color = "DarkGreen", size = 30),
        axis.title.y = element_text(color = "red", size = 30),
        axis.text = element_text(size = 15),
        legend.title = element_text(size = 15),
        legend.text = element_text(size = 15),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(color = "purple", family = "Courier", size = 20),
        plot.title.position = "panel")

qplot(data = movies, x=AudienceRating, y=CriticRating, main = " vs") 
