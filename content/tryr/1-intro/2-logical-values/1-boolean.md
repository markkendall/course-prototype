## Logical Values

Some expressions return a "logical value": `TRUE` or `FALSE`. (Many programming languages refer to these as "boolean" values.) Let's try typing an expression that gives us a logical value:

```bah-hint
3 < 4
```

```bah-output
> 3 < 4
[1] TRUE
```

```r
```

```bah-test
last_value <- .Last.value
test(
  expect_false(mode(last_value) == "numeric"),
  "A logical value is `TRUE` or `FALSE`.  Try `3 < 4`."
)
test(
  expect_is(last_value, "logical"),
  "A logical value is `TRUE` or `FALSE`.  Try a greater than/less than comparison, or a test for equality."
)
test(
  expect_equal(last_value, TRUE),
  "That resulted in a logical value, but we're looking for a `TRUE` result.  Try again!"
)
```
