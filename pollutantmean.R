pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  filenames <- list.files(directory)[id]
  for (file in filenames) {
    filename <- paste(directory, '/',  file, sep = '') 
    if (!exists("dataset")) {
      dataset <- read.csv(filename, header = TRUE, sep = ',')
    }
    else if (exists("dataset")) {
      temp.dataset <- read.csv(filename, header = TRUE, sep = ',')
      dataset <- rbind(dataset, temp.dataset)
      rm(temp.dataset)      
    }
  }
  return(mean(dataset[ , pollutant], na.rm = TRUE))
}
