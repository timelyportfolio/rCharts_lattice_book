#Figure 4.7
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

#sort on proportion within facet not working

require(rCharts)
require(reshape2)
require(plyr)

data( postdoc, package = "latticeExtra")

#get data in form that the example uses and then melt it
data = melt(data.frame(prop.table(postdoc,margin=1)))
colnames( data )[4] <- "Proportion"

chart4_7 <- rPlot(
  y = list(
    var = "Field",
    sort = "Proportion"
  ),
  x = "Proportion",
  data = data,
  type = 'point',
  size = list( const = 3)
)
chart4_7$facet(
  type = "wrap", 
  cols = 1,
  var = list( var = "Reason"),
  levels = levels(
    ddply(data, .(Reason), summarize, med = median(Proportion))$Reason
  )
)
chart4_7$guides(
  y = list(
    numticks = length ( unique (data$Field ) )
  )
)
chart4_7
