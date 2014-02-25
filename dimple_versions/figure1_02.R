#Figure 1.2
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

##should javascript do the density tranformation

require(rCharts)
require(lattice)

data(Chem97, package = "mlmRev")


densityplot(~ gcsescore | factor(score), data = Chem97, 
            plot.points = FALSE, ref = TRUE)

#yes there are better ways to do this
#however I thought this might
#be more understandable
scores <- sort(unique(Chem97$score))

density.data <- data.frame()

for (i in 1:length(scores)) {
  tempdensity <- density(
    Chem97[which(Chem97$score == scores[i]),]$gcsescore
  )
  density.data <- rbind(
    density.data,
    cbind(rep(scores[i],length(tempdensity$x)),
    tempdensity$x,
    tempdensity$y
  )
  )
}
colnames(density.data) <- c("score","x","y")

#this would be another way of achieving the same data
require(dplyr);require(plyr)
density.data <- do.call(rbind,lapply(
  sort(unique(Chem97$score)),
  FUN = function(x){
    ddata <- density(
      (Chem97 %.% filter(score == x) %.% select(gcsescore)
       )[,1]
    )
    return(data.frame(
      score = rep( x, length(ddata$x) ),
      x = ddata$x,
      y =ddata$y
    ))
  }
))
  


d1_2 <- dPlot(
  y ~ x,
  groups = c("score","id"),
  data = data.frame(id=1:nrow(density.data),density.data),
  type = "line"
)
d1_2$xAxis(
  type = "addMeasureAxis",
  overrideMin = min(density.data$x),
  overrideMax = max(density.data$x)
)
d1_2$yAxis(
  overrideMin = 0,
  overrideMax = max(density.data$y)
)
#d1_2 this is actually 1_3


#add facets
d1_2$params$facet = list( x = "score" )
d1_2$templates$script = "./chartFacet_d3grid.html"
d1_2

#specify nrow and ncol explicitly
d1_2$params$facet <- modifyList(
  d1_2$params$facet,
  list(nrow = 2, ncol=3)
)
#since cdn for d3-grid not specified yet in config.yml
d1_2$addAssets(
  "http://timelyportfolio.github.io/rCharts_dimple_systematic/libraries/widgets/dimple/js/d3-grid.js"
)
d1_2


#polycharts version
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