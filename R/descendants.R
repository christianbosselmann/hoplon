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

  # get children
  child <- unlist(hpo[hpo$term == term, ]$children)

  ls_children <- list()
  descendants <- list()
  leaf_flag <- FALSE
  while(leaf_flag == FALSE){

    # children's children, keep children
    pp <- unlist(hpo[which(hpo$term %in% child), ]$children)
    pp <- c(child, pp)

    # store children in list
    ls_children <- c(ls_children, pp)

    # check if we have reached a leaf (the children are identical)
    leaf_flag <- identical(unique(child), unique(pp))

    # make parent's parents new parents
    child <- pp
  }

  # return stored children as descendants
  unique(unlist(ls_children))
}
descendants <- Vectorize(descendants)
