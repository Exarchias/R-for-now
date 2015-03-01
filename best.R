##Write a function called best that take two arguments: the 2-character abbreviated name of a state and an
##outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector
##with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome
##in that state. 

best <- function(state, outcome) {
  
  ## Read outcome data
  data <- read.csv("./rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character", na.strings="Not Available")
  
  ## Check that state and outcome are valid
  validoutcome <- c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validoutcome) { stop("invalid outcome")}
  
  validstate <- unique(data[,7])
  if (!state %in% validstate) stop("invalid state")
  
  ## convert outcome name into column name
  fullcoltext <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  col <- fullcoltext[match(outcome,validoutcome)]
  
  ## Return hospital name in that state with lowest 30-day death rate
  data.state <- data[data$State==state,]
  definer <- which.min(as.double(data.state[,col]))
  data.state[definer,"Hospital.Name"]
}
