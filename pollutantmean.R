pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## i need to make the id an array.
  ## the location of the CSV files
  counteraki <- numeric()
  for (i in id) {
    dataalm <- read.csv(paste(directory, "/", formatC(i, flag = "0", width = 3), 
                              ".csv", sep = ""))
  counteraki <- c(counteraki, dataalm[[pollutant]])
                }
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  nonaalm <- (mean(counteraki, na.rm = T))
  return(nonaalm)
    ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
}