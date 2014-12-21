# "rootdir" argument is the directory containing the contents of the "zip" download file
run_analysis<-function(rootdir){
  op<-options(stringAsFactors=F)
  cwd<-getwd()
  setwd(rootdir)
  a_l<-as.character(read.table("activity_labels.txt")[,2])
  f<-as.character(read.table("features.txt")[,2])
  
  # merge the "train" and "test" data sets into one common set
  m<-rbind(read.table("train/X_train.txt",colClasses="character",col.names=f),
           read.table("test/X_test.txt",colClasses="character",col.names=f))
  
  # merge the activities from train and test into one common set
  a<-rbind(read.table("train/y_train.txt"),read.table("test/y_test.txt"))[,1]
  
  # merge the subjects from train and test into one common set
  s<-rbind(read.table("train/subject_train.txt"),read.table("test/subject_test.txt"))[,1]  
  setwd(cwd)
  
  # build pattern set which identifies mean and std columns
  m_and_s<-grep("(\\-mean\\(\\))|(\\-std\\(\\))",f,value=TRUE)
  
  # extract mean and std columns into new data set
  mm<-cbind(m[,grep("(\\-mean\\(\\))|(\\-std\\(\\))",f)],a,s)
  l<-list()
  v<-vector()
  s<-as.character(sort(unique(s)))
  a<-as.character(unique(a))
  n<-1
  
  # Build final data set containing containing average of each variable (only "mean" and "std") for each "activity" and each "subject"
  for(i in s){
    v[1]<-as.character(i)
    for(j in a){
      v[2]<-as.character(a_l[as.numeric(j)])
      for(k in 1:length(m_and_s)){
        mmm<-mm[mm$s==i & mm$a==j,k]
        mmmm<-mean(as.numeric(mmm))
        v[2+k]<-as.character(mmmm)
      }
      l[[n]]<-v
      n<-n+1
    }
  }
  v<-as.vector(l[[1]])
  mtrx<-matrix(data=v,ncol=length(v))
  for(i in 2:length(l)){
    v<-as.vector(l[[i]])
    mtrx<-rbind(mtrx,v)
  }
  
  # Create final data frame and add descriptive column names
  df<-as.data.frame(mtrx)
  colnames(df)<-c("subject","activity",m_and_s)
  write.table(df,file="project.txt",row.names=FALSE)
  options(op)
}