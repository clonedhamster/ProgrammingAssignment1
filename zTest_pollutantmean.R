source('pollutantmean.R')

stopifnot(round(pollutantmean("specdata", "sulfate", 1:10), 3) == 4.064)
stopifnot(round(pollutantmean("specdata", "nitrate", 70:72), 3) == 1.706)
stopifnot(round(pollutantmean("specdata", "nitrate", 23), 3) == 1.281)