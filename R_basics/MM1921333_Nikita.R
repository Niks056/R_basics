data1<- read.csv("Superstore.csv")
library(dplyr)
#1)Create a discount vector based on above logic. Write for loop for this. From this vector 
#create a discount1 column in Superstore dataframe
discount<- vector()
len<-length(data1$Profit)
profit<-data1$Profit
count<-1

for (val in profit){
   if(val>=100 && val<=399)
   {
    dscnt=10
   }
   else if(val>=400)
   {
    dscnt=5
   }
   else{
    dscnt=0
   }
   discount[count]<- dscnt
   count<-count+1
}
data1$discount<-discount


#2) Create discount2 from the above conditions using dplyr library.
data1 <- mutate(data1,disount2=ifelse(profit>=100&Profit<=399,10,ifelse(profit>=400, 5, 0)))


#3) If company has maximum budget of discount is 2000 and if Company won't give a discount on Technology. 
#How many customers will get discount. Sort dataframe on RowID before calculating this.
disc<-0
i<-1
dt1<-data1%>%filter(Category=="Furniture"|Category=="Office Supplies")%>%arrange(Row.ID)
while(disc<2000){
   disc=disc+(dt1$Sales[i]*(dt1$discount[i]/100))
   i<-i+1
}
print(paste0("No of Customers :", i))


#4) Using ggplot library,
#a) Create a chart to visualize distribution of sales.
library(ggplot2)


#Bar chart
ggplot(data1, aes(x = " ", y = Sales, fill=Region)) +
   geom_bar(width = 1, stat ="identity") +
   coord_polar("y", start = 0)

#b) Create region wise boxplot of sales
#Box Plot
ggplot(data1,aes(Region,Sales))+geom_boxplot()



#5) a) Which region has minimum sales of technology?
dt1<-data1%>%group_by(Region)%>%summarise(Sum=sum(Sales,na.rm=TRUE))%>%arrange(Sum)
dt1[1,1] # has minimum sales

#b) Which is the best months of sales in year 2013?
library(stringr)
dt<-as.data.frame(str_match(data1$Order.Date, "^(.*)-(.*)-(.*)$")[,-1])
data1$Year<-dt[,3]
data1$Month<-dt[,2]
dt1<-data1%>%filter(Year=="2013")
a<-dt1%>%group_by(Month)%>%summarise(Best_Sales=max(Sales),ra.nm=TRUE)%>%arrange(desc(Best_Sales))
b<-a[1,1]
print(paste("Best Month Sale =",b))

#6) a) How many has Order Priority = 'High' in Mexico?
dt<-filter(data1,Order.Priority=='High'& Country=="Mexico")
a<-nrow(dt)
print(paste("No of high priority Orders in Mexico =",a))

#b) How much company has paid Category wise Shipping Cost.
data1%>%group_by(Category)%>%summarise(Shipping_cost=sum(Shipping.Cost,na.rm=TRUE))


#7) OrderID column has three components, country, year & orderno. Extract the orderno from OrderID 
#column and add this as new column in dataframe. Retrieve the records where orderno is 
#greater than 120000 and Category is Furniture.
library(stringr)
dt<-as.data.frame(str_match(data1$Order.ID, "^(.*)-(.*)-(.*)$")[,-1])
dt1<-dt[,3]
dt1<-as.numeric(levels(dt1))[dt1]
data1$Order_No<-dt1
dt2<-filter(data1,Category=="Furniture"& Order_No>120000)


#8) Take random sample of 20 sales values each for Brazil & Mexico (use seed 1). Apply 
#appropriate non-parametric test on it. Interpret the output of it.
set.seed(1)
dt1<-data1%>%filter(Country=='Mexico')
mexico<-c(dt1$Sales)
mexico<-sample(mexico,20)
mexico
set.seed(1)
dt1<-data1%>%filter(Country=='Brazil')
brazil<-c(dt1$Sales)
brazil<-sample(brazil,20)
brazil
#Mann-whitney test 
#Test for Independent samples
#Null_Hypotheis-- If sales of Brazil are different from Sales of Mexico
res<-wilcox.test(brazil,mexico,exact=F) 
res
#As the p-value is greater than the significance level 0.05, we can conclude
#that there are no significant differences between the groups.


#9) Take random sample of 20 sales values each for Argentina, Mexico & Cuba (use seed 1). 
#Apply appropriate test on it. Write hypothesis & interpret the output of it.
set.seed(1)
dt1<-data1%>%filter(Country=='Mexico')
mexico<-dt1%>%select(Country,Sales)
mexico<-sample_n(mexico,20)
set.seed(1)
dt1<-data1%>%filter(Country=='Argentina')
argentina<-dt1%>%select(Country,Sales)
argentina<-sample_n(argentina,20)
set.seed(1)
dt1<-data1%>%filter(Country=='Cuba')
cuba<-dt1%>%select(Country,Sales)
cuba<-sample_n(cuba,20)

#Null_Hypothesis=There is no significant difference in sales of Argentina, Mexico & Cuba 
Anova_test<- rbind(argentina,mexico,cuba)
mc.aov <-aov(data=Anova_test,formula= Sales~Country)
summary(mc.aov)
#As the p-value is greater than the significance level 0.05, we can conclude
#that there are no significant differences between the groups.


#10) Apply Categorical data encoding on Region and Order Priority column.
str(data1$Region)
data1$Region1<-factor(data1$Region)
str(data1$Order.Priority)
data1$Priority1=factor(data1$Order.Priority)
data1$Region1 = factor(data1$Region1,levels=c('North','South','Central','Caribbean'),labels=c(0,1,2,3))
data1$Priority1=factor(data1$Order.Priority,levels=c('Low','Medium','High','Critical'),labels=c(0,1,2,3))

