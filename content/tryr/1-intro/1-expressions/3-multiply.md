Now try multiplying 6 times 7 (`*` is the multiplication operator).

```bah-hint
6 * 7
```

```bah-output
> 6 * 7
[1] 42
```

```r
```

```bah-test
last_value <- .Last.value
test(
  expect_equal(mode(last_value), "numeric"),
  "Try again; that didn't result in a number."
)
test(
  expect_equal(last_value, 42),
  "That didn't equal 42.  Try again!"
)
```
