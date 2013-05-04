#Figure 2.6
#http://www.amazon.com/Lattice-Multivariate-Data-Visualization-Use/dp/0387759689/ref=cm_cr_pr_product_top

#facet not really correct

data(Oats, package = "MEMSS")


chart2_6 <- rPlot(variety ~ yield | site,
                  data = barley,
                  color = "year",
                  type = 'point',
                  size = list(const = 3),
                  width = 300,
                  height = 900)
chart2_6$guides(y = list(numticks = length(unique(barley$variety))),
                color =  list(numticks = 2,
                    levels = unique(barley$year) #,
#####fix this once implemented
#                              formatter = '#! function(object){return object} !#'
                    )
                )
chart2_6$facet(cols = 1)
chart2_6
