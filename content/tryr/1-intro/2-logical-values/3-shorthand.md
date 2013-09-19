`T` and `F` are shorthand for `TRUE` and `FALSE`. Try this:

```bah-hint
T == TRUE
```

```bah-output
> T == TRUE
[1] TRUE
```

```r
```

```bah-test
last_value <- .Last.value
test(
  expect_equal(last_value, TRUE),
  "Sorry, those values weren't equal!  Try using `T` and `TRUE` (without quotes)."
)
```
