test_that("Expected nodes: Normal case", {
  expect_equal(as.character(ancestors("HP:0001250")),
               c("HP:0012638", "HP:0000707", "HP:0000118", "HP:0000001"))
})

test_that("Expected nodes: Root case", {
  expect_equal(ancestors("HP:0000001")[[1]], NULL)
})

