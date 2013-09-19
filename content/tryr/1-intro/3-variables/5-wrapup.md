Now try assigning the `TRUE` logical value to `x`.

```bah-output
> x <- TRUE
```

```r
```

```bah-setup
x <- "Arr, matey!"
```

```bah-test
last_value <- .Last.value
test(
  x,
  "Sorry, but now `x` isn't set at all!  We'll re-set the old value for you.  Try again!"
)
test(
  expect_false(mode(x) == "character"),
  "That's actually a string value; the logical values don't have quotes.  Try again!"
)
test(
  expect_equal(mode(x), "logical"),
  "We need to set `x` to `T` or `TRUE`.  Try again!"
)
test(
  expect_equal(x, TRUE),
  "That's a logical value, but we need `x` set to `TRUE`.  Try again!"
)
```
