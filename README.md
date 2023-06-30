
# hoplon

<!-- badges: start -->
<!-- badges: end -->

The goal of hoplon is to provide a light-weight and tidy interface to
human phenotype ontology (HPO) terms. It provides functions to make
working with clinical deep computational phenotyping data more
convenient.

## Installation

You can install the development version of hoplon like so:

``` r
# install.packages("devtools")
devtools::install_github("christianbosselmann/hoplon")
```

## Example

This basic examples takes a tibble with a column term of HPO IDs,
propagates them to their ancestors and returns the term description for
each ancestor. Note that functions return character vectors as column
lists - unnest them if needed.

``` r
library(tidyverse, quietly = TRUE)
#> ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
#> ✔ dplyr     1.1.2     ✔ readr     2.1.4
#> ✔ forcats   1.0.0     ✔ stringr   1.5.0
#> ✔ ggplot2   3.4.2     ✔ tibble    3.2.1
#> ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
#> ✔ purrr     1.0.1     
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
#> ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
library(hoplon)
data <- tibble(term = c("HP:0011146", "HP:0012736", "HP:0000717"))
data %>%
  mutate(description_term = hoplon::describe(term)) %>%
  mutate(ancestors = hoplon::ancestors(term)) %>% 
  unnest(cols = ancestors) %>%
  mutate(description_ancestors = hoplon::describe(ancestors)) 
#> # A tibble: 19 × 4
#>    term       description_term                   ancestors description_ancestors
#>    <chr>      <chr>                              <chr>     <chr>                
#>  1 HP:0011146 Dialeptic seizure                  HP:00012… Seizure              
#>  2 HP:0011146 Dialeptic seizure                  HP:00126… Abnormal nervous sys…
#>  3 HP:0011146 Dialeptic seizure                  HP:00007… Abnormality of the n…
#>  4 HP:0011146 Dialeptic seizure                  HP:00001… Phenotypic abnormali…
#>  5 HP:0011146 Dialeptic seizure                  HP:00000… All                  
#>  6 HP:0012736 Profound global developmental del… HP:00012… Global developmental…
#>  7 HP:0012736 Profound global developmental del… HP:00127… Neurodevelopmental d…
#>  8 HP:0012736 Profound global developmental del… HP:00127… Neurodevelopmental a…
#>  9 HP:0012736 Profound global developmental del… HP:00126… Abnormal nervous sys…
#> 10 HP:0012736 Profound global developmental del… HP:00007… Abnormality of the n…
#> 11 HP:0012736 Profound global developmental del… HP:00001… Phenotypic abnormali…
#> 12 HP:0012736 Profound global developmental del… HP:00000… All                  
#> 13 HP:0000717 Autism                             HP:00007… Autistic behavior    
#> 14 HP:0000717 Autism                             HP:00007… Atypical behavior    
#> 15 HP:0000717 Autism                             HP:00114… Abnormality of highe…
#> 16 HP:0000717 Autism                             HP:00126… Abnormal nervous sys…
#> 17 HP:0000717 Autism                             HP:00007… Abnormality of the n…
#> 18 HP:0000717 Autism                             HP:00001… Phenotypic abnormali…
#> 19 HP:0000717 Autism                             HP:00000… All
```
