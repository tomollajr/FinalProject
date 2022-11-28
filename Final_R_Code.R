#Final Project R File 

#Import using read csv
dataset <- read.csv("https://raw.githubusercontent.com/TarekDib03/Analytics/master/Week2%20-%20Linear%20Regression/Data/climate_change.csv")

#Example 1 
#One data set to represent historical data
climate_history = subset(dataset,Year <= 2005)
#One data set to represent more recent data
climate_recent = subset(dataset,Year > 2005)

#Linear Model Function for climate history data set
climate_lm = lm (Temp ~ MEI + CO2 + CH4 + N2O + CFC.11 + CFC.12 + TSI + Aerosols, data=climate_history)
climate_lm_recent = lm (Temp ~ MEI + CO2 + CH4 + N2O + CFC.11 + CFC.12 + TSI + Aerosols, data=climate_recent)
#Summary of this data 
summary(climate_lm)
#summary(climate_lm_recent)

#In the console, you see a significant value for CFC.11 or Trichlorofluoromethane. 
#A class one ozone-depleting gas. Let's use it.
cor(climate_history$Temp,climate_history$CFC.11)
cor(climate_recent$Temp,climate_recent$CFC.11)
#Not a significant rise in Temp when correlated to CFC.11

plot(climate_history$Temp,climate_history$CFC.11)
plot(dataset$Year,dataset$CFC.11)
plot(dataset$Year,dataset$CO2)
plot(dataset$Year,dataset$CH4)

#Find highest correlation of temp to gas
cor(dataset$Temp,dataset$MEI) #.13
cor(dataset$Temp,dataset$CO2) #.74
cor(dataset$Temp,dataset$CH4) #.69
cor(dataset$Temp,dataset$N2O) #.74
cor(dataset$Temp,dataset$CFC.11) #.38
cor(dataset$Temp,dataset$CFC.12) #.68
cor(dataset$Temp,dataset$TSI) #.18
cor(dataset$Temp,dataset$Aerosols) #-.39

plot(dataset$Temp,dataset$N2O)
# Highest correlation. As N2O increases, so does temp
plot(dataset$Year,dataset$N2O)
# A graphic of the increase of N2O over the years 
# One pound of N2O warms the atmosphere about 300 times the amount that one pound of carbon dioxide does over a 100 year timescale. 
# Its potency and relatively long life make N2O a dangerous contributor to climate change.


