#' Maps an HPO term to UMLS concepts
#'
#' @param term Character vector, a valid HPO ID
#'
#' @return a character vector where each element is a UMLS concept
#' @export
#'
#' @examples
#' umls("HP:0000001")
#' \dontrun{
#' data %>% mutate(umls = umls(term))
#' }
umls <- function(term) {
  umls_map[umls_map$term == term, ]$umls
}
umls <- Vectorize(umls)
