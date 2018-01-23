rankhospital <- function(state, outcome, num = "best") {
  
  ## Read the outcome data
  dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if (!state %in% unique(dat[, 7])) {
    stop("invalid state")
  }
  switch(outcome, 'heart attack' = {
    col = 11
  }, 'heart failure' = {
    col = 17
  }, pneumonia = {
    col = 23
  }, stop("invalid outcome"))
  df = dat[dat[, 7] == state, c(2, col)]
  df = df[df[2] != "Not Available", 1:2]
  df[, 2] = as.numeric(df[, 2])
  nhospital = nrow(df)
  switch(num, best = {
    num = 1
  }, worst = {
    num = nhospital
  })
  if (num > nhospital) {
    return(NA)
  }
  ## Return hospital name in that state with the given rank 30-day death rate
  
  o = order(df[, 2], df[, 1])
  df[o, ][num, 1]
}

setwd("C:/git/DataScience/02_R_Programming/Dataset/Programming_Assignment_3_Data")
rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)
