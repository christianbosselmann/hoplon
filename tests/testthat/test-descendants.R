test_that("Expected nodes: Normal case", {
  expect_equal(as.character(descendants("HP:0000729")),
               c("HP:0000717", "HP:0000723", "HP:0000735", "HP:0000753",
                 "HP:0031433", "HP:0000728", "HP:0008763"))
})

test_that("Expected nodes: Leaf case", {
  expect_equal(descendants("HP:0000717")[[1]], NULL)
})

