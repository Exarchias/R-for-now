corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

  cod <- complete(directory)
  id2 <- cod[cod["nobs"] > threshold, ]$id
  corrr <- numeric()
  for (i in id2) {
    
    dataalm <- read.csv(paste(directory, "/", formatC(i, flag = "0", width = 3), 
                             ".csv", sep = ""))
    cod2 <- dataalm[complete.cases(dataalm), ]
    corrr <- c(corrr, cor(cod2$sulfate, cod2$nitrate))
  }
  return(corrr)
}


        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

