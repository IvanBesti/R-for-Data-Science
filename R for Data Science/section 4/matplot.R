


?matplot
matplot(t(FieldGoals/FieldGoalAttempts), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players, col = c(1:4,6), pch = 15:18, horiz = F)

FieldGoals
t(FieldGoals)

Points
Salary

matplot(t(MinutesPlayed/Games), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players, col = c(1:4,6), pch = 15:18, horiz = F)


matplot(t(Salary/Points), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players, col = c(1:4,6), pch = 15:18, horiz = F)
