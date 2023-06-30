#' Return the parents of an HPO term
#'
#' @param term Character vector, a valid HPO ID
#'
#' @return a character vector where each element is a parent term
#' @export
#'
#' @examples
#' parents("HP:0000001")
#' \dontrun{
#' data %>% mutate(parents = parents(term))
#' }
parents <- function(term) {
  hpo[hpo$term == term, ]$parents
}
parents <- Vectorize(parents)
