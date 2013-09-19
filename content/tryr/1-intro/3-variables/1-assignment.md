## Variables

As in other programming languages, you can store values into a variable to access it later. Type `x <- 42` to store a value in `x`.

```bah-hint
x <- 42
```

```bah-output
> x <- 42
```

```r
```

```bah-test
test(
  expect_equal(mode(x), "numeric"),
  "`x` is set now, but it's not a number.  Try again!"
)
test(
  expect_equal(x, 42),
  "`x` should be set to the number `42`.  Try again!"
)
```
