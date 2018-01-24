# Data Cleaning Quiz 1 (JHU) Coursera
## Taken by Jack Zhan
## 01/23/2018

Question 1
----------
The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
and load the data into R. The code book, describing the variable names is here:
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
How many properties are worth $1,000,000 or more?
* 25
* 2076
* 164
* 53

Solution: </br>
```R
setwd("C:/git/datasciencecoursera/03_Data_Cleaning/Dataset")
dat <- read.table("getdata%2Fdata%2Fss06hid.csv",header=T,sep=",")
nrow(dat[which(dat$VAL==24),])
#53
```

Question 2
----------
Use the data you loaded from Question 1. Consider the variable FES in the code book. Which of the "tidy data" principles does this variable violate?
* Each variable in a tidy data set has been transformed to be interpretable.
* Numeric values in tidy data can not represent categories.
* Tidy data has no missing values.
* Tidy data has one variable per column.

Solution: </br>
Tidy data has one variable per column.

Question 3
----------
Download the Excel spreadsheet on Natural Gas Aquisition Program here:
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
```R
dat
```
What is the value of:
```R
sum(dat$Zip*dat$Ext,na.rm=T)
```
* 36534720
* 154339
* 33544718
* NA

Solution: </br>
```R
library(xlsx)
dat <- read.xlsx("getdata%2Fdata%2FDATA.gov_NGAP.xlsx", 1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)
#36534720
```

Question 4
----------
Read the XML data on Baltimore restaurants from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
How many restaurants have zipcode 21231?
* 130
* 181
* 100
* 127

Solution: </br>
```R
library(XML)
dat <- xmlParse("getdata%2Fdata%2Frestaurants.xml") 
length(xpathApply(dat, "//zipcode[text()='21231']", xmlValue))
#127
```