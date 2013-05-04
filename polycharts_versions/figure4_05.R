#Figure 4.5
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)
require(reshape2)

data( postdoc, package = "latticeExtra")

#get data in form that the example uses and then melt it
data = melt(data.frame(prop.table(postdoc,margin=1)))
colnames( data )[4] <- "Proportion"

chart4_5 <- rPlot(
  Proportion ~ Field,
  data = data,
  type = 'bar',
  color = "Reason"
)
chart4_5$coord( type = "cartesian", flip = TRUE )
chart4_5$guides(
  y = list( numticks = length ( unique (data$Field ) ) ),
  color = list( 
    numticks = length( unique (data$Reason) ),
    levels = unique( data$Reason )
  )
)
chart4_5
