#Figure 3.8
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)
data(Chem97, package = "mlmRev")


data <- data.frame()
gender <- unique(Chem97$gender)
scores <- unique(Chem97$score)

for (i in 1 : length(scores) ) {
  for (j in 1 : length(gender) ) {
    tempdata <- list()
    #code primarily from lattice panel.ecdfplot
    #note: example subset gcsescore > 0 
    n = sum(!is.na(Chem97[which( Chem97$gender == gender[j] & Chem97$score == scores[i] & Chem97$gcsescore > 0 ),]$gcsescore))
    tempdata$x = sort(Chem97[which( Chem97$gender == gender[j] & Chem97$score == scores[i] & Chem97$gcsescore > 0 ),]$gcsescore)
    tempdata$y = seq_len(n)/n
    tempdata$gender = rep( gender[j], length(tempdata$x) )
    tempdata$score = rep(scores[i], length(tempdata$x) )
    data <- rbind( data, data.frame( tempdata ) )
  }
}
colnames(data) <- c("x", "y", "gender", "score")
chart3_8 <- rPlot(
  x = "x",
  y = "y",
  data = data,
  color = "gender",
  type = 'point',
  size = list( const = 1)
)
chart3_8$facet(
  type = "wrap",
  var = list( var = "score", levels = sort( unique( Chem97$score ) ) ),
  cols = 3
)
#give name for x and y axis to match example
chart3_8$guides(
  x = list( title = "Standard Normal Quantiles" ),
  y = list( title = "Average GCSE Score" )
)
chart3_8
