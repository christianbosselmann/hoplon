#' Return the descendants of an HPO term
#'
#' @param term Character vector, a valid HPO ID
#'
#' @return a character vector where each element is a descendant term
#' @export
#'
#' @examples
#' descendants("HP:0000001")
#' \dontrun{
#' data %>% mutate(descendants = descendants(term))
#' }
descendants <- function(term) {
  descendants <- list()
  child <- unlist(hpo[hpo$term == term, ]$children)

  ls_children <- list()

  leaf_flag <- FALSE
  while(leaf_flag == FALSE){
    pp <- unlist(hpo[which(hpo$term %in% child), ]$children)
    pp <- c(child, pp)
    ls_children <- c(ls_children, pp)
    leaf_flag <- identical(unique(child), unique(pp))
    child <- pp
  }
  unique(unlist(ls_children))
}
descendants <- Vectorize(descendants)
