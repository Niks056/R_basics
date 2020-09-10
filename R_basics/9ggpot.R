#gg= grammar of graphics

setwd("C:\\R_Pooja")
data1 <- read.csv("loan prediction.csv",na.strings = c("NA","NaN",""),stringsAsFactors=F)

library(ggplot2)
#Iris data
ggplot(data=iris)
ggplot(data=iris, aes(y=Sepal.Length, x=Petal.Length))
ggplot(data=iris, aes(y=Sepal.Length,x=Petal.Length))+geom_point()
ggplot(data=iris, aes(y=Sepal.Length,x=Petal.Length,col=Species))+geom_point()
ggplot(data=iris, aes(y=Sepal.Length,x=Petal.Length,shape=Species))+geom_point()
ggplot(data=iris, aes(y=Sepal.Length,x=Petal.Length,col=Species,shape=Species))+geom_point()

dfCol <- read.csv("Column.csv")
dfLine <- read.csv("Line.csv")
dfScatter <- read.csv("Scatter.csv")
data1 <- read.csv("loan prediction.csv")

#Bar chart
dfCol$MonthS <- as.factor(dfCol$Months)

ggplot(data=dfCol, aes(x=Months,y=Y2015))+ geom_bar(stat = "identity",fill="steelblue")
#heights of the bars to represent values in the data,use stat="identity"

#xticks
xValue <- c('jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec')

ggplot(data=dfCol,aes(x=Months,y=Y2015))+geom_bar(stat="identity",fill="steelblue")+scale_x_discrete(labels=xValue)


library(reshape2)
dfMelt<- melt(dfCol,id ="Months")

p<- ggplot(data=dfMelt,aes(x=Months,y=value, fill=variable))+geom_bar(stat = 'identity',position = 'dodge')+
  ggtitle('Sales of Products')+xlab('Months')+ylab('Amount')+scale_x_discrete(labels=xValue)
p
ggsave(p,file="chart.png",width = 8,height = 6,dpi=100)



#line
dfLine$Year<- as.factor(dfLine$Year)
ggplot(data=dfLine,aes(x=Year,y=Inflation,group=1))+geom_line()+geom_point()

#scatter
ggplot(dfScatter,aes(x=Income,y=Insurance))+geom_point()+geom_smooth(method = lm,se=FALSE)

#histogram
ggplot(data=data1,aes(data1$LoanAmount))+geom_histogram(bins=50)

#boxplot
ggplot(data1,aes(data1$Education,data1$LoanAmount))+geom_boxplot()


#pairplot
dfpp <- read.csv("auto_mpg.csv")
dfpp <- dfpp[,c("mpg","horsepower","weight")]
pairs(dfpp)
