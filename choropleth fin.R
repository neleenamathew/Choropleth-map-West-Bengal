install.packages("sp")
install.packages("RColorBrewer")
install.packages("ggmap")
install.packages("zoo")
install.packages("colorspace")
install.packages("raster")
library(ggplot2)
library(dplyr)
library(leaflet)
library(mapview)
library(ggmap)
library(sp)
library(RColorBrewer)
library(colorspace)
library(raster)

#wrt states

#plotting the map of West Bengal
wb1 = (ind1[ind1$NAME_1=="West Bengal",])
spplot(kr1,"NAME_1", col.regions=rgb(0,0,1), main = "West Bengal, India",scales=list(draw=T), colorkey =F)

#loading district data
ind2=map2

#plotting the map of WB Districts
wb2 = (ind2[ind2$NAME_1=="West Bengal",])
spplot(wb2,"NAME_1", main = "West Bengal Districts", colorkey =F)

#coloring the districts with rainbow colours
wb2$NAME_2 = as.factor(wb2$NAME_2)
col = rainbow_hcl(length(levels(wb2$NAME_2)))
mycol = c(Red =4.9,Blue =11.03, white = 6.5, lightblue = 0, pink = 1.5)
spplot(wb2,"NAME_2",  col.regions=mycol, colorkey=T)
View(wbdata)
na.omit(wbdata)
View(wbdata)

#using data to demartcate districts and plotting them
wb2$NAME_2 = as.factor(wb2$NAME_2)
wbdata$PER=as.factor(wbdata$PER)
spplot(wb2,"NAME_2",  col.regions=rgb(0,wbdata$PER,0,maxColorValue = 100), colorkey=T)
ramp <- colorRamp(c("red", "white"))

spplot(wb2,"NAME_2",  col.regions=rgb( ramp(seq(0,1,length = 5)), max = 255), colorkey=T)





