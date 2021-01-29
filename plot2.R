#For some reason my R type functiios has ="s" make a line instead of ="1"

dataplot2 <- read.csv("household_power_consumption.txt", na.strings = "?")
subsetdata2 <- subset(dataplot2, dataplot2$Date == "1/2/2007" | dataplot2$Date == "2/2/2007", )

datetime <- strptime(paste(subsetdata2$Date, subsetdata2$Time, sep = " "), "%d/%m/%Y %T")
globalactivepower <- as.numeric(subsetdata2$Global_active_power)


png("plot2.png", width = 480, height = 480)
plot(datetime, globalactivepower, type = "s", xlab = "", ylab = "Global active poewr (Killowats)")
dev.off()
