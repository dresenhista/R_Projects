tdata<-read.csv("pendigits.tra.csv")
vector_names<-c("x1")
for(i in 2:16){
  vector_names<-rbind(vector_names, paste("x",i, sep=""))

}
vector_names<-rbind(vector_names, "class")
vector_names<-as.vector(vector_names)
names(tdata)<-vector_names

tdata$class<-as.factor(tdata$class)
classifier <- IBk(class ~., data = tdata,
                  control = Weka_control(K = 5))
evaluate_Weka_classifier(classifier, numFolds = 10)
