# R Programming (JHU) Coursera
## Written by Jack Zhan
## 01/22/2018

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  for (i in id) {
    end <- sprintf("/%03d",i)
    fpath <- paste(directory,end,".csv", sep = "")
    x <- read.csv(fpath)
    x <- x[[pollutant]]
    good <- complete.cases(x)
    output <- append(output,x[good])
  }
  mean(output)
}

setwd("C:/git/DataScience/02_R_Programming/Dataset")
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")
