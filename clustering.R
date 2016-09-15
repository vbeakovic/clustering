#### Libraries ####
library(ggplot2)
#### Data ####
n = 100
g = 6 
set.seed(g)
d <- data.frame(x = unlist(lapply(1:g, function(i) rnorm(n/g, runif(1)*i^2))), 
                y = unlist(lapply(1:g, function(i) rnorm(n/g, runif(1)*i^2))))

#### First plot ####
ggplot(d, aes(x = x, y = y), color = "blue") + 
        geom_point()


