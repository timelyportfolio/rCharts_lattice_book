require(XML)
require(rCharts)

parsed <- htmlParse(
  "http://lmdvr.r-forge.r-project.org/figures/figures.html"
)

#get all code Listings
xpathSApply(
  parsed,
  '//div[@class="codeListing"]/text() | 
    //div[@class="codeListingHidden"]/text()',
  xmlValue)

#loop through each example in the directory
#generate rChart and then the lattice version
files <- list.files( "polycharts_versions/", pattern = "*.R" )

#figures 2.02 2.03 2.05 2.08 2.09
#2.10 missing, 2.11 missing
#3 starts with blank so need to add 1 to figure
#3.06 depends on something created prior
#3.07 and later do not match
#4.07 depends on prior
#4.08 and 4.09 do not show up separately
#chapter 5 node 4 has all the rest of the examples
for ( i in 1:length(files) ) {
  #get chapter from file name
  chapter <- as.numeric( substr( files[i], 7, 7) )
  #get the figure number
  figure <- as.numeric( substr( files[i], 9, 10 ) )
  #get a chapter and run a specific example
  eval(
    parse(
      text = 
        xpathSApply(
          parsed,
          paste0('//div[@id="CODE.0', chapter,'"]/text()'),
          xmlValue
        )[ifelse(chapter %in% c(3,4,5),figure+1,figure)]
    )
  )
  
  create_chart( 
    paste0( "polycharts_versions/", files[i])
  )$show(T)#$print()
  
}




#now run tests with lattice examples

#get all code Listings
codeListing <- xpathSApply(
  parsed,
  '//div[@class="codeListing"]/text() | 
  //div[@class="codeListingHidden"]/text()',
  xmlValue)

for (i in 1:length(codeListing)) {
  #ERROR HANDLING
  possibleError <- tryCatch(
    eval(
      parse(
        text = codeListing[i]
      ),
      environment()
    ),
    error=function(e) e
  )
  print(possibleError)
  
  if(inherits(possibleError, "error")) next

  if(length(grid.ls(flatten=FALSE,print=FALSE)) > 1){
      grid.export(paste0("example",i,".svg"))      
      dev.off()
    }
  }  #end for
  