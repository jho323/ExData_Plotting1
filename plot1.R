library(tidyr)
library(dplyr)
library(lubridate)

consumption <- read.table("household_power_consumption.txt",header = TRUE,sep = ";")

newData <- consumption %>% mutate(Date=as.character(dmy(as.character(Date)))) %>% filter(Date%in%c("2007-02-02","2007-02-01"))%>% mutate(Global_active_power=as.numeric(as.character(Global_active_power)))

hist(newData$Global_active_power,xlab = "Global Active Power (kilowatts)",col = "red",main = "Global Active Power",breaks = 15)

dev.copy(png, file = "plot1.png")


dev.off()