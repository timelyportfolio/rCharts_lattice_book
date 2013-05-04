#Figure 3.9
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)
data(Chem97, package = "mlmRev")


data <- data.frame()
gender <- unique(Chem97$gender)
scores <- unique(Chem97$score)

for (i in 1 : length(scores) ) {
  for (j in 1 : length(gender) ) {
    tempdata <- list()
    #code primarily from lattice panel.qqmath
    n <- sum(!is.na( Chem97[which(Chem97$gcsescore > 0 & Chem97$score == scores[i] & Chem97$gender == gender[j] ),]$gcsescore))
    tempdata$x = qunif(ppoints(n))
    tempdata$y = quantile(
      x = Chem97[which(Chem97$gcsescore > 0 & Chem97$score == scores[i] & Chem97$gender == gender[j] ),]$gcsescore,
      ppoints(n),
      names = FALSE,
      type = 7, 
      na.rm = TRUE)
    tempdata$gender = rep( gender[j], n )
    tempdata$score = rep(scores[i], n )
    data <- rbind( data, data.frame( tempdata ) )
  }
}
colnames(data) <- c("x", "y", "gender", "score")


chart3_9 <- rPlot(
  x = "x",
  y = "y",
  data = data,
  color = "gender",
  type = 'point',
  size = list( const = 1)
)
chart3_9$facet(
  type = "wrap",
  var = list( var = "score", levels = sort( unique( Chem97$score ) ) ),
  rows = 1
)
#give name for x and y axis to match example
chart3_9$guides(
  x = list( title = "Standard Normal Quantiles" ),
  y = list( title = "Average GCSE Score" )
)
chart3_9
