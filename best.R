best <- function(state, outcome){
  
  ## read the data file
  data <- read.csv(path('rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv'), colClasses = 'character')
  
  ## check that function inputs are valid
  # check state input
  if (sum(state == data$State) == 0){
    stop('invalid state')
  } 
  # check outcome input
  possible_outcomes <- c('heart attack', 'heart failure', 'pneumonia') # vector of possible outcomes
  if (sum(outcome == possible_outcomes) == 0){
    stop('invalid outcome')
  }
  
  ## identify column containing outcome of interest
  if (outcome == 'heart attack') {
    colNumber <- 11
  } else {
    if (outcome == 'heart failure') {
      colNumber <- 17
    } else {
      if (outcome == 'pneumonia') {
        colNumber <- 23
      }
    }
  } 
  
  ## subset data to contain only data for state of interest
  data <- data[data$State == state,]
  
  ## replace "Not Available" with NA
  data[data == 'Not Available'] <- 'NA'
  
  ## change numeric values to numeric from character
  data[,colNumber] <- as.numeric(data[,colNumber])
  
  ## return character vector containing the name of the hospital with the lowets 30-day mortality for the specified outcome
  data$Hospital.Name[which.max(data[,colNumber])]
}