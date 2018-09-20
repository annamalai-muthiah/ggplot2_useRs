
# Install required packages and datasets:

library(mapdata)
library(tidyverse)
library(viridis)
library(cowplot)
library(ggbeeswarm)
library(devtools)
devtools::install_github('thomasp85/gganimate')
diamonds <- ggplot2::diamonds
data(iris)
data("mpg")


## Aesthetic mappings example - colors:

ggplot(diamonds, mapping = aes(x = carat, y = price, col = cut)) +
    geom_point()


## Geom example - 3 diamonds & a map:

p1 <- ggplot(diamonds, aes(x = carat, y = price, col = cut)) +
    geom_point()

p2 <- ggplot(diamonds, aes(x = carat)) +
    geom_density()

usa <- map_data("usa")

p3 <- ggplot(usa, aes(long, lat, group = group)) + 
    geom_polygon(fill = "white", colour = "black")

p4 <- ggplot(diamonds, aes(x = cut, y = carat)) +
    geom_boxplot()

cowplot::plot_grid(plotlist = list(p1, p2, p3, p4))


# Geom bar example:

ggplot(diamonds, aes(cut)) +
    geom_bar()


# Geom col example:

ggplot(diamonds, aes(carat, price)) +
    geom_col()


# Jitter position example:

ggplot(mpg, mapping = aes(x = displ, y = hwy)) +
    geom_point()

ggplot(mpg, mapping = aes(x = displ, y = hwy)) +
    geom_point(position = "jitter")


# Coxcomb example

ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
    geom_bar()

ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
    geom_bar() +
    coord_polar()


# Facet wrap example:

ggplot(diamonds, aes(x = price)) +
    geom_histogram(binwidth = 1000) +
    facet_wrap(~cut)


# ggpairs example:

small_diamonds <- sample_n(diamonds, 1000)
ggpairs(small_diamonds, columns = c(1:6))

# beeswarm and cowplot example:

cowplot::plot_grid(
    ggplot(small_diamonds, aes(carat, price, color = cut)) +
        geom_point(alpha = .5),
    ggplot(small_diamonds, aes(cut, price)) +
        geom_quasirandom(alpha = .1)
)