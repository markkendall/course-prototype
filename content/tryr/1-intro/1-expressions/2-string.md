There's your result, `2`. It's printed on the console right after your entry.

Type the string `"Arr, matey!"`. (Don't forget the quotes!)

```bah-hint
"Arr, matey!"
```

```bah-output
> "Arr, matey!"
[1] "Arr, matey!"
```

```r
```

```bah-test
last_value <- .Last.value
test(
  expect_equal(mode(last_value), "character"),
  "We're looking for a string.  Did you remember the quotation marks?"
)
```
