test_that("Expected nodes: Normal case", {
  expect_equal(children("HP:0001250")[[1]], c("HP:0002069", "HP:0002133", "HP:0002197",
                                         "HP:0007359", "HP:0011145", "HP:0011146",
                                         "HP:0020207", "HP:0020219", "HP:0031951",
                                         "HP:0032807", "HP:0032892", "HP:0033259",
                                         "HP:0100622"))
})

test_that("Expected nodes: Root case", {
  expect_equal(children("HP:0000001")[[1]], c("HP:0000005", "HP:0000118", "HP:0012823",
                                         "HP:0032223", "HP:0032443", "HP:0040279"))
})

test_that("Expected nodes: Leaf case", {
  expect_equal(children("HP:0000717")[[1]], NULL)
})
