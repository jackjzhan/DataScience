# R Programming (JHU) Coursera
## Written by Jack Zhan
## 01/22/2018

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  begin <- paste(directory, "/",sep = "")
  fnames <- dir(begin, pattern = ".csv")
  output <- numeric()
  for (i in 1:length(fnames)){
    data <- read.csv(paste(begin, fnames[i], sep = ""))
    data <- data[,2:3]
    good <- complete.cases(data)
    if (sum(good, na.rm=TRUE) > threshold) {
        data = data[good,]
      output = append(output, cor(data[,1], data[,2]))
    }
  }
  output
}

setwd("C:/git/datasciencecoursera/02_R_Programming/Dataset")
cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
