eplana <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                     na.strings = "?")
eplana$Date <- as.Date(eplana$Date, format="%d/%m/%Y")
twodaydata <- eplana[(eplana$Date=="2007-02-01") | (eplana$Date=="2007-02-02"),]

str(twodaydata)
twodaydata <- transform(twodaydata, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
twodaydata$Global_active_power <- as.numeric(as.character(twodaydata$Global_active_power))
twodaydata$Global_reactive_power <- as.numeric(as.character(twodaydata$Global_reactive_power))
twodaydata$Voltage <- as.numeric(as.character(twodaydata$Voltage))

twodaydata$Sub_metering_1 <- as.numeric(as.character(twodaydata$Sub_metering_1))
twodaydata$Sub_metering_2 <- as.numeric(as.character(twodaydata$Sub_metering_2))
twodaydata$Sub_metering_3 <- as.numeric(as.character(twodaydata$Sub_metering_3))

plot4 <- function() {
  par(mfrow=c(2,2))
  
  ##PLOT 1
  plot(twodaydata$timestamp,twodaydata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  ##PLOT 2
  plot(twodaydata$timestamp,twodaydata$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##PLOT 3
  plot(twodaydata$timestamp,twodaydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(twodaydata$timestamp,twodaydata$Sub_metering_2,col="red")
  lines(twodaydata$timestamp,twodaydata$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) 
  
  #PLOT 4
  plot(twodaydata$timestamp,twodaydata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  #OUTPUT
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  
}
plot4()