##The function reads the outcome-of-care-measures.csv file and returns a character vector with the name
##of the hospital that has the ranking specified by the num argument.


rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("./rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character",na.strings="Not Available")
  
  ## Check that state and outcome are valid
  validoutcome <- c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validoutcome) { stop("invalid outcome")}
  
  validstate <- unique(data[,7])
  if (!state %in% validstate) stop("invalid state")
  

  fullcoltext <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  col <- fullcoltext[match(outcome,validoutcome)]
  
  ## Return hospital name in that state with the given rank 30-day death rate
  data.state <- data[data$State==state,]
  sorted.data.state <- data.state[order(as.numeric(data.state[[col]]),data.state[["Hospital.Name"]],decreasing=F,na.last=NA), ]  
  if (num=="best") num <- 1
  if (num=="worst") num <- nrow(sorted.data.state)  
  sorted.data.state[num,"Hospital.Name"]
}