#Figure 5.4
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

#colors not working as in example

require(rCharts)

#copy from lattice example
depth.col <- gray.colors(100)[cut(quakes$depth, 100, label = FALSE)]
quakes$color <- paste0("#",substr(depth.col,4,7))

#add cut to facet as in example
#appears gradient scale wants a numeric value so we will convert
quakes$cuts <- as.numeric ( cut( quakes$depth, 3 ) ) - 1

chart5_4 <- rPlot(
  lat ~ long,
  color  = "bin( cuts, 1 )",
  #doesn't work as expected color = "color",
  data = quakes,
  type = 'point',
  size = list( const = 2)
)
#appears gradient scale wants a numeric value
chart5_4$guides(
  color = list(
    labels = levels( cut( quakes$depth, 3 ) ),
    numticks = length( unique ( quakes$cuts ) ),
    scale = list( #type = "identity") does not work
      type = 'gradient',
      lower = '#CCC',
      upper = '#000'
    )
  )
)
chart5_4
