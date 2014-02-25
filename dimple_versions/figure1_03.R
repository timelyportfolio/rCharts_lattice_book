#Figure 1.3
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top
#http://lmdvr.r-forge.r-project.org/figures/images/Figure_01_03_stdBW.png

#just like 1.2 except no | 

#should javascript do the density tranformation

require(rCharts)

data(Chem97, package = "mlmRev")

#lattice plot
densityplot(~ gcsescore, data = Chem97, groups = score,
            plot.points = FALSE, ref = TRUE,
            auto.key = list(columns = 3))

density.data <- data.frame()

scores = unique(Chem97$score)
scores = scores[order(scores)]

for (i in 1:length(scores)) {
  tempdensity <- density(Chem97[which(Chem97$score == scores[i]),]$gcsescore)
  density.data <- rbind(density.data,
                        cbind(rep(scores[i],length(tempdensity$x)),
                                  tempdensity$x,
                                  tempdensity$y)
  )
}
colnames(density.data) <- c("score","x","y")

d1_3 <- dPlot(
  y ~ x,
  groups = c("score"),#,"id"),
  data = data.frame(id=1:nrow(density.data),density.data),
  type = "line",
  legend = list()
)
d1_3$xAxis(
  type = "addMeasureAxis"
)
d1_3$legend(
  x = 200,
  y = 10,
  width = 400,
  height = 20,
  horizontalAlign = "right"
)
d1_3


chart1_3 <- rPlot(y ~ x,
  color = "bin(score,1)",
  data = density.data,
  type = "line")
chart1_3$guides(
  x = list( title = "gcsecore"),
  y = list( title = "Density" )
)
chart1_3
