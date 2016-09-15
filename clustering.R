#### Libraries ####
library(ggplot2)
#### Data ####
n = 100
g = 6 
set.seed(g)
d <- data.frame(x = unlist(lapply(1:g, function(i) rnorm(n/g, runif(1)*i^2))), 
                y = unlist(lapply(1:g, function(i) rnorm(n/g, runif(1)*i^2))))

#### First plot ####
ggplot(d, aes(x = x, y = y)) + 
        geom_point(color = "blue")

#### Look for the elbow ####
mydata <- d
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(mydata,
                                     centers=i)$withinss)
ggplot(data = data.frame(x = wss), aes(x = 1:length(wss), y = x)) + 
        geom_line() + 
        geom_point(size = 3) + 
        xlab("Number of clusters") + 
        ylab("Within groups sum of squares")


