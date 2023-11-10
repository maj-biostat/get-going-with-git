# R script to demo branching
suppressPackageStartupMessages(library(data.table))
suppressPackageStartupMessages(library(survival))
suppressPackageStartupMessages(library(rtables))
suppressPackageStartupMessages(library(ggplot2))

message("-------------------------------")
message("NOW WE WILL MOVE ONTO BRUNCHING\n")
message("-------------------------------")


# Data generation  ------------------
set.seed(1)

N <- 4000
d <- data.table(
  id = 1:N,
  u = rbinom(N, 1, 0.5)
)

d[u == 0, x := rbinom(.N, 1, 0.2)]
d[u == 1, x := rbinom(.N, 1, 0.8)]

b0 <- 3
b1 <- 1
b2 <- -2
b3 <- -1
e <- 1
w_cens <- 4

# Continuous outcome
d[, mu := b0 + b1 * x + b2 * u + b3 * x * u]
d[, y := rnorm(.N, mu, 1)]

# Binary outcome
d[x == 1, z := rbinom(.N, 1, 0.7)]
d[x == 0, z := rbinom(.N, 1, 0.3)]

# Survival outcome
# Median tte -log(0.5)/0.6 vs -log(0.5)
d[x == 1, w := rexp(.N, 0.6)]
d[x == 0, w := rexp(.N, 1.0)]
d[, evt := as.integer(w < w_cens)]
d[evt == 0, w := w_cens]

# Labels
d[x == 0, arm := "FBI"]
d[x == 1, arm := "ACTIVE"]

d[u == 0, age := "< 50 years"]
d[u == 1, age := ">= 50 years"]

# Descriptive summary -------

message("\nDESCRIPTIVE SUMMARY:\n")

lyt <- basic_table() %>%
  split_cols_by("arm") %>%
  summarize_row_groups() %>%
  analyze("y", mean, format = "xx.x")

build_table(lyt, d)

# Analyses --------

message("\n\nANALYSIS OF CONTINOUS OUTCOME (UNSTRATIFIED):\n")

lm1 <- lm(y ~ x, data = d)
summary(lm1)


