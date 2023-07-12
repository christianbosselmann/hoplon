#' Maps an HPO term to SNOMED terms
#'
#' @param term Character vector, a valid HPO ID
#'
#' @return a character vector where each element is a SNOMED term
#' @export
#'
#' @examples
#' snomed("HP:0000003")
#' \dontrun{
#' data %>% mutate(snomed = snomed(term))
#' }
snomed <- function(term) {
  snomed_map[snomed_map$term == term, ]$snomed
}
snomed <- Vectorize(snomed)

