#Figure 4.6
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)
require(reshape2)

data( postdoc, package = "latticeExtra")

#get data in form that the example uses and then melt it
data = melt(data.frame(prop.table(postdoc,margin=1)))
colnames( data )[4] <- "Proportion"

chart4_6 <- rPlot(
  Field ~ Proportion,
  data = data,
  type = 'point',
  size = list( const = 3)
)
chart4_6$facet(
  type = "wrap", 
  rows =2,
  var = list( var = "Reason"),
  levels = unique( data$Reason )
)
chart4_6$guides(
  y = list( numticks = length ( unique (data$Field ) ) )
)
chart4_6
