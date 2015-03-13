complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        nobs_data<-data.frame()
        for (i in id){
                each_file=read.csv(file.path(directory, sprintf("%03d.csv", i)))
                nobs_data_i<-c(i, sum(complete.cases(each_file)))
                nobs_data<-rbind(nobs_data, nobs_data_i)
                
        }
        names(nobs_data)<-c("id", "nobs")

        nobs_data

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
}