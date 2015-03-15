corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  filenames <- list.files(directory)
  dataset <- vector()
  for (file in filenames) {
    filename <- paste(directory, '/',  file, sep = '') 
    temp.datafile <- read.csv(filename, header = TRUE, sep = ',')
    good <- complete.cases(temp.datafile)
    temp.data <- temp.datafile[good, 2]
    if (length(temp.data) > threshold) {
      comp.data <- data.frame(sulfate = temp.datafile[good, 2],
                            nitrate = temp.datafile[good, 3],
                            ID = temp.datafile[good, 4])      
      dataset <- c(dataset, (cor(comp.data$nitrate, comp.data$sulfate)))
    }     

    
  }
  return(dataset)
}