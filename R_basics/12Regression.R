installed.packages('datarium')
data("marketing",package = "datarium")
head(marketing,4)

#plot
library('ggplot2')
ggplot(marketing,aes(x=youtube,y=sales))+geom_point()+geom_smooth(method=lm,se=FALSE)

#correlation
cor(marketing$sales,marketing$youtube)

#sales=b0+b1*youtube

model<-lm(sales~youtube,data=marketing)       #lm=linear model
model

#sales=8.44+0.48*youtube

summary(model)
#-----------------------------output---------------------------------------------------
#Call:
#lm(formula = sales ~ youtube, data = marketing)

#Residuals:
 # Min       1Q   Median       3Q      Max 
#-10.0632  -2.3454  -0.2295   2.4805   8.6548 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 8.439112   0.549412   15.36   <2e-16 ***
#  youtube     0.047537   0.002691   17.67   <2e-16 *** #implies that sales is dependent on youtube as p value is low
  ---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

# Residual standard error: 3.91 on 198 degrees of freedom
# Multiple R-squared:  0.6119,	Adjusted R-squared:  0.6099   #for single variable we should consider R-squared
# F-statistic: 312.1 on 1 and 198 DF,  p-value: < 2.2e-16     #for multiple variable we should consider adjusted R-Squared
#------------------------------------------------------------------------------------------
set.seed(100)
trainRow <-sample(1:nrow(marketing),0.8*nrow(marketing))
trainData <- marketing[trainRow,]            #model training data
testData <- marketing[-trainRow,]           #test data

lmMod <- lm(sales~youtube,data=trainData)   #build the model
summary(lmMod)                            #model summary

salePred<- predict(lmMod, testData)    #predict sales
salePred


####multiple variable
#build the model
lmMod2<-lm(sales~youtube+facebook+newspaper, data = marketing)
summary(lmMod2)
 
lmMod3<-lm(sales~ ., data = marketing)
summary(lmMod3)
