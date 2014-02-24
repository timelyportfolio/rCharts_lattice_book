#Figure 5.3
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top


require(rCharts)

#add cut to facet as in example
quakes$cuts <- cut( quakes$depth, 3 )

chart5_3 <- rPlot(
  lat ~ long,
  color = "cuts", 
  data = quakes,
  type = 'point',
  size = list( const = 2)
)
#position does not work as I would expect
chart5_3$guides(
  color = list(
    levels = sort( unique( quakes$cuts ) ),
    position = "top"
  )
)
chart5_3
