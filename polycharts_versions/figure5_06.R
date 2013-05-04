#Figure 5.6
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

#same as 5.5 except adds a gradient legend
#believe possible but now sure how to accomplish yet


require(rCharts)
require(ggplot2)  #use for ggplot2 cut_number function


#copy from lattice example
#depth.col <- gray.colors(100)[cut(quakes$depth, 100, label = FALSE)]

quakes$Magnitude <- cut_number(quakes$mag, 4)

#add cut to facet as in example
#appears gradient scale wants a numeric value so we will convert
quakes$cuts <- as.numeric ( cut( quakes$depth, 3 ) ) - 1

chart5_6 <- rPlot(
  lat ~ long,
  color = "bin(cuts,1)",
  data = quakes,
  type = 'point',
  size = list( const = 2)
)
#appears gradient scale wants a numeric value
chart5_6$guides(
  color = list(
    labels = levels( cut( quakes$depth, 3 ) ),
    numticks = length( unique ( quakes$cuts ) ),
    scale = list(
      type = 'gradient',
      lower = '#CCC',
      upper = '#000'
    )
  )
)
chart5_6$facet(
  type = "wrap",
  cols = 2,
  var = list(
    var = "Magnitude",
    levels = sort( unique( quakes$Magnitude ) ) 
  )
)
chart5_6
