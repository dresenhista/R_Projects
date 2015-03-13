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



corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        

        nobs_list<-complete(directory, 1:332) ##get list of all the completed nobs
        filtered_nobs<-subset(nobs_list, nobs>threshold) #filter using thresome
        id<-filtered_nobs$id #create the list of files that the loop should go through
        cr<-numeric() #create the vector
        for (i in id){
               
                each_file=read.csv(file.path(directory, sprintf("%03d.csv", i)))
                cr<-c(cr,cor(each_file$sulfate, each_file$nitrate, use = "complete.obs"))
                
                #cr<-rbind(correlation_vector, cor(each_file$sulfate, each_file$nitrate, use = "complete.obs"))
        }
        cr
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
}