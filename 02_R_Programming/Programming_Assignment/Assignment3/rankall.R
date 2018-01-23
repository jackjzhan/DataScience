rankall <- function(outcome, num = "best") {
  ## Read the outcome data
  dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  states = unique(dat[, 7])
  switch(outcome, 'heart attack' = {
    col = 11
  }, 'heart failure' = {
    col = 17
  }, pneumonia = {
    col = 23
  }, stop("invalid outcome"))
  
  ## Return hospital name in that state with the given rank 30-day death rate
  #dat[, col] = as.numeric(dat[, col])
  dat = dat[, c(2, 7, col)]  # leave only name, state, and death rate
  dat = dat[dat[3] != "Not Available", 1:3]
  dat[, 3] = as.numeric(dat[, 3])
  rank_in_state <- function(state) {
    df = dat[dat[, 2] == state, ]
    nhospital = nrow(df)
    switch(num, best = {
      num = 1
    }, worst = {
      num = nhospital
    })
    if (num > nhospital) {
      result = NA
    }
    o = order(df[, 3], df[, 1])
    result = df[o, ][num, 1]
    c(result, state)
  }
  output = do.call(rbind, lapply(states, rank_in_state))
  output = output[order(output[, 2]), ]
  rownames(output) = output[, 2]
  colnames(output) = c("hospital", "state")
  data.frame(output)
}
head(rankall("heart attack", 20), 10)