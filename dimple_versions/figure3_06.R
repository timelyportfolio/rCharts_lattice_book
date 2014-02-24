#Figure 3.6
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)
data(Chem97, package = "mlmRev")

#to demonstrate how nice plyr eases the life of a R user
#compare the commented code below to the code by Ramnath Vaidyanathan
#data <- data.frame()
#gender <- unique(Chem97$gender)
#scores <- unique(Chem97$score)
#
#for (i in 1 : length(scores) ) {
#  for (j in 1 : length(gender) ) {
#    tempdata <- list()
#    #code primarily from lattice panel.qqmath
#    tempdata$x = qnorm(ppoints(100))
#    tempdata$y = quantile(
#      x = Chem97[which( Chem97$gender == gender[j] & Chem97$score == scores[i] ),]$gcsescore,
#      ppoints(100),
#      names = FALSE,
#      type = 7, 
#      na.rm = TRUE)
#    tempdata$gender = rep( gender[j], length(tempdata$x) )
#    tempdata$score = rep(scores[i], length(tempdata$x) )
#    data <- rbind( data, data.frame( tempdata ) )
#  }
#}
#colnames(data) <- c("x", "y", "gender", "score")

#here is the plyr code
require(plyr)
data <- ddply(Chem97, .(gender, score), summarize,
              x = qnorm(ppoints(100)),
              y = quantile(gcsescore, ppoints(100), names = F, type = 7, na.rm = F)
)


chart3_6 <- rPlot(
  x = "x",
  y = "y",
  data = data,
  color = "bin(score,1)",
  type = 'point',
  size = list( const = 2)
)
chart3_6$facet(
  type = "wrap",
  var = list( var = "gender", levels = sort( unique(Chem97$gender) ) ),
  cols = 3
)
#give name for x and y axis to match example
chart3_6$guides(
  x = list( title = "Standard Normal Quantiles" ),
  y = list( title = "Average GCSE Score" )
)
chart3_6
