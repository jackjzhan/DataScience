# R Programming (JHU) Coursera
## Written by Jack Zhan
## 01/22/2018

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  output <- matrix(nrow = 0, ncol=2)
  for (i in id){
    end <- sprintf("/%03d",i)
    fpath <- paste(directory,end,".csv", sep = "")
    data <- read.csv(fpath)
    data <- data[,2:3]
    good <- complete.cases(data)
    output <- rbind.data.frame(output,c(i,sum(good, na.rm=TRUE)))
  }
  colnames(output) <- c("id","nobs")
  output
}

setwd("C:/git/datasciencecoursera/02_R_Programming/Dataset")

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
