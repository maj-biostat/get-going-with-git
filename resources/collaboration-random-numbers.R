library(data.table)

N <- 100
x <- sample(-3:3, size = N, replace = T)
e <- rnorm(N, 0, 1)

y <- x + e

d <- data.table(x = x, y = y)

d[, .(y_mu = mean(y), y_sd = sd(y)), keyby = x]


