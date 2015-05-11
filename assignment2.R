best <- function(state, outcome) {
  #reading dataset
  dataset <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  #filtering the outcome
  column_field <- c("heart attack", "heart failure", "pneumonia")
  
  if(outcome==column_field[1])
    {column_number = 11 #heart attack
     }else if(outcome==column_field[2])
    {column_number = 17 #heart failure
     }else if(outcome==column_field[3])
    {column_number = 23 #pneumonia
     }else{stop("Invalid outcome")}
  
  
  #filtering data
  filtered_data<-subset(dataset, State==state)
  
  if(nrow(filtered_data)==0){
    stop("invalid state")
  }

  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
}