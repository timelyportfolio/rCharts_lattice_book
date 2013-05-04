#Figure 1.2
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

##should javascript do the density tranformation

require(rCharts)

data(Chem97, package = "mlmRev")

scores <- unique(Chem97$score)
scores <- scores[order(scores)]

density.data <- data.frame()

for (i in 1:length(scores)) {
  tempdensity <- density(Chem97[which(Chem97$score == scores[i]),]$gcsescore)
  density.data <- rbind(density.data,
                        cbind(rep(scores[i],length(tempdensity$x)),
                              tempdensity$x,
                              tempdensity$y)
  )
}
colnames(density.data) <- c("score","x","y")

chart1_2 <- rPlot(
  x = "x",
  y = "y",
  color = "score",
  data = density.data,
  type = "line" )
chart1_2$facet(
  type = "wrap",
  var = list(var = "score", levels = scores)
)
chart1_2$guides(
  x = list( title = "gcsecore" ),
  y = list( title = "Density" )
)
chart1_2