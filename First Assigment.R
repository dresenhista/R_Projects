pollutantmean <- function(directory, pollutant, id = 1:332) {


    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    filenames <- sprintf("%03d.csv", id)
    filedir <- file.path(directory, filenames)
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    ldf <- lapply(filenames, function(i){con <-read.csv(i) readLines(con, 10) })
    test<-lapply(ldf, data.frame)
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used

    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    mean_pullutant<-mean(ldf[[pollutant]], na.rm = TRUE)
}

each_file= NULL
for ( i in 1:2) {
    each_file[i]<-read.csv(a[i], header = T)
}

a <- data.frame(matrix(unlist(ldf), byrow=T))