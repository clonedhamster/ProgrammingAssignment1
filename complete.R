complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  filenames <- list.files(directory)[id]
  for (file in filenames) {
    filename <- paste(directory, '/',  file, sep = '') 
    if (!exists("dataset")) {
      temp.datafile <- read.csv(filename, header = TRUE, sep = ',')
      good <- complete.cases(temp.datafile)
      dataset <- data.frame(id = temp.datafile[1, 4], nobs = length(temp.datafile[good, 4]))
      rm(temp.datafile)
    }
    else if (exists("dataset")) {
      temp.datafile <- read.csv(filename, header = TRUE, sep = ',')
      good <- complete.cases(temp.datafile)
      temp.dataset <- data.frame(id = temp.datafile[1, 4], nobs = length(temp.datafile[good, 4]))
      dataset <- rbind(dataset, temp.dataset)
      rm(temp.dataset)
      rm(temp.datafile)     
    }
  }
  return(dataset)
}