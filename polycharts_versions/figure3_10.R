#Figure 3.10
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

#missing reference line
#tried adding a layer but that did not work

require(rCharts)
data(Chem97, package = "mlmRev")


#here is the Ramnath's beautifyl plyr code
require(plyr)
data <- ddply(Chem97, .(gender, score), summarize,
              x = qnorm(ppoints(100)),
              y = quantile(gcsescore, ppoints(100), names = F, type = 7, na.rm = F)
)

require(reshape2)
data.cast <- dcast(data, x + score ~ gender, value.var = "y")

chart3_10 <- rPlot(
  x = "M",
  y = "F",
  data = data.cast,
  type = 'point',
  size = list( const = 1)
)
chart3_10$facet(
  type = "wrap",
  var = list( var = "score", levels = sort( unique( Chem97$score ) ) ),
  rows = 2
)
#give name for x and y axis to match example
chart3_10$guides(
  x = list( title = "Standard Normal Quantiles" ),
  y = list( title = "Average GCSE Score" )
)
chart3_10
