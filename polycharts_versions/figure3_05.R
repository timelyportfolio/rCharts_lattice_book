#Figure 3.5
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)
data(Chem97, package = "mlmRev")

#plyr code from Ramnath Vaidyanathan
#eases the data manipulation considerably
#calculate qnorm and quantile for each score
require(plyr)
data <- ddply(Chem97, .(score), summarize,
  x = qnorm(ppoints(100)),
  y = quantile(gcsescore, ppoints(100), names = F, type = 7, na.rm = F)
)

chart3_5 <- rPlot(
  y ~ x | score,
  data = data,
  type = 'point',
  size = list( const = 2)
)
chart3_5$facet(
  cols = 3
  )
#give name for x and y axis to match example
chart3_5$guides(
  x = list( title = "qnorm" ),
  y = list( title = "gcsescore" )
)
chart3_5
