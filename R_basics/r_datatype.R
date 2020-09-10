#Variable assignment
a<-2
b<-8
c<-a+b
c

#Double
a<-5.5
typeof(a)

#class(a)
a<-5
typeof(a)

#Integer
a<-5L
class(a)

b<-"pune"
typeof(b)

#logical

c<-TRUE
cc<-T
typeof(c)


#Vector

age<-c(25,20,40,30,20)
typeof(age)
length(age)
mean(age)
median(age)
which(age==40)
summary(age)

city<- c("Mumbai","Pune","Mumbai")
t=table(city)
t

names(t)[which(t==max(t))]  #to find stat mode, no in-built fn for mode
                            # in R

aa<-c(2,'m',4,'n')
bb<-c(2,2.5,10,12.8)

is.character(aa)
is.character(bb)


v2=c(1:10)
v2

s1<-seq(from=10,to=50,by=2)
s1

r1<-rep(4,times=5)
r1


v1<-vector(mode="numeric",length=5) #mode means type in R
v1
v1[2]<-10
v1


#Create vector with age
#Indexing
age<-c(10,20,30,40,50)
age[1]
age[2:3]
age[c(1,3,5)]
sum(age)

#Assigning names
vectName<-c("a","b","c","d","e")
names(age)<-vectName
age
age['b']

names(age)<-NULL    #to remove name

age

#Appending

age[6]<-25
age

#Editing
age[2]<-37
age

#Inserting
age<-c(age[1:3],58,age[4:5])
age

age<-age[-4]
age

age<-age[-c(1,3)]
age


#R Arthmetyic Operators

a<-c(10,20)
b<-c(5,20)

a+b
a-b
a*b
a/b


#Relational operators
a>b
a<b
a==b
a!=b
all(a==b)
any(a==b)


yrs<-c(4,8,2,5)
mon1<-yrs*12
mon1

#Recycling

yrs<-c(4,8,2,10,5)
yrs1<-c(2,4)
y=yrs+yrs1
y

t1<-c(1,42,3.78)
t2<-round(t1,1)
t2

age1<-c(30,20,NA,30,20) #NA is logical constant of length 1 which contains a missing value indicator
age2<-c(30,20,NULL,30,20) #Null is also missing value but it is void
mean(age1)
mean(age1,na.rm=T)    #rm - remove
mean(age2)

length(age2)
a<-NULL
length(a)
b<-NA
length(age1)
length(age2)


#Filtering
age<-c(25,20,40,45,20)
age3<-age[age>30]
age3
subset(age,age>30)

age2<-c(30,22,45,NA,32)
age10<-age2[age2>30]
age10
age11<-subset(age2,age2>30)
age11


which(age2>30)

#Matrix
mat1<-matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,byrow=T)
mat1
mat2<-matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,byrow=F)
mat2
mat1[1,3]
mat1[c(1,3),2]
mat1[,2:3]
mat1[2:3,]
mat1[mat1[,2]>4,]
rowSums(mat1)
colSums(mat1)

m<-matrix(nrow=2,ncol=2)
m
m[1,1]<-10
m[2,1]<-20
m[1,2]<-30
m[2,2]<-40
m

#matrix operations
2+m
m+m
m%*% m #multiplication
#10*10+20*30,10*30+30*40,

mat1<-matrix(c(1,2,3,4,5,6,7,8,9),nrow = 3,byrow=T)
vec1<-c(4,5,6)
mat2<-cbind(mat1,vec1)
mat2
mat3<-rbind(mat1,vec1)
mat3


#List - it is sort of dictionary in python

emp<- list("Manoj",50,"M")
emp<- list(name="manoj",age=50,gender="M")
emp


emp$name
emp$age
emp[["age"]]
emp[[2]]
emp$city<-'Pune'   #add
emp
emp$city<-NULL    #remove
emp


age<-c(10,20,30,40,50)
vectname<-c("a","b","c","d","e")
lst1<-as.list(setNames(age,vectname))
lst1


#factor

degree<-c('BE','MBA','MBA','BE','BE')
summary(degree)
f1<-factor(degree)
class(f1)
levels(f1)
str(f1)
summary(f1)

#Dataframes

cust<- c("Sunil","Sachin","Kapil","Rahul")
age<-c(55,45,52,40)
df1<-data.frame(cust,age,stringsAsFactors =FALSE)
str(df1)
df1

df2<-data.frame(cust,age)
str(df2)

df1
df1$cust
df1[[1]]
head(df1,2)

dim(df1)
class(df1$cust)
class(df1$age)
names(df1)


df1[1,1]
df1[1,]
df1[,1]
df1[1:3,1]
df1[df1$age>=50,]
subset(df1,age>=50)

df2<-df1[-2,]
df2
df2<-df1[,-2]
df2


match1<-c(100,140,120,110)

mat2<-cbind(df1,match1)
mat2
mat3<-rbind(mat2,list("MS",35,100))
mat3

df1[age>=50&match1>100,]
mean(df1$age)

#********************************************************************#

df4<-data.frame(cust,match1,stringsAsFactors =FALSE)
df5<-merge(df1,df4)
df5


#********************************************************************#

data()
head(ChickWeight)
str(ChickWeight)
summary(ChickWeight)
mean(ChickWeight$weight)
attach(ChickWeight)
mean(weight)
detach(ChickWeight)
weight

x<-c("Pune","Mum","Pune","Pune","Mum")
y<-c(5,10,20,20,15)
dfdue<-data.frame(x,y,stringASFactors=FALSE)
dfdue
agg<-aggregate(dfdue$y,by=list(dfdue$x),FUN=sum)
names(agg)<-c("city","Tot")
agg

x<-c(1,2,NA,10,3)


#Branching

marks<-55

if(marks>=50){
  
  rslt<-'Pass'
}else {
  rslt<-'Fail'
}

print(rslt)


marks<-80

if(marks>=80){
  
  result="A"
}else if(marks>=60&marks<=80){
  reslut="B"
}else if(marks>=40&marks<60){
  result="C"
}else{
  result="D"
}

print(result)


#********************************#


numbers<-c(6,5,3,8,4)
sum<-0

for(i in numbers){
  sum<-sum+i

}
print(paste('Total Amount',sum))  #PASTE  combines text to be printed




rollno<-c(1,2,3,4,5)
marks<-c(70,40,36,89,80)
v1<-vector(mode="character",length=5)  #create emepty vector of length 5
count<-1       #we take intial index as 1

for (i in marks){
  if(i>=50){
    v1[count]<-"Pass"     #if marks are greater than 50 we put pass
  }else{
    v1[count]<-"Fail"     #increament in index
    
  }
  count<-count+1
}
print(v1)
names(v1)<-rollno



#while loop

i<- 1
while(i<4){
  print(i)
  i<-i+1

}

#
age1<-c(30,65,60,45,80)
principal1<-c(1000,4000,3000,4000,2000)
noofyear<-1
irate<-8


approve<-rep('No',times=5)
i<-1
TotalAmt<-0

while(totalAmt<12000){
  amt<-principal1[i]*(1+irate/100)^noofyear
  TotalAmt<-TotalAmt+amt
  approve[i]<-('Yes')
  i<-i+1
}
print(approve)



#Break


approve<-rep('No',times=5)
i<-1
TotalAmt<-0
while(TotalAmt<12000){
  
  amt<-principal1[i]*(1+irate/100)^noofyear
  TotalAmt<-TotalAmt+amt
  if(TotalAmt>12000){
    break
    
  }
approve[i]<-('Yes')
i<-i+1
  
}
print(approve)

