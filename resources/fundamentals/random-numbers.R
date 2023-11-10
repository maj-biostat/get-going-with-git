library(data.table)

N <- 100
x <- sample(-3:3, size = N, replace = T)
e <- rnorm(N, 0, 1)
g <- rgamma(N, 1, 1)
p <- rpois(N, 10)

d <- data.table(x = x, e = e, g = g, p = p)

apply(d, 2, summary)
