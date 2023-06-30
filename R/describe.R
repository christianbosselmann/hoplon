#' Return the description of an HPO term
#'
#' @param term Character vector, a valid HPO ID
#'
#' @return a character vector of the description (name) of the HPO ID
#' @export
#'
#' @examples
#' describe("HP:0000001")
describe <- function(term) {
  hpo[hpo$term == term, ]$name
}
describe <- Vectorize(describe)
