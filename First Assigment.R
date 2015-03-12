pollutantmean <- function(directory, pollutant, id = 1:332) {


    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".

    data= c(NA, NA, NA, NA)

    for (i in id){
        each_file=read.csv(file.path(directory, sprintf("%03d.csv", i)))
        data=rbind(data,each_file)
    }
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used

    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    

    mean(data[[pollutant]], na.rm = T)
    }