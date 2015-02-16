complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        ## the same as part 1 iwth small changes
  nobs <- numeric()
  for (i in id) {
    dataalm <- read.csv(paste(directory, "/", formatC(i, flag = "0", width = 3), 
                              ".csv", sep = ""))
    ##counteraki <- c(counteraki, dataalm[[pollutant]])
    nobs <- c(nobs, sum(complete.cases(dataalm))) 
    ##complete's cases in counteraki
    ##renaming counteraki to nobs
  }
  #here can be the data frame :D
  completed <- (data.frame(id, nobs))
  return(completed)
  

}