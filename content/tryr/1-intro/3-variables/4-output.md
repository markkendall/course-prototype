You can print the value of a variable at any time just by typing its name in the console. Try printing the current value of `x`.

```bah-hint
x
```

```bah-output
> x
[1] "Arr, matey!"
```

```r
```

```bah-setup
x <- "Arr, matey!"
```

```bah-test
last_value <- .Last.value
test(
  expect_equal(x, "Arr, matey!"),
  "We'll re-set the value of `x` for you.  Type the variable's name alone on the line to get its value."
)
test(
  expect_equal(x, "Arr, matey!"),
  "We're trying to read `x`, rather than set it.  We'll re-set the value of `x` to 'Arr, matey!' for you.  Type the variable's name alone on the line to get its value."
)
test(
  expect_equal(last_value, "Arr, matey!"),
  "Type the variable's name alone on the line to get its value."
)
```
