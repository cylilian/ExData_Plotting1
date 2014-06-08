setwd("C:/Users/yanyan/Documents/R/data")

if (!file.exists("household_power_consumption")) {
    if (!file.exists("exdata_data_household_power_consumption.zip")) {
        stop("was expecting power consumption txt or zip file")
        } else {
        unzip("exdata_data_household_power_consumption.zip")
        }
    }

library(data.table)
###read data from 2007-02-01 to 2007-02-02
data=fread("household_power_consumption.txt",nrows=2880,skip="1/2/2007",na.strings="?")

###read data with colnames
data1=fread("household_power_consumption.txt",nrows=2)
###pass colnames to data
setnames(data,colnames(data),colnames(data1))

newDate=strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

png("plot1.png",width=480,height=480,units="px")
hist(data$Global_active_power,col="red",main = "Global Active Power",xlab= "Global Active Power (kilowatts)")
dev.off()


