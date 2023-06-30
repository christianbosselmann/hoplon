#' Return the ancestors of an HPO term
#'
#' @param term Character vector, a valid HPO ID
#'
#' @return a character vector where each element is a ancestor term
#' @export
#'
#' @examples
#' ancestors("HP:0000001")
#' \dontrun{
#' data %>% mutate(ancestors = ancestors(term))
#' }
ancestors <- function(term) {
  parent <- unlist(hpo[hpo$term == term, ]$parents)
  ls_parents <- list()
  ancestors <- list()
  root_flag <- FALSE
  while(root_flag == FALSE){
    pp <- unlist(hpo[which(hpo$term %in% parent), ]$parents)
    if(is.null(pp)){break}
    ls_parents <- c(ls_parents, pp)
    parent <- pp
    root_flag <- length(unique(parent)) <= sum(ls_parents %in% "HP:0000001")
  }
  unique(unlist(ls_parents))
}
ancestors <- Vectorize(ancestors)
