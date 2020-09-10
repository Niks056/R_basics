
data1 <- read.csv("loan prediction.csv",na.strings = c("NA","NaN",""),stringsAsFactors=F)

str(data1)

newrec<- list("LP002991","Male","Yes","0","Graduate","Yes",5000,0,133,360,0,"semiurban","N")

data2<- rbind.data.frame(data1,newrec)
data1<- rbind(data1,newrec)

#Update
data1$Education[data1$Education=="Graduate"]<- 'G'
data1$Education[data1$Education=="Not Graduate"]<-'UG'
data1


data1$Bonus[data1$Education=='G']<-data1$ApplicantIncome[data1$Education=="G"]*0.20
data1$Bonus[data1$Education=="UG"]<-data1$ApplicantIncome[data1$Education=="UG"]*0.10


data1$Bonus<- (ifelse(data1$Education=='G',data1$ApplicantIncome*.2,data1$ApplicantIncome*.1))

?substring

data1$id_str<- substr(data1$Loan_ID,1,2)
data1$id_num<-substr(data1$Loan_ID,3,length(data1$Loan_ID))


#delete
data2=data1[-which(data1$Education=='G'),]
data3=data1[-which(data1$Education=="G"&data1$Self_Employed=="Yes"),]
data3


#Renaming Column names
#col<-names(data1)
#match("Property_Area",col)
names(data1)
names(data1)[12] <- "Property_Type"
names(data1)


#Preprocessing
#1.Missing_Value

sum(is.na(data1))
sum(complete.cases(data1))
dataNona <- na.omit(data1) #row without NA
dataNoLoanNA<- data1[-which(is.na(data1$LoanAmount)),]

data1$LoanAmount[is.na(data1$LoanAmount)]<- median(data1$LoanAmount,na.rm = T)


#2.categorical data encoding
str(data1$Loan_Status)
data1$Loan_Status1<-factor(data1$Loan_Status)
str(data1$Loan_Status)

data1$Loan_Status1 = factor(data1$Loan_Status,levels=c('N','Y'),labels=c(0,1))
data1$Property_Area = factor(data1$Property_Area,levels = c('Urban','Semiurban','Rural'),labels=c(0,1,2))



#3.Scaling
data2<-data1
data2[,c("ApplicantIncome","CoapplicantIncome","LoanAmount")] = 
  scale(data2[,c("ApplicantIncome","CoapplicantIncome","LoanAmount")])
View(data2)
