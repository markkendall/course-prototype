And another logical value (note that you need a double-equals sign to check whether two values are equal - a single-equals sign won't work):

```bah-hint
2 + 2 == 5
```

```bah-output
> 2 + 2 == 5
[1] FALSE
```

```r
```

```bah-test
last_value <- .Last.value
test(
  expect_false(mode(last_value) == "numeric"),
  "A logical value is `TRUE` or `FALSE`.  Try `2 + 2 == 5`."
)
test(
  expect_is(last_value, "logical"),
  "A logical value is `TRUE` or `FALSE`.  Try again!"
)
test(
  expect_equal(last_value, FALSE),
  "That resulted in a logical value, but we're looking for a `FALSE` result.  Try again!"
)
```
