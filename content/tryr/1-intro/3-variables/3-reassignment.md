You can re-assign any value to a variable at any time. Try assigning `"Arr, matey!"` to `x`.

```bah-hint
x <- "Arr, matey!"
```

```bah-output
> x <- "Arr, matey!"
```

```r
```

```bah-setup
x <- 42
```

```bah-test
last_value <- .Last.value
test(
  x,
  "Now `x` isn't defined at all!  We'll re-set its old value for you.  Try assigning a string to `x`."
)
test(
  expect_equal(mode(x), "character"),
  "We need you to assign a string to the `x` variable."
)
```
