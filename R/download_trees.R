#' Download all phylogenetic trees
#'
#' @param path path where trees will be downloaded
#'
#' @returns  a folder within 'path' where all trees will be stored
#'
#' @author I. Ramos-Gutiérrez
#'
#' @export
download_trees <- function(path){

  path <- "C:/Users/IR.5053485/Downloads/zenododata/"

  if(!dir.exists(path)){"path directory does not exist. Please create it first."}
  tmp <- tempdir()

  zen4R::download_zenodo(doi = "https://doi.org/10.5281/zenodo.21512447",
                         path = tmp,
                         files = "randtip_phylogenies.zip")

  utils::unzip(zipfile = paste0(tmp, "/", "randtip_phylogenies.zip"),
               exdir = path)

}

