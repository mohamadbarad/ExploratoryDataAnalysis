rm(list=ls())
graphics.off()
Sys.setlocale("LC_TIME", "English")
# dev.off()
# 
d <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",
                header=TRUE,sep = ";")
d$Date <- as.Date(d$Date, format="%d/%m/%Y")


d1 <- subset(d,Date >= "2007-02-01" & Date < "2007-02-03")
d1$Global_active_power <- as.numeric(d1$Global_active_power)
d1$Global_reactive_power <- as.numeric(d1$Global_reactive_power)

d1$datetime <- paste(d1$Date,d1$Time)
d1$datetime <- strptime(d1$datetime, format = "%Y-%m-%d %H:%M:%S")


# Plot1 -------------------------------------------------------------------

png("plot1.png",width = 480,height = 480)

hist(d1$Global_active_power,col="red", xlab = "Global Active Power (kilowatts)",
           main = "Global Active Power")

dev.off()