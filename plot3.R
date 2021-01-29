

dataplot3 <- read.csv("household_power_consumption.txt",header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

subset3 <- subset(dataplot3, dataplot3$Date =="1/2/2007" | dataplot3$Date == "2/2/2007",)
datetime2 <-strptime(paste(subset3$Date, subset3$Time, sep = " "), "%d/%m/%Y %T")
globalactivepower <- as.numeric(subset3$Global_active_power)
Sub_metering_1 <- as.numeric(subset3$Sub_metering_1)
Sub_metering_2 <- as.numeric(subset3$Sub_metering_2)
Sub_metering_3 <- as.numeric(subset3$Sub_metering_3)

png("png3.png", width = 480, height = 480)
plot(datetime2, Sub_metering_1, type = "s", ylab = "Energy Sub metering", xlab = "" )
lines(datetime2,Sub_metering_2, type = "s", col = "red")
lines(datetime2,Sub_metering_3, type = "s", col = "blue")
legend("topright", col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd=2.5)
dev.off()
