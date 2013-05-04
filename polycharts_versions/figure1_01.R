#Figure 1.1
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

#missing % of total rather than count

require(rCharts)

data(Chem97, package = "mlmRev")
#not necessary but include since in example
xtabs( ~ score, data = Chem97)

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