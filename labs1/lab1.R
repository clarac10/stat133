scored <- c(14, 14, 9, 14, 28, 13, 13, 24, 17, 6, 24, 0, 24, 13, 26, 14)
against <- c(19, 30, 16, 38, 31, 24, 23, 30, 41, 13, 20, 52, 13, 31, 24, 47)

# How many points did the Raiders score in game 7?
scored[7]

#What was the score of the first 5 games?
scored[1:5]

#What were the scores of the even games? Try to do this problem without typing in c(2,4,…)
scored[seq(2, length(scored), 2)]

#What was the score of the last game? Try to do this problem without typing in the number of the last game.
scored[length(scored)]

#Select the scores higher than 14.
scored[scored > 14]

#Select the scores equal to 14.
scored[scored == 14]

#Select the scores equal to 13 or 14.
scored[scored == 13 | scored == 14]

#Select the scores between between 7 and 21 points.
scored[scored > 7 & scored < 21]

#Sort the scores in decreasing order.
sort(scored, decreasing = TRUE)

#What was the highest score achieved?
max(scored)

#What was the lowest score achieved?
min(scored)

#What was the average score?
mean(scored)

#Use the summary() function to give some summary statistics.
summary(scored)

#In how many games did the Raiders score over 20 points?
length(scored[scored > 20])

#What was the sum of the scores in game 7?
scored[7] + against[7]

#What was the sum of the scores in the last 5 games?
c(scored[12]+against[12], scored[13]+against[13], scored[14]+against[14], scored[15]+against[15], scored[16]+against[16])

#What was the difference in scores in the odd games?
abs(scored[seq(1,16,2)] - against[seq(1,16,2)])

#Which games did the Raiders win?
which(scored > against)

#Were there any ties?
scored == against
