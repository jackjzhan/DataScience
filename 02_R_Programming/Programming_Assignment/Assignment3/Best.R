# R Programming (JHU) Coursera
## Written by Jack Zhan
## 01/22/2018

best <- function(state, outcome) {
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
  ## Return hospital name in that state with lowest 30-day death rate
  df = dat[dat$State == state, c(2, col)]
  #df[which.min(df[, 2]), 1]
  df = df[df[2] != "Not Available", 1:2]
  df[which.min(df[, 2]), 1]
}

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
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")
