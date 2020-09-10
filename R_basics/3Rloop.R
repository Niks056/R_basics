#for loop 
x <- c(5,8,10,15)
for (val in x){
  print (val)
}

numbers<- c(6,5,3,8,4)
n=0
for (val in numbers) {
  n=n+val
  print(paste('TotalAmount:',n))
  
}


rollno <- c(1,2,3,4,5)
marks <- c(70,40,55,35,80)

n=length(marks)
result<-vector()
count<-1

for (val in marks) {
  if(val>=50)
  {
    rslt="PASS"
  }else {
    rslt="FAIL"
  }
  result[count] <- rslt
  count <- count+1
}
names(result) <- rollno
result



#while loop
i <- 1
while(i<4){
  print(i)
  i <- i+1
}

age1 <- c(30,65,60,45,80)
principal1 <- c(1000,4000,3000,4000,2000)
NoofYears <-1
irate <- 8
approved<-rep("NO",times=5)
approved
i <-1

totalamt <- 0
while (totalamt < 12000) {
  totalamt=totalamt+(principal1[i]*(1+irate/100)^NoofYears)
  approved[i] <- "YES"
  i<- i+1
  
}
print(approved)




age1 <- c(30,65,60,45,80)
principal1 <- c(1000,4000,3000,4000,2000)
NoofYears <-1
irate <- 8
approved<-rep("NO",times=5)
i <-1

totalamt <- 0
while (totalamt < 12000) {
  totalamt=totalamt+(principal1[i]*(1+irate/100)^NoofYears)
  
  if(totalamt>12000)
  {
    break
  }
  approved[i] <- "YES"
  i<- i+1
}
print(approved)

