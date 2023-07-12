test_that("Expected nodes: Normal case", {
  expect_equal(parents("HP:0001250")[[1]], c("HP:0012638"))
})

test_that("Expected nodes: Root case", {
  expect_equal(parents("HP:0000001")[[1]], NULL)
})

test_that("Expected nodes: Leaf case", {
  expect_equal(parents("HP:0000717")[[1]], c("HP:0000729"))
})
