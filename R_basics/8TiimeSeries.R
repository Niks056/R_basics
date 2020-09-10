library(tseries)
library(forecast)
data(AirPassengers)
AP<-AirPassengers
AP
class(AP)
str(AP)
start(AP)
end(AP)
summary(AP)
plot(AP,xlab = "Date",ylab = "Passengers",main="Air Passenger")
boxplot(AP~cycle(AP),xlab = "Date",ylab = "Passengers",main="Montgly Air Passenger")
decomAP<-decompose(AP,"multiplicative")
plot(decomAP)

plot(decomAP$trend)
plot(decomAP$seasonal)
plot(decomAP$random)

adf.test(AP,k=12)          #p-value indicate null hypothesis is true which means it 
                            #is non-stationaryseries
#so we have to transfer this stationary series
#differening a series can remove trends#using auto.arima to find the best ARIMA model

arimaAP<-auto.arima(AP)
summary(arimaAP)           #returns best ARIMA model
#ARIMA(p,d,q)(P,D,Q)S - p = non-seasonal AR order, d = differencing,
                       #q = MA oreder (it is related to error component),
#P = seasonal AR order, D = seasonal differencing, Q = seasonal MA order,
#S = time span of repeating seasonal pattern,
#ARIMA model: (p,d,q) i.e. (2,1,1)
#(P,D,Q)S : (0,1,0)[12] specifies the seasonal part of the ARIMA model,
#12 is the number of periods in season
forecastAP <- forecast(arimaAP,level = c(95), h = 24) # h is the time period for 
                                                      #which we want to forecast
forecastAP

plot(forecastAP,xlab = "Date", ylab = "Passengers", main = "Forecast")

