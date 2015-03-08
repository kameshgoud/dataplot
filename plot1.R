eplana <- read.table("household_power_consumption.txt", header=T, sep=";")

mem_use <- nrow(eplana) * ncol(eplana) * 8
print(mem_use)

eplana$Date <- as.Date(eplana$Date, format = "%d/%m/%Y")
twodaydata <- subset(eplana, eplana$Date == as.Date("2007-02-01") | eplana$Date == as.Date("2007-02-02"))
twodaydata $Global_active_power <- as.numeric(as.character(twodaydata $Global_active_power))


hist((as.numeric(twodaydata$Global_active_power)), col="red", main = "Global Active Power",xlab="Global Active Power(kilowatts)")
dev.copy(png,'plot1.png')
dev.off()
