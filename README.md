
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PlantPhyloTrees

## Installation

``` r
# install.packages("devtools")
devtools::install_github("iramosgutierrez/PlantPhyloTrees")
#> Using GitHub PAT from the git credential store.
#> Downloading GitHub repo iramosgutierrez/PlantPhyloTrees@HEAD
#> rlang    (1.2.0  -> 1.3.0 ) [CRAN]
#> glue     (1.8.0  -> 1.8.1 ) [CRAN]
#> cli      (3.6.5  -> 3.6.6 ) [CRAN]
#> magrittr (2.0.4  -> 2.0.5 ) [CRAN]
#> digest   (0.6.37 -> 0.6.39) [CRAN]
#> Rcpp     (1.1.0  -> 1.1.2 ) [CRAN]
#> tibble   (3.3.0  -> 3.3.1 ) [CRAN]
#> Installing 7 packages: rlang, glue, cli, magrittr, digest, Rcpp, tibble
#> Installing packages into 'C:/Users/IR.5053485/AppData/Local/R/win-library/4.5'
#> (as 'lib' is unspecified)
#> package 'rlang' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'rlang'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\IR.5053485\AppData\Local\R\win-library\4.5\00LOCK\rlang\libs\x64\rlang.dll
#> to
#> C:\Users\IR.5053485\AppData\Local\R\win-library\4.5\rlang\libs\x64\rlang.dll:
#> Permission denied
#> Warning: restored 'rlang'
#> package 'glue' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'glue'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\IR.5053485\AppData\Local\R\win-library\4.5\00LOCK\glue\libs\x64\glue.dll
#> to C:\Users\IR.5053485\AppData\Local\R\win-library\4.5\glue\libs\x64\glue.dll:
#> Permission denied
#> Warning: restored 'glue'
#> package 'cli' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'cli'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\IR.5053485\AppData\Local\R\win-library\4.5\00LOCK\cli\libs\x64\cli.dll
#> to C:\Users\IR.5053485\AppData\Local\R\win-library\4.5\cli\libs\x64\cli.dll:
#> Permission denied
#> Warning: restored 'cli'
#> package 'magrittr' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'magrittr'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\IR.5053485\AppData\Local\R\win-library\4.5\00LOCK\magrittr\libs\x64\magrittr.dll
#> to
#> C:\Users\IR.5053485\AppData\Local\R\win-library\4.5\magrittr\libs\x64\magrittr.dll:
#> Permission denied
#> Warning: restored 'magrittr'
#> package 'digest' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'digest'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\IR.5053485\AppData\Local\R\win-library\4.5\00LOCK\digest\libs\x64\digest.dll
#> to
#> C:\Users\IR.5053485\AppData\Local\R\win-library\4.5\digest\libs\x64\digest.dll:
#> Permission denied
#> Warning: restored 'digest'
#> package 'Rcpp' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'Rcpp'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\IR.5053485\AppData\Local\R\win-library\4.5\00LOCK\Rcpp\libs\x64\Rcpp.dll
#> to C:\Users\IR.5053485\AppData\Local\R\win-library\4.5\Rcpp\libs\x64\Rcpp.dll:
#> Permission denied
#> Warning: restored 'Rcpp'
#> package 'tibble' successfully unpacked and MD5 sums checked
#> Warning: cannot remove prior installation of package 'tibble'
#> Warning in file.copy(savedcopy, lib, recursive = TRUE): problem copying
#> C:\Users\IR.5053485\AppData\Local\R\win-library\4.5\00LOCK\tibble\libs\x64\tibble.dll
#> to
#> C:\Users\IR.5053485\AppData\Local\R\win-library\4.5\tibble\libs\x64\tibble.dll:
#> Permission denied
#> Warning: restored 'tibble'
#> 
#> The downloaded binary packages are in
#>  C:\Users\IR.5053485\AppData\Local\Temp\RtmpwRbd8b\downloaded_packages
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#>       ✔  checking for file 'C:\Users\IR.5053485\AppData\Local\Temp\RtmpwRbd8b\remotes5c4c44755ad6\iramosgutierrez-PlantPhyloTrees-1dc44d4/DESCRIPTION' (530ms)
#>       ─  preparing 'PlantPhyloTrees':
#>    checking DESCRIPTION meta-information ...  ✔  checking DESCRIPTION meta-information
#>       ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>      Omitted 'LazyData' from DESCRIPTION
#>       ─  building 'PlantPhyloTrees_0.0.1.tar.gz'
#>      
#> 
#> Installing package into 'C:/Users/IR.5053485/AppData/Local/R/win-library/4.5'
#> (as 'lib' is unspecified)
```

## Downloading the trees

To download just the final trees in R. This can alternatively be done by
hand at the Zenodo website <https://doi.org/10.5281/zenodo.21512447>

**NOTE: This function will not be working until the paper is published
and the Zenodo repository is published**

``` r
library(PlantPhyloTrees)

download_path <- "/home/user/treedata" #for example...
dir.exists(download_path) # I'm checking the folder exists first!

download_trees(path =  download_path)
```

Now you can individually rename the tips in your tree using a table.

Just make sure you create a data frame storing your wanted names in a
“name” column, and the tip name in a “tip” column.

To make sure no errors are made, PlantPhyloTrees will not let you rename
in case you have repeated names or any tips are not included in the
tree. Please check your data carefully first!

Using parameter ‘drop’ can be really helpful. If you want to use a table
just to change several names (but keep everything else), use
`drop = FALSE`. Else, if you want to generate a tree including just the
species included in your table, use `drop = TRUE`. In this case, make
sure yo have all your species included in the ‘name’ column (no matter
if it matches the ‘tip’ one!)

``` r

tree1 <- ape::read.tree(paste0(download_path, "/", "downloaded_tree_1.tre")) # I select the first tree, for example

# This is my table; the first columns are the names I want to match my data; the tip column stores the names in the tree
example_table <- data.frame("name" = c("Rosmarinus_officinalis", "Rosmarinus_tomentosus", "Nepeta_beltranii"),
                            "tip"  = c("Salvia_rosmarinus",      "Salvia_granatensis",    "Nepeta_hispanica") )


tree_renamed <- rename_tips(tree = tree1, name_table = example_table, drop = TRUE) # we get a 3-species phylogeny
```

Now, this can take long if has to be performed for every single
downloaded tree (although useful if you just want to rename one or
several trees).

In case you want to perform a bulk renaming procedure, there is a way to
rename every single tree stored in a defined directory using the same
structure explained before.

``` r


# We are going to use the same table as before!
example_table <- data.frame("name" = c("Rosmarinus_officinalis", "Rosmarinus_tomentosus", "Nepeta_beltranii"),
                            "tip"  = c("Salvia_rosmarinus",      "Salvia_granatensis",    "Nepeta_hispanica") )

tree_directory <- "/home/user/treedata/" 
renaming_path  <- "/home/user/treedata_renamed/" 


rename_tips_dir(dir = original_directory,
                path = renaming_path,
                name_table = example_table, 
                drop = TRUE )

# There we have it! A folder with just the tree we want, and with the names matching our data!
```

## Citation

If using this package, please cite it:

``` r
citation("PlantPhyloTrees")
To cite templateRpackage in publications use:

  Rodriguez-Sanchez F. 2023. templateRpackage.
  https://ecologyr.github.io/templateRpackage/

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {templateRpackage},
    author = {Francisco Rodriguez-Sanchez},
    year = {2023},
    url = {https://ecologyr.github.io/templateRpackage/},
  }
```
