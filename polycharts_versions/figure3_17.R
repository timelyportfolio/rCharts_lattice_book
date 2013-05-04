#Figure 3.17
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

require(rCharts)

#get residuals
lm.mod <- lm(formula = yield ~ variety + year + site, data = barley)
barley$residuals <- sqrt(abs(residuals(lm.mod)))

#add jitter to x
barley$sitejitter <- as.numeric( barley$site ) - 1
barley$sitejitter <- barley$sitejitter + runif( n = nrow(barley), min = -0.1, max = 0.1)

#add numeric site
barley$sitenumber <- as.numeric( barley$site ) - 1

chart3_17 <- rPlot(
  x = "sitejitter",
  y = "residuals",
  data = barley,
  color = "bin(year,1)",
  type = 'point',
  size = list( const = 3)
)
chart3_17$layer(
  x = "sitenumber",
  y = "median(residuals)",
  data = barley,
  type = "line",
  copy_layer = TRUE  
)
chart3_17$guides(
  color = list(
    numticks = 2,
    title = "Year"
  ),
  x =  list(
    labels = levels(barley$site),
    title = ""
  ),
  y = list (title = "sqrt(abs(Residual Barley Yield))")
)
chart3_17
