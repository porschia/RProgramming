complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  wd <- paste("./", directory, "/", sep="")
  new_id <- paste(wd, formatC(id, width=3, flag="0"), sep="")
  d_id <- c()
  nobs <- c()
  
  for(i in 1:length(new_id)){
    f.name <- paste(new_id[i], "csv", sep=".")
    read_file <- read.csv(f.name)
    cases <- na.omit(read_file)
    d_id[i] <- id[i]
    nobs[i] <- nrow(cases)
  }
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  data_complete <- data.frame("id"=d_id, "nobs"=nobs)
  data_complete
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
}