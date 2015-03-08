eplana <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                     na.strings = "?")
eplana$Date <- as.Date(eplana$Date, format="%d/%m/%Y")
twodaydata <- eplana[(eplana$Date=="2007-02-01") | (eplana$Date=="2007-02-02"),]

twodaydata <- transform(twodaydata, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

twodaydata$Sub_metering_1 <- as.numeric(as.character(twodaydata$Sub_metering_1))
twodaydata$Sub_metering_2 <- as.numeric(as.character(twodaydata$Sub_metering_2))
twodaydata$Sub_metering_3 <- as.numeric(as.character(twodaydata$Sub_metering_3))

plot3 <- function() {
  plot(twodaydata$timestamp,twodaydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(twodaydata$timestamp,twodaydata$Sub_metering_2,col="red")
  lines(twodaydata$timestamp,twodaydata$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  dev.copy(png, file="plot3.png", width=560, height=560)
  dev.off()

}
plot3()