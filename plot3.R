library(tidyr)
library(dplyr)
library(lubridate)

consumption <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")

newData <- consumption %>% mutate(Date=as.character(dmy(as.character(Date)))) %>% filter(Date%in%c("2007-02-02","2007-02-01")) %>% mutate(Date=paste(Date,as.character(Time),sep=" ")) %>% mutate(Date=ymd_hms(Date))  %>% 
  mutate(Global_active_power=as.numeric(as.character(Global_active_power)))%>% mutate(Sub_metering_1=as.numeric(as.character(Sub_metering_1))) %>% mutate(Sub_metering_2=as.numeric(as.character(Sub_metering_2))) %>% mutate(Sub_metering_3=as.numeric(as.character(Sub_metering_3)))

with(newData,plot(Date,Sub_metering_1,type = "l",ylab = "Energy Sub Metering",xlab=" "))
with(newData,lines(Date,Sub_metering_2,col="red"))
with(newData,lines(Date,Sub_metering_3,col="blue"))
legend("topright", pch = 15, col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file = "plot3.png")


dev.off()