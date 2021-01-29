dataplot4 <- read.csv("household_power_consumption.txt", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

subset4 <- subset(dataplot4, dataplot4$Date == "1/2/2007" | dataplot4$Date == "2/2/2007", )

datetime4 <- strptime(paste(subset4$Date, subset4$Time, sep = " "), "%d/%m/%Y %T")
globalactivepower <- as.numeric(subset4$Global_active_power)
submetering1 <- as.numeric(subset4$Sub_metering_1)
submetering2 <- as.numeric(subset4$Sub_metering_2)
submetering3 <- as.numeric(subset4$Sub_metering_3)
Voltage <- as.numeric(subset4$Voltage)
globalreactivepower <- as.numeric(subset4$Global_reactive_power)

png("plot4.png", width = 480, height = 480) 
par(mfrow = c(2,2))
plot(datetime4, globalactivepower, type = "s", xlab = "", ylab = "Global Active Power")
plot(datetime4, Voltage, type = "s", xlab = "datetime", ylab = "Voltage")
plot(datetime4, submetering1, type = "s", xlab = "", ylab = "Energy sub metering")
lines(datetime4, submetering2,type = "s", col = "red")
lines(datetime4, submetering3, type = "s", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black","red","blue"))
plot(datetime4,globalreactivepower, type = "s", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()

