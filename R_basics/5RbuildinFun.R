# some more built in function
x<- -4
abs(x)
x<- 4
sqrt(x)
x<-4.5
ceiling(x)
floor(x)
x<- 4.55
round(x)
round(x,1)
x<-4
log(x)
x<-4
exp(x)
exp(1.38)

# String function
a<- "Data Science"
substr(a,6,12)

paste("R","Programming")
strsplit("R-Programming","-")
tolower("R Programming")
toupper("R Programming")

ls()
help(ls)
?ls

#install.packages("gplots") #install any package
library(gplots)

v1<- c(70,20,75,40,55)
any(v1>50)
all(v1>50)
rslt<-(ifelse(v1>50,'Pass','fail'))
rslt

#Dates

#use as.Date() to convert Strings to dates

date1<- "2019-06-22"
#date1 <-"2019/06/22"
mydates1 <- as.Date(date1)
mydates1

mydates3<- as.Date("10/06/2019",format="%d/%m/%Y")
#mydates2 <- as.Date("22/06/2019", format="%d-%m-%Y")
mydates3
mydates4<- as.Date("10/06/2019",format="%d/%m/%Y")
mydates4
#mydates5 <- as.Date("10-06-2019", format="%d-%m-%Y")
format(mydates4,"%d/%m/%Y")
format(mydates4,"%d/%b/%Y")
#format(mydates4,"%d/%b/%y")

#one more example
dates <- c("Oct 10 2019" , "Nov 7 2019")
dates1 <- as.Date(dates, format ="%b %d %Y")
dates1
format(dates1,"%d/%m/%Y")

#------------------

mydates3<-as.Date(c("2019-06-22", "2018-02-10") )
days <- mydates3[1]-mydates3[2]
days

#apply family
df4<- read.csv('C:\\Users\\91869\\Documents\\r pROGRAMS\\R\\apply_demo.csv')

a1 <-apply(df4,1,sum) #sumation all column across row
a1
a2<- apply(df4,2,sum) #sumation all row across column
a2
l1<-lapply(df4,sum)
l1 # showing output like list
s1<- sapply(df4,sum)
s1 #showing output like vector


discount <- function(x){

  d <- x*.1
  return(d)
}


l2<- lapply(df4$field1, discount) # showing output like list
l2

s2<- sapply(df4$field1, discount) #showing output like vector
s2


df5 <- read.csv("C:\\R_proj\\tapply_demo.csv") 
t1<- tapply(df5$field1, df5$group, sum) # group wise add of field1 for grp1 and grp2
t1

