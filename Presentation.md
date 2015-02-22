European reserves by country
========================================================
author: Matthieu
date: 



========================================================
The datasource is provide by : www.data.gouv.fr

This data include 
- 28 countries
- during 14 years (2000-03-31 to 2014-03-31)


data's preparation
========================================================
I transformed the sources (Excel format to csv) before work with it. because I need to use a external library and I'm not sure to be used it on all provider.

but if you would like to used the original data you can used 

```r
library(gdata)
```
with this methods
```r
con <- xls2csv("european-reserves-by-country.xls")
data <- read.csv2(summary(con)$description)
file.remove(summary(con)$description)

or read.xlsx
```

Option to used the app
=======================================================
you have two options :
- see the evolution for all period
- select a period 



Result with the app.
========================================================
you can see the gold's reserve of a country, during a period. 
by example : Evolution of the French reserve during 2 years 2005 to 2007

Summary

```
      date                France 
 Min.   :2005-03-31   2719.76:1  
 1st Qu.:2005-09-07   2757.58:1  
 Median :2006-02-14   2776.06:1  
 Mean   :2006-02-13   2802.12:1  
 3rd Qu.:2006-07-23   2825.79:1  
 Max.   :2006-12-31   2889.46:1  
                      (Other):2  
```
Result with the app.
========================================================
Graph result.

![plot of chunk unnamed-chunk-3](Presentation-figure/unnamed-chunk-3-1.png) 

