#' Parse an HPO OBO file
#'
#' @param path Character vector; filepath to your hp.obo file.
#'
#' @return Tibble of HPO terms, term descriptions, and relations
#' @export
#'
#' @examples
#' \dontrun{
#' hpo <- parse_hpo("hp.obo")
#' }
parse_hpo <- function(path){

  raw <- readLines(path) %>%
    stringr::str_split_fixed(":", n = 2) %>%
    `colnames<-`(c("key", "value")) %>%
    tibble::as_tibble() %>%
    dplyr::mutate(value = stringr::str_trim(value), row = dplyr::row_number())

  terms <- raw[raw$key == "id", ]

  raw <- raw %>%
    dplyr::mutate(term = cut(row, c(terms$row - 1, Inf),
                             terms$value, right = FALSE)) %>%
    dplyr::filter(!is.na(term))

  term_name <- raw[raw$key == "name", ] %>%
    dplyr::select(term, name = value)

  term_relations <- raw[raw$key == "is_a", ] %>%
    dplyr::mutate(value = stringr::str_split(value, "!", n = 2) %>%
             purrr::map_chr(first) %>%
             stringr::str_trim) %>%
    dplyr::group_by(term, key) %>%
    dplyr::summarize(value = list(value), .groups = "drop") %>%
    dplyr::select(., term, parents = value)

  children <- term_relations %>%
    dplyr::rename(children = term) %>%
    tidyr::unnest(cols = parents) %>%
    dplyr::mutate(children = as.character(children)) %>%
    dplyr::group_by(parents) %>%
    dplyr::summarize(children = list(children)) %>%
    dplyr::rename(term = parents)

  hpo <- dplyr::left_join(term_name, term_relations)
  hpo <- dplyr::left_join(hpo, children[ ,c("children", "term")], by = "term")

  hpo
}
