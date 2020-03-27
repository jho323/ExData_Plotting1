library(tidyr)
library(dplyr)
library(lubridate)

consumption <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")

newData <- consumption %>% mutate(Date=as.character(dmy(as.character(Date)))) %>% filter(Date%in%c("2007-02-02","2007-02-01")) %>% mutate(Date=paste(Date,as.character(Time),sep=" ")) %>% mutate(Date=ymd_hms(Date))  %>% 
  mutate(Global_active_power=as.numeric(as.character(Global_active_power)))%>% mutate(Sub_metering_1=as.numeric(as.character(Sub_metering_1))) %>% mutate(Sub_metering_2=as.numeric(as.character(Sub_metering_2))) %>% 
  mutate(Sub_metering_3=as.numeric(as.character(Sub_metering_3))) %>% mutate(Global_reactive_power=as.numeric(as.character(Global_reactive_power))) %>% mutate(Voltage=as.numeric(as.character(Voltage)))

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))


with(newData,plot(Date,Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab="Date/Time"))
with(newData,plot(Date,Voltage,type = "l",ylab = "Voltage (Volts)",xlab="Date/Time"))

with(newData,plot(Date,Sub_metering_1,type = "l",ylab = "Energy Sub Metering",xlab="Date/Time"))
with(newData,lines(Date,Sub_metering_2,col="red"))
with(newData,lines(Date,Sub_metering_3,col="blue"))
legend("topright", pch = 15, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

with(newData,plot(Date,Global_reactive_power,type = "l",ylab = "Global Reactive Power (kilowatts)",xlab="Date/Time"))

dev.copy(png, file = "plot4.png")


dev.off()