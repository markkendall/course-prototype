# Try R

In this first chapter, we'll cover basic R expressions. We'll start simple, with numbers, strings, and true/false values. Then we'll show you how to store those values in variables, and how to pass them to functions. We'll show you how to get help on functions when you're stuck. Finally we'll load an R script in from a file.

Let's get started!

```bah-setup
library(testthat)
test <- function(expression, failure) {
  tryCatch(expression, error=function(e) { cat(failure, file=stderr()); quit() })
}
```
