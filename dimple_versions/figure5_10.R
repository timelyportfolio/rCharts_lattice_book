#Figure 5.10
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)
require(locfit)

data(Earthquake, package = "MEMSS")

require(ggplot2)  #use for ggplot2 cut_number function
Earthquake$Magnitude <- cut_number(Earthquake$Richter, 3)

#get log2
Earthquake$accel <- log2( Earthquake$accel )
Earthquake$distance <- log2( Earthquake$distance )

chart5_10 <- rPlot(
  accel ~ distance,
  data = Earthquake,
  type = 'point',
  size = list( const = 2)
)
#get loess for smoothing but with Magnitude for facet
smoothing <- ddply(Earthquake,
  .(Magnitude),
  function(df) data.frame(loess.smooth(x=df$distance,y=df$accel))
)
chart5_10$facet(
  type = "wrap",
  rows = 1,
  var = list(
    var = "Magnitude",
    levels = sort( unique (Earthquake$Magnitude) ) 
  )
)
#add loess smoothing line as layer
chart5_10$layer(
  x = "x",
  y = "y",
  data = smoothing,
  type = "line"
)
#add locfit coefficients also
#not perfect but I think good enough
coef <- coef(lm(accel ~ distance, data = Earthquake))
coef.line <- smoothing
coef.line$y <- coef.line$x * coef["distance"] + coef["(Intercept)"]
chart5_10$layer(
  x = "x",
  y = "y",
  data = coef.line,
  type = "line",
  color = list( const = "black")
)
chart5_10$guides(
  x = list(
    title = "Distance From Epicenter (km)"#,
#####fix this once implemented
#    formatter = 'function(x) {return "2^" + x}'
  ),
  y = list(
    title = "Maximum Horizontal Acceleration (g)"#,
#####fix this once implemented    
#    formatter = 'function(y) {return "2^" + y}'
  )
)
chart5_10


