


Games
Games[c(1,3),]
Games[1:5,9:10]
Games[c("KobeBryant", "LeBronJames"), 9:10]
Games[10,,drop = F]
Games[10,5,drop = F]

is.matrix(Games[10,])

Data <- MinutesPlayed[1,,drop=F]
matplot(t(Data), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players[1], col = c(1:4,6), pch = 15:18, horiz = F)

is.matrix(Data)
Data

Data1 <- MinutesPlayed[1:3,]
matplot(t(Data1), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players[1:3], col = c(1:4,6), pch = 15:18, horiz = F)
