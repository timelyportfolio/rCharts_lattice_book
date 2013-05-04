#Figure 4.9
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

#not really type = "h" but use line to approximate

require(rCharts)
require(reshape2)

#directly from lattic example
data(Chem97, package = "mlmRev")
score.tab <- xtabs(~score + gender, Chem97)
score.df <- as.data.frame(score.tab)


chart4_9 <- rPlot(
  y = "Freq",
  x = "bin(score, 1)",
  data = score.df,
  color = "gender",
  type = 'bar'
)
chart4_9$coord( type = "cartesian" )
chart4_9$facet(
  type = "wrap",
  var = "gender",
  cols = 2
)
chart4_9$guides(x = list( title = "" ) )
chart4_9
