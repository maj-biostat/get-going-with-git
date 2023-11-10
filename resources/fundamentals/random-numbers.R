library(data.table)

N <- 100

d <- data.table(
  categorical = sample(-3:3, size = N, replace = T),
  normal = rnorm(N, 0, 1),
  gamma = rgamma(N, 1, 1),
  poisson = rpois(N, 10))

apply(d, 2, summary)
