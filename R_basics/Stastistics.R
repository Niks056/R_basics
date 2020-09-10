
data1<-read.csv("lp.csv",na.strings=c("NA","NaN",""))
summary(data1)
attach(data1)
mean(LoanAmount,na.rm=T)
median(LoanAmount,na.rm=T)
max(LoanAmount,na.rm=T)
sd(LoanAmount,na.rm=T)
range(LoanAmount,na.rm=T)
var(loanAmount,na.rm=T)
quantile(LoanAmount,na.rm=T)
table(Education)
cor(LoanAmount,applicationIncome,use="na.or.complete")
cov(LoanAmount,Applicationincome,use="na.or.complete")

#Central Limit Therom

r<-runif(10000)
hist(r)
meanr<-mean(r)
meanr
#Draw four random samples
sample(r,4)
mean(sample(r,4))

zs#Draw 4 samples, 1000 times and draw the histogram of that

clt4<-mean(sample(r,4))
clt4

for(i in 1:1000){
  clt4<-c(clt4,mean(sample(r,4)))
}

hist(clt4)

#more sample size
clt5<-mean(sample(r,1000000))
for(i in 1:1000){
  
  clt5<-c(clt5,mean(sample(r,)))
}

hist(clt5)



#Missing value
is.na(data1)
sum(is.na(data1))
colsums(is.na(data1))
#Replacing mssing value
data2<-data1
data2$LoanAmount[is.na(data2$LoanAmount)]<-mean(data2$LoanAmount,na.rm=TRUE)

#Base Plot

plot(ApplicantIncome,LoanAmount)
pairs(~ApplicantIncome+LoanAmount+CoapplicantIncome)
hist(LoanAmount)
boxplot(LoanAmount)


#NORMAL PROBABILITY DISTRIBUTION Functions

set.seed(1)

#rnom- #Randomly generated sample from
  #standard normal distribution (mean=0,sd=1)

rn<-rnorm(100)
rn

#rn1<-rnorm(100,165,5) #Say height-normal
                       #distribution (not SND)
#rn1

#pnorm()-pdf of the normal distribution for 
         #given z-score
#At z=0 the value of probablity is 0.5(mean=0,sd=1)

pnorm(0)

#At z=-1.96, the probablity is 0.025
pnorm(-1.96)  #round(pnorm(-1.96,3))
pnorm(1.96)

#qnorm- inverse of pnorm
#At what value of z the area on left is .025
qnorm(0.025)    #round(qnorm(0.025),3)



# visualize package
#install.packages("visualize")
library(visualize)


visualize.norm(-1.96)
visualize.norm(c(-1.96,1.96),section="tails")
visualize.norm(c(-1.96,1.96),section="bounded")
visualize.norm(c(-1.64,1.64),section="tails")



#########Tests##########
#One Sample Z Test

#Example: Bottle are being produced with
#mean=150 & sd=2.
#Sample of 100 bottles show the mean=152
#Has the mean volume increased?
#check with 95% confidence level.

#z=(x-??)/(??/???n)
zvalue<-(152-150)/(2/sqrt(100))
zvalue
#1-pnorm(10)   #pvalue close to 0
critical<-qnorm(.95)
critical
visualize.norm(critical,section='upper')
visualize.norm(3,section='upper')


install.packages("BSDA")

library(BSDA)
vol1<-read.csv("C:\\AnkitR\\rproj\\PerfumeVolumes.csv")
z.test(x=vol1$Machine1,alternative="greater",sigma.x=2,mu=150)



#One Sample t-test
#Example: Bottles are being produced with mean.
#as 150 cc and the population sd is unknown.
#Sample of 4 bottles show the volume as 
#(151,153,152,152).
#Has the mean volume changes?
#Check with 95% confidecnce level.
vol2<-c(151,153,152,152)
t.test(x=vol2,mu=`150,conf.level=0.95`)

#p is less than 0.05 and
#hence reject null hypothesis.
#hence we conclude that volume has
#changed from 150 cc.


library(visualize)
visualize.t(stat=c(-4.899,4.899),df=3,section="tails")

#pt(q=-4.899, df=3)*2  #pvalue


#Two Sample z Test
vol3<-read.csv("PVTwoSample.csv")
z.test(x=vol3$MachineA,y=vol3$MachineB,sigma.x=sd(vol3$MachineA),sigma.y=sd(vol3$MachineB))

#boxplot(x=vol3)


#Two sample t Test(equal variance)
mc1<-c(150,152,154,152,151)
mc1
mc2<-c(156,155,158,155,154)
var.test(x=mc1,y=mc2)

#Since the value of p is greater than 0.05, we fail to reject the null hypotheseis
#Variances of mc1 and mc2 can be considered to be equal.

t.test(x=mc1,y=mc2,var.equal=T)

#In this two sample t test the value of p is low, hence null gets rejected.
#There is a differnce in the volumeds of machine 1 and macnine 2.

#boxplot(mc1,mc2)


#Paired t Test 


bp_before <-c(120,122,143,100,109)
bp_after <-c(122,120,141,109,109)
t.test(x=bp_before,y=bp_after,paired = T)

#Since the value of p is greater than 0.05
#we fail to reject the null hypohesis.
#There are not enough evidences to prove that 
#This medicine has any effect on the blood pressure.


#Chi-squared test
#1. Goodness-of-fit-Discrepancy between the observed & expected values
#Sales of 4 products p1,p2,p3,p4- observed & expected
#Is there a significant differnce between expected & actual

obs <-c(211,402,297,80)
exp <- c(0.2,0.4,0.3,0.1)  #expected prob of selling this
chisq.test(x=obs,p=exp)
#Null hypothesis accepted. So there is no significant differnce

library(visualize)
visualize.chisq(stat=4.59,df=3,section="upper")

#Chi-squared
#2. Contingency Tables
#Three operators in differnt shift

op1 <- c(22,28,72)
op2 <- c(26,62,22)
op3 <- c(23,26,66)

opr <- data.frame(op1,op2,op3,row.names=c('shift1','shift2','shift3'))
opr


chisq.test(opr)

#Critical value for 95% confidence level
#qchisq(0.05,df=4,lower.tail=F)



#Anova

vol4 <- read.csv("PVAnova.csv")
mc.aov <-aov(data=vol4,formula=vol~ machine)
summary(mc.aov)

mc1=vol4[vol4$machine=='m1',1]
mc2=vol4[vol4$machine=='m2',1]
mc3=vol4[vol4$machine=='m3',1]
boxplot(mc1,mc2,mc3)


#TukeyHSD(Tukey Honest Significant Differences)
TukeyHSD(x=mc.aov)


#Non-Parametric Test
#Mann-whitney test or wilcoxon rank sum test
#Test for Independent samples
women_weight<-c(38.9,61.2,73.3,21.8,63.4,64.6,48.4,48.8,48.5)
women_weight
men_weight<- c(67.8,60,63.476,89.4,73.3,67.3,61.3,62.4)
#we want to know, if the median women's weight differ from
#the median men's weight?
res<-wilcox.test(women_weight,men_weight,exact=F) #exact p-value should be
res#We can conclude that men's median weight is significantly differnt
#from women's median weight


#Wilcoxon signed Rank Test:
#It is non-parametric alternative to paired t-test uded to compare
   #paired data
#Weight of the mice before treatment
before<-c(200.1,190.9,192.7,231,241.4,196.9,172.2,185.5,205.2,193.7)
##weight of the micee after treatment
after<-c(392.9,393.2,345.1,393,434,427.9,422,383.9,392.3,352.2)
#We want to know, if there is any significant differnce in the median
#weight before and after treatment?
res<-wilcox.test(before,after,paired = TRUE)
#We can conclude that the median weight of the mice before treatment is 
#significantly differnt from the median weight after treatment

boxplot(before,after)

###########################

