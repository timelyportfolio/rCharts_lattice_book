#Figure 5.18
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top


#don't think possible but here is the start

mtcars.melt <- melt( data.frame( cbind ( rownames(mtcars), mtcars[c(1, 2, 3, 4, 5, 6, 7, 11)] ) ),
                     id.vars = c(1, 3, 9) )
colnames( mtcars.melt )[1] <- "model"

chart5_18 <- rPlot(
  variable ~ value | cyl,
  color = "carb", 
  data = mtcars.melt,
  type = "point",
  size = list( const = 2)
)
chart5_18