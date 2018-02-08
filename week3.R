# Setup
rm(list=ls())
library(rprojroot)
path <- function(x) find_root_file(x, criterion = has_file('ProgrammingAssignment3.Rproj'))

# Import data
outcome <- read.csv(path('rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv'), colClasses = 'character')

# Inspect data
now(data)
names(outcomes)

##### 1) Create histogram of 30-day death rate
hist(as.numeric(outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),
     xlab = '30-Day Death Rate from Heart Attack',
     ylab = 'Frequency', 
     main = '30-Day Death Rate') 

##### 2) Find the best hospital in a state
# see function best.R

source(path('best.R'))
