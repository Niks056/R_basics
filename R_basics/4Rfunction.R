mytotal <- function(){
  a <- 10
  b <- 20
  c <- a+b
  return(c)
}
mytotal()



myfunc <- function(a,b){
  sum=a+b
  return (sum)
}

myfunc(5,6)

maturity <- function(age,principal){
  years <- 1
  if(age>60)
  {
  irate <- 8
  }
  else{
  irate <- 7
  }
  result <- (principal*(1+irate/100)^years)
  return (result)
}

maturity(65,1000)


#from file
setwd("C:\\Users\\91869\\Documents\\r pROGRAMS\\R")
print(getwd())

data1 <- read.csv("fdl.csv")

#alter1
maturity <- function(age,principal){
  years <- 1
  if(age>60)
  {
    irate <- 8
  }
  else{
    irate <- 7
  }
  result <- (principal*(1+irate)^years)
  return (result)
}

matList <- vector()
Noofrows <- nrow(data1)
Noofrows
for (i in 1:Noofrows){
  matList[i] <- matAmount(data1[i,"Age"],data1[i,"Principal"])
}
print(matList)

data1['MatAmt'] <- matList
write.csv(data1,'fd1.csv',row.names=FALSE)


#alter2

matList2 <- vector()
for (i in 1:Noofrows){
  matList2[i] <- maturity(data1$Age[i],data1$Principal[i])
}
print(matList2)

