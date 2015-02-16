pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  dataalm <- read.csv(c(as.character(directory),"/",as.character(id),".csv") )

  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
 pollutantalm <- dataalm$pollutant

  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
idalm <- pollutantalm[id]
NAalm <- is.na(idalm)
noNAalm <- idalm[!noNAalm]
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
 #return(mean)
}