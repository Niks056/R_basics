setwd("C:\\Users\\91869\\Documents\\r pROGRAMS\\R")
data1<-read.csv("loan predictionLog.csv",na.strings = c("NA","NaN",""),stringsAsFactors = FALSE)
str(data1)
data1$Loan_Status<- ifelse(data1$Loan_Status=='Y',1,0)
data1$Loan_Status<- as.factor(data1$Loan_Status)


#Excluding LoanId column

col<-ncol(data1)
data2=data1[,2:col]

summary(data2)

#Splitting
nrow(data1)


set.seed(10)
n<- nrow(data2)
index1 <- sample(1:n, size = round(0.75*n),replace=FALSE)
x_train<- data2[index1 ,]
x_test<-data2[-index1 ,]

model1<-glm(Loan_Status~.,data=x_train,family=binomial)

#genralised linear Model
#model1<-glm(Loan_Status~ApplicantIncome+CoapplicantIncome+Education+LoanAmount,data=x_train,family="binomial")
#. is used to stop taking all columns and writing columns only what we wanted.
summary(model1)
x_test1<- x_test[,1:ncol(x_test)-1]  #-1 is used to remove the last coulumns i.e loan_status.
preds<-predict(model1,x_test1)
preds
preds<-ifelse(preds>=.5,1,0)
preds<-as.factor(preds)
tb<-table(preds , x_test$Loan_Status)
tb
accuracy<-(tb[1,1]+tb[2,2])/sum(tb)
accuracy
