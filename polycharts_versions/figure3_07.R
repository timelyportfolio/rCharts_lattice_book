#Figure 3.7
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)
data(Chem97, package = "mlmRev")

Chem97.mod <- transform(Chem97, gcsescore.trans = gcsescore^2.34)

require(plyr)
data <- ddply(Chem97.mod, .(gender, score), summarize,
              x = qnorm(ppoints(100)),
              y = quantile(gcsescore.trans, ppoints(100), names = F, type = 7, na.rm = F)
)

chart3_7 <- rPlot(
  x = "x",
  y = "y",
  data = data,
  color = "bin(score,1)",
  type = 'point',
  size = list( const = 2)
)
chart3_7$facet(
  type = "wrap",
  var = list( var = "gender", levels = sort( unique(Chem97$gender) ) ),
  cols = 3
)
#give name for x and y axis to match example
chart3_7$guides(
  x = list( title = "Standard Normal Quantiles" ),
  y = list( title = "Average GCSE Score" )
)
chart3_7
