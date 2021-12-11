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


# Plot4 -------------------------------------------------------------------


png("plot4.png",width = 480,height = 480)

par(mfrow=c(2,2),
    mar=c(4,4,2,2),
    # mai=c(0.3,0.8,0.3,0.8),
    oma=c(0,1,0,1))

with(d1, plot(datetime, Global_active_power,type="l",
              xlab = "",
              ylab = "Global Active Power (kilowatts)"))

with(d1, plot(datetime,Voltage,type="l",
              ylab= "Volage"))

with(d1, plot(datetime, Sub_metering_1,type="l",col="black",
              xlab="",
              ylab="Energy sub metering"))
with(d1, lines(datetime, Sub_metering_2,col="red"))
with(d1, lines(datetime, Sub_metering_3,col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=1,cex = 1,y.intersp=1,xjust=-2,bty="n")

with(d1, plot(datetime,Global_reactive_power,type="l",
              ylab="Global Reactive Power (kilowatts)"))
par(mfrow=c(1,1),mar=c(5, 4, 4, 2) + 0.1)

dev.off()