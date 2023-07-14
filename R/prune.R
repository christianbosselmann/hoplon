#' Exclude descendants of a set of terms (roots) that are not ancestors of
#' another set of terms. In other words, this takes a set of terms and returns
#' the subtrees rooted at each node, pruned to nodes that are ancestors of
#' the second set of terms.
#'
#' @param roots Character vector, a set of valid HPO IDs; defines descendants
#' @param terms Character vector, a set of valid HPO IDs; defines ancestors
#'
#' @return a character vector where each element is a HPO term
#' @export
#'
#' @examples
#' prune(roots = c("HP:0001250", "HP:0001943"), terms = "HP:0002173")
#' \dontrun{
#' data %>% mutate(test = prune(roots, terms = "HP:0002173"))
#' }
prune <- function(roots, terms) {
  desc <- unlist(hoplon::descendants(roots), use.names = FALSE)
  ancs <- unlist(hoplon::ancestors(terms), use.names = FALSE)

  ins <- intersect(desc, ancs)

  res <- c(ins, terms)
  res <- unique(res)
  res <- list(res)
  return(res)
}
prune <- Vectorize(prune)
