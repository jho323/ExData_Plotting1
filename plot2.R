library(tidyr)
library(dplyr)
library(lubridate)

consumption <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")

newData <- consumption %>% mutate(Date=as.character(dmy(as.character(Date)))) %>% filter(Date%in%c("2007-02-02","2007-02-01")) %>% mutate(Date=paste(Date,as.character(Time),sep=" ")) %>% mutate(Date=ymd_hms(Date))  %>% mutate(Global_active_power=as.numeric(as.character(Global_active_power)))

with(newData,plot(Date,Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab=" "))

dev.copy(png, file = "plot2.png")


dev.off()

