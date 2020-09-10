#debug1
# maturity <- function(age,principal){
#   years <- 1
#   if(age>60)
#   {
#     irate <- 8
#   }
#   else{
#     irate <- 7
#   }
#   result <- (principal*(1+irate/100)^years)
#   return (result)
# }
# 
# maturity(65,1000)
# 
# print('Debug')



setwd("C:\\R prog\\rproj")
print(getwd())

data1 <- read.csv("FD.csv")


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

matList <- vector()
Noofrows <- nrow(data1)
for (i in 1:Noofrows){
  matList[i] <- maturity(data1[i,"Age"],data1[i,"principal"])
}
print(matList)
