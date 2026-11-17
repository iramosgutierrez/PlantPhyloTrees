#' tip renaming function
#'
#' @param tree a phylogenetic tree
#' @param name_table a dataframe containing a "name" column storing the wanted tip name and a "tip" column storing the focal tip name in 'tree' to be changed.
#' @param drop Logical. If TRUE (default), all tips not included in 'name_table$name' will be erased
#'
#' @returns  a phylogenetic tree
#'
#' @author I. Ramos-Gutiérrez
#'
#' @export
rename_tips <- function(tree, name_table, drop = TRUE){

customtree <- tree

if(!all(names(name_table) %in% c("name", "tip" ))){
  stop("name_table shoud be a data frame with columns named 'name' and 'tip'")
  }
name_table$name <- gsub(" ", "_", name_table$name)
name_table$tip <- gsub(" ", "_", name_table$tip)


if(any(duplicated(name_table$tip))){
  stop("There are duplicate names in name_table$tip! Please check:\n - ",
       paste0(name_table$tip[duplicated(name_table$tip)], collapse = "\n - "))
}

if(any(duplicated(name_table$name))){
  stop("There are duplicate names in name_table$name! Please check:\n - ",
       paste0(name_table$name[duplicated(name_table$name)], collapse = "\n - "))
}

if(!all(name_table$tip %in% customtree$tip.label)){
  stop("There are some tips in name_table$tip! Please check:\n - ",
       paste0(name_table$tip[duplicated(name_table$tip)], collapse = "\n - "))
}

for(i in 1:nrow(name_table)){
  ownname <- name_table$name[i]
  tipname <- name_table$tip[i]

  if(ownname == tipname){next}

  if(ownname %in% customtree$tip.label){
    stop("tip: ", ownname, " already in tree. Please check for inconsistencies or erase")
  }

  customtree$tip.label[customtree$tip.label == tipname] <- ownname

}

if(isTRUE(drop)){
  customtree <- ape::keep.tip(customtree, name_table$name)
}

return(customtree)
}



#' tip renaming function for all trees stored in a folder
#'
#' @param dir directory storing all trees to be renamed (MUST be as .tre)
#' @param path  directory where renamed trees will be stored at
#'
#' @inheritParams rename_tips
#'
#' @author I. Ramos-Gutiérrez
#'
#' @export
rename_tips_dir <- function(dir, path, name_table, drop = TRUE){

  if(!dir.exists(dir)){"dir directory does not exist. Please create it first."}
  if(!dir.exists(path)){"path directory does not exist. Please create it first."}

  trees <- list.files(dir, pattern = ".tre")
  for(t in trees){
    treename <- substr(t, 1, nchar(t)-4)
    tree <- ape::read.tree(paste0(dir, "/", t))
    newtree <- rename_tips(tree, name_table, drop = drop)
    ape::write.tree(newtree, paste0(path, "/", treename, "_renamed.tre"))
  }
}
