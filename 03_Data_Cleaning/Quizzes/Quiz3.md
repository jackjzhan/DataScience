# Data Cleaning Quiz 3 (JHU) Coursera
## Taken by Jack Zhan
## 01/23/2018

Question 1
----------
The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
and load the data into R. The code book, describing the variable names is here:
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products. Assign that logical vector to the variable agricultureLogical. Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE.
which(agricultureLogical)
What are the first 3 values that result?
* 236, 238, 262
* 59, 460, 474
* 403, 756, 798
* 125, 238,262

Solution: </br>
```R
agricultureLogical= with(dat, ACR == 3 & AGS == 6)
which(agricultureLogical)
#125  238  262
```

Question 2
----------
Using the jpeg package read in the following picture of your instructor into R
https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg
Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? (some Linux systems may produce an answer 638 different for the 30th quantile)
* -14191406 -10904118
* -10904118 -10575416
* -15259150 -594524
* -15259150 -10575416

Solution: </br>
```R
library(jpeg)
jp <- readJPEG("getdata%2Fjeff.jpg", native = TRUE)
quantile(jp,probs = c(.30, .80))
#-15259150 -10575416 
```

Question 3
----------
Load the Gross Domestic Product data for the 190 ranked countries in this data set:
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
Load the educational data from this data set:
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). What is the 13th country in the resulting data frame?
Original data sources:
http://data.worldbank.org/data-catalog/GDP-ranking-table
http://data.worldbank.org/data-catalog/ed-stats
* 189 matches, 13th country is St. Kitts and Nevis
* 234 matches, 13th country is Spain
* 190 matches, 13th country is St. Kitts and Nevis
* 234 matches, 13th country is St. Kitts and Nevis
* 189 matches, 13th country is Spain
* 190 matches, 13th country is Spain

Solution: </br>
```R
gdp = fread("getdata%2Fdata%2Fgdp.csv", skip=4, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "GDP", "Total"))
edu = fread("getdata%2Fdata%2FEDSTATS_Country.csv")
merge = merge(gdp, edu, by = 'CountryCode')
nrow(merge)
#189
arrange(merge, desc(Rank))[13, "GDP"]
#St. Kitts and Nevis
```

Question 4
----------
What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
* 30, 37
* 23, 30
* 32.96667, 91.91304
* 23, 45
* 23.966667, 30.91304
* 133.72973, 32.96667

Solution: </br>
```R
tapply(merge$Rank, merge$`Income Group`, mean)
#High income: nonOECD    High income: OECD           Low income  Lower middle income  Upper middle income 
#            91.91304             32.96667            133.72973            107.70370             92.13333 
```
Question 5
----------
Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries
are Lower middle income but among the 38 nations with highest GDP?
* 1
* 0
* 5
* 13

Solution: </br>
```R
library(Hmisc)
merge$RankGroups <- cut2(merge$Rank, g=5)
table(merge$RankGroups, merge$`Income Group`)
#5
```