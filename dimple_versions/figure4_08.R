#Figure 4.8
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

#not really type = "h" but use line to approximate

require(rCharts)
require(reshape2)

#directly from lattic example
data(Chem97, package = "mlmRev")
gcsescore.tab <- xtabs(~gcsescore + gender, Chem97)
gcsescore.df <- as.data.frame(gcsescore.tab)
gcsescore.df$gcsescore <- 
  as.numeric(as.character(gcsescore.df$gcsescore))

chart4_8 <- rPlot(
  Freq ~  gcsescore | gender,
  data = gcsescore.df,
  type = 'line'
)
chart4_8$facet( cols = 1)
chart4_8$guides (
  x = list ( title = "Average GCSE Score" ),
  y = list ( title = "Freq" , position = "right")
)
chart4_8
