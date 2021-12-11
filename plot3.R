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


# Plot3 -------------------------------------------------------------------


png("plot3.png",width = 480,height = 480)

with(d1, plot(datetime, Sub_metering_1,type="l",col="black",
              xlab="",
              ylab="Energy sub metering"))
with(d1, lines(datetime, Sub_metering_2,col="red"))
with(d1, lines(datetime, Sub_metering_3,col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=1,cex = 0.8,y.intersp=0.5,xjust=-2)

dev.off()