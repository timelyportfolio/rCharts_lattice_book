#Figure 1.1
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top
#http://lmdvr.r-forge.r-project.org/figures/figures.html

require(rCharts)
require(lattice)
require(plyr)
require(dplyr)

data(Chem97, package = "mlmRev")
#not necessary but include since in example
xtabs( ~ score, data = Chem97)

lattice_plot <- histogram(~ gcsescore | factor(score), data = Chem97)

#get bins like a histogram for use with dplyr
bins <- pretty(Chem97$gcsescore,n=20)
#one solution with ddply and dplyr
plotdata <- ddply(
  Chem97 %.%
    mutate(gcsescore = bins[findInterval(
      gcsescore,
      bins)
    ]) %.%
    group_by(score,gcsescore) %.%  
    dplyr::summarise(count = length(gcsescore))
  ,.(score,gcsescore)
  ,summarise
  ,count = sum(count,na.rm=F),
  .drop = F
)
#another solution with lapply and dplyr
plotdata <- do.call(rbind,lapply(
  sort(unique(Chem97$score)),
  function(x){
    temp <- hist(
      (Chem97 %.% filter( score ==x ) %.% select(gcsescore))[,"gcsescore"],
      breaks = bins,
      plot=FALSE
    )
    return(data.frame(
      score = rep(x,length(temp$mids)),
      gcsescore = temp$breaks[-1],
      count = temp$density
    ))
  }
))


#make the plot
d1_1 <- dPlot(
  count ~ gcsescore,
  data = plotdata,
  groups = c("score"), #,"gcsescore"),
  type = "bar",
  height = 700,
  width = 800
)
d1_1$params$facet = list( x = "score" )
d1_1$yAxis(
  overrideMin = 0,
  overrideMax = max(plotdata$count),
  outputFormat = ".2%"
)
d1_1$templates$script = "./chartFacet_d3grid.html"
d1_1

#specify nrow and ncol explicitly
d1_1$params$facet <- modifyList(
  d1_1$params$facet,
  list(nrow = 2, ncol=3)
)
d1_1$addAssets(
  "http://timelyportfolio.github.io/rCharts_dimple_systematic/libraries/widgets/dimple/js/d3-grid.js"
)
d1_1


#polycharts version
chart1_1 <- rPlot(
  x = "bin(gcsescore,0.5)",
  y = "count(student)",
  data = Chem97,
  type = "bar" )
chart1_1$facet(
  type = "wrap",
  var = list(var = "score", levels = sort(unique(Chem97$score)))
)
chart1_1$guides(
  x = list( title = "gcsecore" ),
  y = list( title = "Count of Students" )
)
chart1_1