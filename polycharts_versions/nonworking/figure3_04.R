#Figure 3.4
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

#does not work
#polycharts bar type wants to bin

require(rCharts)
data(gvhd10, package = "latticeExtra")

gvhd10$FSC.H <- log(gvhd10$FSC.H)

#get density data for the plot
density.data <- data.frame( )

days <- levels(unique(gvhd10$Days))

for (i in 1:length(days)) {
  tempdensity <- density(gvhd10[which(gvhd10$Days == days[i]),]$FSC.H)
  density.data <- rbind(density.data,
                        cbind(rep(days[i],length(tempdensity$x)),
                              tempdensity$x,
                              tempdensity$y)
  )
}
colnames(density.data) <- c("Days","x","y")


chart3_4 <- rPlot(
  y ~ x,
  data = density.data,
  type = 'bar'
)
chart3_4$coord( type = "cartesian" )
chart3_4$facet( 
  type = "wrap",
  var = "Days",
  cols = 2 )
#give name for x and y axis to match example
chart3_4$guides(
  x = list( title = "log(FSC.H)" ),
  y = list( title = "Density" )
)
chart3_4
