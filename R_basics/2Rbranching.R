#Branching

marks <- 55

if(marks >= 50)
{
  rslt <- 'PASS'
} else {
  rslt <- 'FAIL'
}

print(rslt)

marks2 <- 35

if(marks2 < 40)
{
  rslt <- 'D'
} else if(marks2 >=40 & marks2<60) 
{
  rslt <- 'C'
} else if(marks2 >=60 & marks2<80) 
{
  rslt <- 'B'
} else if(marks2 >80) 
{
  rslt <- 'A'
}

print(rslt)




