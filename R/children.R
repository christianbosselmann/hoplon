#' Return the children of an HPO term
#'
#' @param term Character vector, a valid HPO ID
#'
#' @return a character vector where each element is a child term
#' @export
#'
#' @examples
#' children("HP:0000001")
#' \dontrun{
#' data %>% mutate(children = children(term))
#' }
children <- function(term) {
  hpo[hpo$term == term, ]$children
}
children <- Vectorize(children)
