eplana <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                     na.strings = "?")
eplana$Date <- as.Date(eplana$Date, format="%d/%m/%Y")
twodaydata <- eplana[(eplana$Date=="2007-02-01") | (eplana$Date=="2007-02-02"),]
twodaydata$Global_active_power <- as.numeric(as.character(twodaydata$Global_active_power))

twodaydata <- transform(twodaydata, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot2 <- function() {
  plot(twodaydata$timestamp,twodaydata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  }
plot2()