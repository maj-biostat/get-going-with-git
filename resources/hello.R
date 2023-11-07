cat("Enter a string please: ");
a <- readLines("stdin",n=1);
cat("You entered")
str(a);
cat( "\n" )
cat(a, file = "log.txt")
