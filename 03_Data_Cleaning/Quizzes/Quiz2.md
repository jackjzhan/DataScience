# Data Cleaning Quiz 2 (JHU) Coursera
## Taken by Jack Zhan
## 01/23/2018

Question 1
----------
Register an application with the Github API here https://github.com/settings/applications. Access the API to get information on your instructors repositories (hint: this is the url you want "https://api.github.com/users/jtleek/repos"). Use this data to find the time that the datasharing repo was created. What time was it created?
This tutorial may be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). You may also need to run the code in the base R package and not R studio.
* 2012-06-20T18:39:06Z
* 2012-06-21T17:28:38Z
* 2013-08-28T18:18:50Z
* 2013-11-07T13:25:07Z

Solution: </br>
```R
library(httr)
myapp <- oauth_app("github",
  key = "229c3ea16604cf65e96d",
  secret = "444ec638fe827140c8a9c3bb4c9dac733b0b2de7")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)

json1 = content(req)
json2 = jsonlite::fromJSON(toJSON(json1))
head(json2)
json2[json2$full_name == "jtleek/datasharing",]$created_at
#2013-11-07T13:25:07Z
```

Question 2
----------
The sqldf package allows for execution of SQL commands on R data frames. We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL.
Download the American Community Survey data and load it into an R object called
```R
acs
```
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?
* sqldf("select pwgtp1 from acs where AGEP < 50")
* sqldf("select * from acs where AGEP < 50")
* sqldf("select * from acs")
* sqldf("select pwgtp1 from acs")

Solution: </br>
```R
library(sqldf)
acs <- read.table("getdata%2Fdata%2Fss06pid.csv",header=T,sep=",")
sqldf("select pwgtp1 from acs where AGEP < 50")
```

Question 3
----------
Using the same data frame you created in the previous problem, what is the equivalent function to unique(acs$AGEP)
* sqldf("select distinct pwgtp1 from acs")
* sqldf("select unique * from acs")
* sqldf("select distinct AGEP from acs")
* sqldf("select AGEP where unique from acs")

Solution: </br>
sqldf("select distinct AGEP from acs")

Question 4
----------
Read this data set into R and report the sum of the numbers in the fourth of the nine columns.
https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for
Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for
(Hint this is a fixed width file format)
* 222243.1
* 35824.9
* 32426.7
* 101.83
* 36.5
* 28893.3

Solution: </br>
```R
tryCatch({
  dat <- url("http://biostat.jhsph.edu/~jleek/contact.html")
  html <- readLines(dat)
}, finally = {
  close(dat)
})
sapply(c(10,20,30,100), function(x) nchar(html[[x]]))
#45 31  7 25
```

Question 5
----------
Read this data set into R and report the sum of the numbers in the fourth of the nine columns.
https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for
Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for
(Hint this is a fixed width file format)
* 222243.1
* 35824.9
* 32426.7
* 101.83
* 36.5
* 28893.3

Solution: </br>
```R
dat <- read.fwf(file = "getdata%2Fwksst8110.for", widths = c(15, 4, 1, 3, 5, 4), header = FALSE, sep = "\t", skip = 4)
sum(dat$V6) 
#32426.7
```